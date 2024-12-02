package co.second.easyrp.invoice.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.invoice.service.InvoiceService;
import co.second.easyrp.invoice.service.InvoiceVO;
import co.second.easyrp.invoice.service.SearchVO;
import co.second.easyrp.invoicedetail.service.InvoicedetailService;
import co.second.easyrp.invoicedetail.service.InvoicedetailVO;
import co.second.easyrp.mrp.service.MrpService;
import co.second.easyrp.mrp.service.MrpVO;

@Controller
public class InvoiceController {
	@Autowired InvoiceService invoiceService;
	@Autowired InvoicedetailService invoicedetailService;
	@Autowired MrpService mrpService;
	@Autowired InventoryService inventoryService;
	
	
	@GetMapping("invoicemanagement")
	public String invoiceManagement(SearchVO searchVo, Model model) {
		List<InvoiceVO> invoiceTable = invoiceService.selectInvoiceAll(searchVo);
        int totalRecords = invoiceService.countInvoiceTables(searchVo);
        int size = searchVo.getPageSize();
        int page = searchVo.getOffset();
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        int pageGroupSize = 10;
        int currentPageGroup = (page - 1) / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize + 1;
        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
        
        //페이지 새로고침 할때마다 각 청구건에 대한 생산가능 여부를 계산한다.
        //생산가능여부 시작
        
        //행의 수(청구건 수)만큼 계산한다.
        for(int k=0; k<invoiceTable.size(); k++) { 
        	int count2 = 0;
        	InvoiceVO invoiceVo = new InvoiceVO();
        	invoiceVo.setCod(invoiceTable.get(k).getCod());
        	invoiceVo.setInvClass(invoiceTable.get(k).getInvClass());
    		
    		List<InvoicedetailVO> invoicedetailList = new ArrayList<>();
    		InvoicedetailVO a = new InvoicedetailVO(); 
    		a.setInvoiceCod(invoiceVo.getCod());
    		invoicedetailList = invoicedetailService.selectInvoicedetailByInvoiceCod(a);
    		//List<String> mrpCodList = new ArrayList<>();
			
    		//하나의 청구에 대한 청구상세 수만큼 계산한다.
    		int count1 = 0;
    		for(int i=0; i<invoicedetailList.size(); i++) {
    			MrpVO mrpVo = new MrpVO(); 
    			List<MrpVO> bomList = new ArrayList<MrpVO>();
    			mrpVo.setCod(invoicedetailList.get(i).getMrpCod());
    			mrpVo = mrpService.mrpSelect(mrpVo); 
    			count1 = 0;
    			
    			InvoicedetailVO invoicedetailVo = new InvoicedetailVO();
    			invoicedetailVo.setNum(invoicedetailList.get(i).getNum());
    			invoicedetailVo.setInvoiceCod(invoicedetailList.get(i).getInvoiceCod());
    			invoicedetailVo.setProductCod(invoicedetailList.get(i).getProductCod());
    			invoicedetailVo.setInvQty(invoicedetailList.get(i).getInvQty());
    			
    			//하나의 제품에 들어가는 자재가 충분한지 계산한다.
    			if(invoiceVo.getInvClass().equals("생산")) {
    				//System.out.println(invoiceVo.getCod());
    				bomList = mrpService.selectBom(invoicedetailVo.getProductCod());
    				//System.out.println("bomlist: " + bomList);
    				for(int j=0; j<bomList.size(); j++) {
    					int requiredQty = bomList.get(j).getInvQty() * invoicedetailVo.getInvQty();
    					//System.out.println("필요수량: " + requiredQty);
    					int availableQty = inventoryService.selectInventoryQty(bomList.get(j).getInvCod());
    					//System.out.println("가용재고: " + availableQty);
    					if(requiredQty <= availableQty) { //필요수량보다 가용재고가 많거나 같으면
    						count1++; //count를 증가시킨다.
    						//System.out.println("count1: " + count1);
    					}
    					if(bomList.size() == count1) {
    						//System.out.println("count2 증가 전: " + count2);
    						count2++;
    						//System.out.println("count2 증가");
    						//System.out.println("count2: " + count2);
    					}
    		    	}
    				//System.out.println("invoicedetailList.size: " + invoicedetailList.size());
    				//System.out.println("count2: " + count2);
    			if(count2 == invoicedetailList.size()) {
    				invoiceVo.setProdReady("Y");
    				invoiceService.updateInvoice(invoiceVo);
    			}else {
    				invoiceVo.setProdReady("N");
    				invoiceService.updateInvoice(invoiceVo);
    				}
    			}
    		}
        }
        
		//생산가능여부 끝 

        model.addAttribute("search", searchVo);
        model.addAttribute("invoiceTable", invoiceTable);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        model.addAttribute("endPage", endPage);
        model.addAttribute("startPage", startPage);
        
		return "easyrp/invoice/invoicemgmt";
	}
	
	@RequestMapping("invoiceinsert")
	public String invoiceInsert() {
		return "easyrp/invoice/invoiceinsert";
	}
	
