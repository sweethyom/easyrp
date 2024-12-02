package co.second.easyrp.productmgmt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.productmgmt.service.ProductMgmtService;
import co.second.easyrp.productmgmt.service.ProductMgmtVO;
import co.second.easyrp.productmgmt.service.SearchVO;

@Controller
public class ProductMgmtController {
	
	@Autowired
	ProductMgmtService productMgmtService;
	
	
	@GetMapping("/productmgmt")
	public String productMgmt(SearchVO searchVO, Model model, @RequestParam(defaultValue = "1") int page) {
		searchVO.setOffset((page - 1) * searchVO.getPageSize());
		
		List<ProductMgmtVO> productMgmt = productMgmtService.tableAllList(searchVO);
		
		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = productMgmtService.countTable(searchVO);

		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / searchVO.getPageSize());
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (searchVO.getPageSize() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("productMgmt", productMgmt);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
	
		return "easyrp/productmgmt/productmgmt";
	}
	
	@GetMapping("/productmgmtinsert")
	public String productMgmtInsert(Model model) {
		String nextCod = productMgmtService.getMaxCode();
		model.addAttribute("nextCod", nextCod);
		return "easyrp/productmgmt/productmgmtinsert";
	}
	
	@PostMapping("/productmgmtinsertfn")
	public String productMgmtInsertFn(ProductMgmtVO productMgmtVO) {
		productMgmtService.insertFn(productMgmtVO);
		return "redirect:/productmgmt";
	}
	
	@GetMapping("/productmgmtupdate")
	public String productMgmtUpdate(@RequestParam("cod") String cod, Model model) {
		ProductMgmtVO getProdMgmtData = productMgmtService.getData(cod);
		
		model.addAttribute("getProdMgmtData", getProdMgmtData);
		return "easyrp/productmgmt/productmgmtupdate";
	}
	
	@PostMapping("/productmgmtupdatefn")
	public String productMgmtUpdateFn(ProductMgmtVO productMgmtVO) {
		productMgmtService.updateFn(productMgmtVO);
		return "redirect:/productmgmt";
	}
	
	@GetMapping("/productmgmtdeletefn")
	public String productDeleteFn(@RequestParam("cod") String cod) {
		productMgmtService.deleteFn(cod);
		return "redirect:/productmgmt";
	}

}
