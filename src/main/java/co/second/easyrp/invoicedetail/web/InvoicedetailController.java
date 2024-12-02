package co.second.easyrp.invoicedetail.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.inventorymgmt.service.InventoryMgmtService;
import co.second.easyrp.inventorymgmt.service.InventoryMgmtVO;
import co.second.easyrp.invoice.service.InvoiceService;
import co.second.easyrp.invoicedetail.service.InvoicedetailService;
import co.second.easyrp.invoicedetail.service.InvoicedetailVO;
import co.second.easyrp.mrp.service.MrpService;
import co.second.easyrp.mrp.service.MrpVO;
import co.second.easyrp.orderdetail.service.OrderdetailVO;
import co.second.easyrp.productmgmt.service.ProductMgmtService;
import co.second.easyrp.productmgmt.service.ProductMgmtVO;

@Controller
public class InvoicedetailController {
	@Autowired
	private InvoicedetailService invoicedetailService;
	@Autowired InvoiceService invoiceService;
	@Autowired MrpService mrpService;
	@Autowired ProductMgmtService productMgmtService;
	@Autowired InventoryMgmtService inventoryMgmtService;
	
	//청구적용 Modal에 뿌려줄 승인된 청구리스트를 보내주는 메소드
	@GetMapping("/applyInvoice")
	@ResponseBody
	public List<Map<String, Object>> applyInvoice() {
		List<Map<String, Object>> returnList = invoicedetailService.applyInvoice();
		
		return returnList;
	}
	
	@GetMapping("/api/get-invoicedetail")
	@ResponseBody
	public Map<String, Object> getInvoicedetailValue(@RequestParam(value="invoiceCod") String invoiceCod){
		InvoicedetailVO invoicedetailVo = new InvoicedetailVO();
		invoicedetailVo.setInvoiceCod(invoiceCod);
		
		Map<String, Object> response = new HashMap<>();
		response.put("invoicedetailList", invoicedetailService.selectInvoicedetailByInvoiceCod(invoicedetailVo));
		return response;
	}
	
	// 청구를 수정한다.
	@RequestMapping("update-invoicedetail")
	@ResponseBody
	public String updateInvoicedetail(@RequestParam("cod") String cod,
			 					@RequestParam("num") int num,
			 					@RequestParam("qty") int qty) {
		String result = "ok";
		InvoicedetailVO invoicedetailVo = new InvoicedetailVO();
		invoicedetailVo.setInvoiceCod(cod);
		invoicedetailVo.setNum(num);
		invoicedetailVo.setInvMgmtQty(qty);
		System.out.println(invoicedetailVo);
		invoicedetailService.updateInvoicedetail(invoicedetailVo);
		
		return result;
	}
	
	@RequestMapping("productionfn")
	public String productionFn(@RequestParam(value="cod") String invCod) {
		System.out.println("cod: " + invCod);
		List<InvoicedetailVO> invoicedetailList = new ArrayList<>();
		InvoicedetailVO invoicedetailVo = new InvoicedetailVO();
		invoicedetailVo.setInvoiceCod(invCod);
		invoicedetailList = invoicedetailService.selectInvoicedetailByInvoiceCod(invoicedetailVo);
		List<MrpVO> bomList = new ArrayList<MrpVO>();
		
		for(int i = 0; i < invoicedetailList.size(); i++) {
			bomList = mrpService.selectBom(invoicedetailList.get(i).getProductCod());
			for(int j = 0; j < bomList.size(); j++) {
				String productCod, inventoryCod;
				int productQty, inventoryQty;
				
				productCod = bomList.get(j).getProdCod();
				inventoryCod = bomList.get(j).getInventoryCod();
				productQty = invoicedetailList.get(i).getInvQty();
				inventoryQty = bomList.get(j).getInvQty() * productQty; // 한 제품을 만드는데 필요한 자재 수 * 청구된 제품 수량
				
				//product에서 완제품 증가
				if(j==0) {
					ProductMgmtVO productMgmtVo = new ProductMgmtVO();
					productMgmtVo = productMgmtService.getData(productCod);
					int curProductQty = productMgmtVo.getCurInvQty(); //현재고량
					productQty += curProductQty; //생산예정량 + 현재고량
					productMgmtVo.setCurInvQty(productQty);
					productMgmtVo.setCurInvPrice(productQty * productMgmtVo.getUnitprice());
					productMgmtService.updateFn(productMgmtVo);
				}
				
				//orderdetail에 state를 생산완료(105)로 변경
				OrderdetailVO orderdetailVo = invoicedetailService.selectOrderdetailByInvoice(invCod, invoicedetailList.get(i).getNum());
				String orderCod = orderdetailVo.getCod();
				int orderNum = orderdetailVo.getNum();
				invoicedetailService.updateOrderdetailDeliveryState(orderCod, orderNum, 105);
				
				//inventory에서 자재 차감
				InventoryMgmtVO inventoryVo = new InventoryMgmtVO();
				inventoryVo = inventoryMgmtService.getData(inventoryCod);
				int curInventoryQty = inventoryVo.getCurInvQty(); //현재고량
				System.out.println("현재고량: " + curInventoryQty);
				inventoryQty = curInventoryQty-inventoryQty; //현재고량 - 차감예정량
				inventoryVo.setCurInvQty(inventoryQty);
				System.out.println("차감후 재고량: " + inventoryQty);
				inventoryVo.setCurInvPrice(inventoryQty * inventoryVo.getUnitprice());
				inventoryMgmtService.qtyupdateFn(inventoryVo);
				
				//invoice 마감여부 변경
				invoiceService.updateInvoiceClosing(invCod);
				System.out.println("cod: " + invCod);
			}
		}
		return "redirect:/invoicemanagement";
	}
}

