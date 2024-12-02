package co.second.easyrp.purchaseorderdetail.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.invoice.service.InvoiceService;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailService;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

@Controller
public class PurchaseOrderDetailController {
	@Autowired
	private PurchaseOrderDetailService purchaseOrderDetailService;
	@Autowired
	private InvoiceService invoiceService;

	@PostMapping("/ajaxPoDetailList")
	@ResponseBody
	public List<Map<String, Object>> ajaxPoDetailList(String poCod) {
		List<Map<String, Object>> returnList = purchaseOrderDetailService.poDetailListByPoCod(poCod);
		return returnList;
	}
	
	@PostMapping("/delPoDetailFn")
	@ResponseBody
	public int delPoDetailFn(String poCod, int num) {
		int returnInt = purchaseOrderDetailService.delPoDetail(poCod, num);
		invoiceService.updateIboundynOrProdReady();
		return returnInt;
	}
}