	@RequestMapping("invoiceinsertfn")
	public String invoiceInsertfn(InvoiceVO invoiceVo, @RequestParam(value="mrpCod") String[] mrpCodList) {
		int maxNumber = invoiceService.selectMaxCod() + 1;
		String newCode = String.format("%03d", maxNumber);
		String invoiceCode = "inv" + newCode;
		invoiceVo.setCod(invoiceCode);
        int count2 = 0;
		
		List<InvoicedetailVO> invoicedetailList = new ArrayList<>();
		for(int i=0; i<mrpCodList.length; i++) {
			MrpVO mrpVo = new MrpVO(); 
			List<MrpVO> bomList = new ArrayList<MrpVO>();
			mrpVo.setCod(mrpCodList[i]);
			mrpVo = mrpService.mrpSelect(mrpVo);
			int count1 = 0; //생산할 수 있는 청구상세 행의 개수
			
			InvoicedetailVO invoicedetailVo = new InvoicedetailVO();
			invoicedetailVo.setNum(i+1);
			invoicedetailVo.setInvoiceCod(invoiceCode);
			invoicedetailVo.setMrpCod(mrpVo.getCod());
			invoicedetailVo.setInvQty(mrpVo.getQty());
			invoicedetailVo.setUnitprice(mrpVo.getUnitprice());
			invoicedetailVo.setSupprice((int)Math.ceil(mrpVo.getUnitprice()*1.1));
			invoicedetailVo.setVax(10);
			invoicedetailVo.setTotal(mrpVo.getQty() * (int)Math.ceil(mrpVo.getUnitprice()*1.1));
			invoicedetailVo.setProductCod(mrpVo.getProductCod());
			invoicedetailVo.setInventoryCod(mrpVo.getInventoryCod());
			if(mrpVo.getInventoryCod() == null) {
				invoicedetailVo.setInvMgmtQty(((int)Math.ceil(mrpVo.getQty() / mrpVo.getInvoiceAmount()))+1);
			}else {
				invoicedetailVo.setInvMgmtQty(((int)Math.ceil(mrpVo.getQty() / mrpVo.getInvoiceUnitAmount()))+1);
			}
			if(invoiceVo.getInvClass().equals("생산")) {
				bomList = mrpService.selectBom(invoicedetailVo.getProductCod());
				for(int j=0; j<bomList.size(); j++) {
					int requiredQty = bomList.get(j).getInvQty() * invoicedetailVo.getInvQty();
					int availableQty = inventoryService.selectInventoryQty(bomList.get(j).getInvCod());
					if(requiredQty <= availableQty) { //필요수량보다 가용재고가 많거나 같으면
						count1++; //count를 증가시킨다.
					}
					if(bomList.size() == count1) {
						count2++;
					}
		    	}
			}
			if(count2 == mrpCodList.length) {
				invoiceVo.setProdReady("Y");
			}else {
				invoiceVo.setProdReady("N");
			}
			invoicedetailList.add(invoicedetailVo);
		}
		
		invoiceService.insertInvoice(invoiceVo);
		
		for(int i=0; i<invoicedetailList.size(); i++) {
			invoicedetailService.insertInvoicedetail(invoicedetailList.get(i));
			invoiceService.mrpClosingUpdateToY(invoicedetailList.get(i));
		}
		
		return "redirect:/invoicemanagement";
	}
	
	@GetMapping("invoicedeletefn")
	public String invoiceDeleteFn(InvoiceVO invoiceVo, @RequestParam("cod") String cod) {
		invoiceVo.setCod(cod);
		InvoicedetailVO invoicedetailVo = new InvoicedetailVO();
		invoicedetailVo.setInvoiceCod(invoiceVo.getCod());
		List<InvoicedetailVO> invoicedetailList = invoicedetailService.selectInvoicedetailByInvoiceCod(invoicedetailVo);
		System.out.println(invoicedetailList);
		
		for(int i=0; i<invoicedetailList.size(); i++) {
			invoiceService.mrpClosingUpdateToN(invoicedetailList.get(i));
		}
		invoiceService.deleteInvoice(invoiceVo);
		invoicedetailService.deleteInvoicedetail(invoicedetailVo);
		return "redirect:/invoicemanagement";
	}
	
	// 소요량 전개 리스트를 가져온다.
	@GetMapping("/api/get-mrpval")
	@ResponseBody
	public List<MrpVO> getMrpValues(){
		return mrpService.mrpSelectListAllModal();
	}
	
	// 특정 소요량 전개 리스트를 가져온다.
	@GetMapping("/api/get-mrpselectbycodval")
	@ResponseBody
	public List<MrpVO> getMrpValuesSelectByCod(@RequestParam(value="mrpCodList") String[] mrpCodList){
		List<MrpVO> mrpList = new ArrayList<>();
		for(int i=0; i<mrpCodList.length; i++) {
			MrpVO mrpVo = new MrpVO();
			mrpVo.setCod(mrpCodList[i]);
			mrpVo = mrpService.mrpSelect(mrpVo);
			mrpList.add(mrpVo);
		}
		return mrpList; 
	}
}
