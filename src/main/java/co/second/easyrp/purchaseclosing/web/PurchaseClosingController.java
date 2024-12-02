package co.second.easyrp.purchaseclosing.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.purchaseclosing.service.PurchaseClosingService;
import co.second.easyrp.purchaseclosing.service.PurchaseClosingVO;
import co.second.easyrp.purchaseclosing.service.SearchVO;

@Controller
public class PurchaseClosingController {
	@Autowired PurchaseClosingService purchaseClosingService;
	
	@GetMapping("/purchaseclosing")
	public String purchaseClosing(SearchVO searchVO, Model model, @RequestParam(defaultValue = "1") int page) {
		searchVO.setOffset((page - 1) * searchVO.getPageSize());
		
		List<PurchaseClosingVO> purchaseClosing = purchaseClosingService.tableAllList(searchVO);
		
		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = purchaseClosingService.countTable(searchVO);
		
		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / searchVO.getPageSize());
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (searchVO.getPageSize() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("searchVO", searchVO);
		model.addAttribute("purchaseClosing", purchaseClosing);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		return "easyrp/purchaseclosing/purchaseclosing";
	}
	
	@PostMapping("/purchaseclosingupdate")
	public String purchseClosingUpdate(PurchaseClosingVO purchaseClosingVO) {
		for (PurchaseClosingVO purchaseClosing : purchaseClosingVO.getRowPurchaseCodDatas()) {
			purchaseClosingService.purchaseClosingUpdate(purchaseClosing);
		}
		return "redirect:/purchaseclosing";
	}
	
}
