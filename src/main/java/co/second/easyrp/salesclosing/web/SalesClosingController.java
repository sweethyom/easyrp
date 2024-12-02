package co.second.easyrp.salesclosing.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.salesclosing.service.SalesClosingService;
import co.second.easyrp.salesclosing.service.SalesClosingVO;
import co.second.easyrp.salesclosing.service.SearchVO;

@Controller
public class SalesClosingController {

	@Autowired
	SalesClosingService salesClosingService;

	// 매출 마감 관리 페이지 이동
	// 2024년 5월 20일 오후 12시 49분 추가 박현우
	@GetMapping("/salesclosing")
	public String salesClosing(SearchVO searchVO, Model model, @RequestParam(defaultValue = "1") int page) {
		searchVO.setOffset((page - 1) * searchVO.getPageSize());

		List<SalesClosingVO> salesClosing = salesClosingService.tableAllList(searchVO);

		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = salesClosingService.countTable(searchVO);

		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / searchVO.getPageSize());
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (searchVO.getPageSize() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("searchVO", searchVO);
		model.addAttribute("salesClosing", salesClosing);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);

		return "easyrp/salesclosing/salesclosing";
	}

	@PostMapping("/salesclosingupdate")
	public String salesClosingUpdate(SalesClosingVO salesClosingVO) {
		
		for (SalesClosingVO salesClosing : salesClosingVO.getRowOrderCodDatas()) {
			salesClosingService.salesClosingUpdate(salesClosing);
		}

		return "redirect:/salesclosing";
	}

}
