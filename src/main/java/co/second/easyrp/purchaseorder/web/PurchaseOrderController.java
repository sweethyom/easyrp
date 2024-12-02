package co.second.easyrp.purchaseorder.web;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.invoice.service.InvoiceService;
import co.second.easyrp.product.service.ProductService;
import co.second.easyrp.purchaseorder.service.PurchaseOrderService;
import co.second.easyrp.purchaseorder.service.PurchaseOrderVO;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailService;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

@Controller
public class PurchaseOrderController {
	@Autowired
	private PurchaseOrderService purchaseOrderService;
	@Autowired
	private PurchaseOrderDetailService purchaseOrderDetailService;
	@Autowired
	private ProductService productService;
	@Autowired
	private InventoryService inventoryService;
	@Autowired
	private InvoiceService invoiceService;
	
	//발주관리 페이지로 이동 + 발주목록
	//하서현
	@RequestMapping("/purchaseordermgmttable")
	public String purchaseOrderList(Model model, PurchaseOrderVO vo) {
		List<Map<String, Object>> returnList = purchaseOrderService.poMgmtListPaged(vo); 
		int totalRecords = purchaseOrderService.countPoMgmtList(vo);
		int totalPages = (int) Math.ceil((double) totalRecords / vo.getSize());
		int pageGroupSize = 10;
		int currentPageGroup = (vo.getPage() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		model.addAttribute("poMgmtList", returnList); //발주목록에 뿌려줄 리스트 반환
		model.addAttribute("vo", vo); //검색조건 및 현재페이지 반환
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/purchaseorder/purchaseordermgmttable";
	}
	
	//발주등록 페이지로 이동
	//하서현
	@RequestMapping("/purchaseordermgmtinsert")
	public String purchaseordermgmtinsert(Model model) {
		model.addAttribute("taxDivList", purchaseOrderService.taxDivList());
		return "easyrp/purchaseorder/purchaseordermgmtinsert";
	}
	
	//발주등록
	//하서현
	@PostMapping("/purchaseorderinsertfn")
	public String purchaseorderinsertfn(Model model, PurchaseOrderVO poVO) {
		String poCod = purchaseOrderService.newPoCod();
		int poDetailNum = 1;
		poVO.setCod(poCod);
		purchaseOrderService.insertPo(poVO);
		for (PurchaseOrderDetailVO poDetailVO : poVO.getPoDetailList()) {
			poDetailVO.setPurchaseorderCod(poCod);
			poDetailVO.setNum(poDetailNum);
			purchaseOrderDetailService.insertPoDetail(poDetailVO);
			poDetailNum++;
		}
		return "redirect:/purchaseordermgmttable";
	}
	
	//특정 발주데이터를 보내주는 메소드
	//하서현
	@PostMapping("/ajaxSelectPo")
	@ResponseBody
	public Map<String, Object> ajaxSelectPo(String key) {
		Map<String, Object> returnVO = purchaseOrderService.selectPo(key);
		return returnVO;
	}
	
	//과세구분 리스트를 보내주는 메소드
	//하서현
	@PostMapping("/taxDivList")
	@ResponseBody
	public List<Map<String, Object>> taxDivList() {
		List<Map<String, Object>> taxDivList = purchaseOrderService.taxDivList();
		return taxDivList;
	}
	
	//발주정보를 수정하는 메소드
	//하서현
	@PostMapping("/ajaxPoUpdate")
	@ResponseBody
	public int ajaxPoUpdate(@RequestBody PurchaseOrderVO poVO) {
		int returnInt = 0;
		System.out.println(poVO);
		Map<String, Object> prevPoVO = purchaseOrderService.selectPo(poVO.getCod()); // 기존 발주정보
		List<Map<String, Object>> poDetailList = purchaseOrderDetailService.poDetailListByPoCod(poVO.getCod()); //기존 발주상세리스트
		
		//업데이트 객체에 입고일이 들어가있고 기존객체에도 입고일이 있을때.(재고량을 되돌리고 새롭게 입고처리 해주기)
		if(!poVO.getIboundDate().isEmpty() && !String.valueOf(prevPoVO.get("ibound_date")).equals("null")) {
			for (Map<String, Object> poDetailVO : poDetailList) {
				if(!String.valueOf(poDetailVO.get("product_cod")).equals("null")) {
					//제품의 현재고량 감소(되돌리기)
					productService.updateCurInvQtyFromPrd(-(int)poDetailVO.get("inv_qty"), String.valueOf(poDetailVO.get("product_cod")));
				} else {
					//자재의 현재고량 감소(되돌리기)
					inventoryService.updateCurInvQtyFromInv(-(int)poDetailVO.get("inv_qty"), String.valueOf(poDetailVO.get("inventory_cod")));
				}
			}
			
			for (PurchaseOrderDetailVO poDetailVO : poVO.getPoDetailList()) {
				if(!String.valueOf(poDetailVO.getProductCod()).equals("null")) {
					//제품의 현재고량 증가
					productService.updateCurInvQtyFromPrd((int)poDetailVO.getInvQty(), String.valueOf(poDetailVO.getProductCod()));
				} else {
					//자재의 현재고량 증가
					inventoryService.updateCurInvQtyFromInv((int)poDetailVO.getInvQty(), String.valueOf(poDetailVO.getInventoryCod()));
				}
			}
		}
		
		//업데이트 객체에 입고일이 들어가있고 기존 객체에 입고일이 없을경우 재고량 증가(입고처리)
		if(!poVO.getIboundDate().isEmpty() && String.valueOf(prevPoVO.get("ibound_date")).equals("null")) {
			for (PurchaseOrderDetailVO poDetailVO : poVO.getPoDetailList()) {
				if(!String.valueOf(poDetailVO.getProductCod()).equals("null")) {
					//제품의 현재고량 증가
					productService.updateCurInvQtyFromPrd((int)poDetailVO.getInvQty(), String.valueOf(poDetailVO.getProductCod()));
				} else {
					//자재의 현재고량 증가
					inventoryService.updateCurInvQtyFromInv((int)poDetailVO.getInvQty(), String.valueOf(poDetailVO.getInventoryCod()));
				}
			}
		}
		
		//업데이트 객체에 입고일이 없고 기존객체에 입고일이 있을경우 재고량 되돌리기
		if(poVO.getIboundDate().isEmpty() && !String.valueOf(prevPoVO.get("ibound_date")).equals("null")) {
			for (Map<String, Object> poDetailVO : poDetailList) {
				if(!String.valueOf(poDetailVO.get("product_cod")).equals("null")) {
					//제품의 현재고량 감소(되돌리기)
					productService.updateCurInvQtyFromPrd(-(int)poDetailVO.get("inv_qty"), String.valueOf(poDetailVO.get("product_cod")));
				} else {
					//자재의 현재고량 감소(되돌리기)
					inventoryService.updateCurInvQtyFromInv(-(int)poDetailVO.get("inv_qty"), String.valueOf(poDetailVO.get("inventory_cod")));
				}
			}
		}
		
		returnInt = purchaseOrderService.updatePo(poVO);
		returnInt = purchaseOrderService.updateIboundDateClosingDateDdayNote(poVO);
		returnInt = purchaseOrderDetailService.delPoDetailAll(poVO);

		int poDetailNum = 1;
		for (PurchaseOrderDetailVO poDetailVO : poVO.getPoDetailList()) {
			poDetailVO.setPurchaseorderCod(poVO.getCod());
			poDetailVO.setNum(poDetailNum);
			returnInt = purchaseOrderDetailService.insertPoDetail(poDetailVO);
			poDetailNum++;
		}

		returnInt = invoiceService.updateIboundynOrProdReady();

		return returnInt;
	};
	
	//특정한 발주건에 대하여 입고처리를 하는 메소드
	//하서현
	@PostMapping("/iboundregis")
	@ResponseBody
	public int iboundRegis(PurchaseOrderVO poVO) {
		int returnInt = 0;
		Map<String, Object> prevPoVO = purchaseOrderService.selectPo(poVO.getCod());
		List<Map<String, Object>> poDetailList = purchaseOrderDetailService.poDetailListByPoCod(poVO.getCod());
		
		//업데이트 객체에 입고일이 들어가있고 기존 객체에 입고일이 없을경우 재고량 증가
		if(!poVO.getIboundDate().isEmpty() && String.valueOf(prevPoVO.get("ibound_date")).equals("null")) {
			for (Map<String, Object> poDetailVO : poDetailList) {
				if(!String.valueOf(poDetailVO.get("product_cod")).equals("null")) {
					//제품의 현재고량 증가
					productService.updateCurInvQtyFromPrd((int)poDetailVO.get("inv_qty"), poDetailVO.get("product_cod").toString());
				} else {
					//자재의 현재고량 증가
					System.out.println(poDetailVO);
					inventoryService.updateCurInvQtyFromInv((int)poDetailVO.get("inv_qty"), poDetailVO.get("inventory_cod").toString());
				}
			}
		}
		poVO.setStateCod(203);
		returnInt = purchaseOrderService.updatePo(poVO);

		invoiceService.updateIboundynOrProdReady();

		return returnInt;
	};
	
	//특정한 발주건을 삭제하는 메소드
	//하서현
	@PostMapping("/deletepo")
	@ResponseBody
	public int deletePo(PurchaseOrderVO poVO) {
		System.out.println(poVO);
		int returnInt = 0;
		returnInt = purchaseOrderService.updatePo(poVO);
		return returnInt;
	};
}