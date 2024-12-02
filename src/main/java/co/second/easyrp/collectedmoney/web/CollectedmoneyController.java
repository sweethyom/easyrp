package co.second.easyrp.collectedmoney.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.collectedmoney.service.CollectedMoneyService;
import co.second.easyrp.collectedmoney.service.CollectedMoneyVO;
import co.second.easyrp.collectedmoney.service.SearchVO;

@Controller
public class CollectedmoneyController {
	
	@Autowired
	CollectedMoneyService collectedMoneyService;
	
	// 수금 관리 페이지 이동
	// 2024년 5월 16일 오전 11시 29분 추가 박현우
	@GetMapping("/collectedmoney")
	public String collectedMoney(SearchVO searchVO, Model model, @RequestParam(defaultValue = "1") int page) {
		searchVO.setOffset((page - 1) * searchVO.getPageSize());
		List<CollectedMoneyVO> collectedMoney = collectedMoneyService.tableAllList(searchVO);
		
		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = collectedMoneyService.countTable(searchVO);
		
		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / searchVO.getPageSize());
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (searchVO.getPageSize() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("collectedMoney", collectedMoney);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/collectedmoney/collectedmoney";
	}
	
	@RequestMapping("/collectedmoneyinsert")
	public String collectedMoneyInsert() {
		return "easyrp/collectedmoney/collectedmoneyinsert";
	}
	
	@PostMapping("/collectedmoneyinsertfn")
	public String collectedMoneyInsertFn(CollectedMoneyVO collectedMoneyVO) {
		collectedMoneyService.insertFn(collectedMoneyVO);
		return "redirect:/collectedmoney";
	}
	
	@GetMapping("/api/get-hyunwoo-orderdata")
	@ResponseBody
	public List<CollectedMoneyVO> getHyunwooOrderData() {
		return collectedMoneyService.getHyunwooOrderData();
	}
	
	@GetMapping("/setvalueorderdata")
	public String setValueOrderData() {
		return "easyrp/collectedmoney/modal/setvalueorderdata";
	}
	
	@GetMapping("/collectedmoneycompletefn")
	public String collectedMoneyCompleteFn(CollectedMoneyVO collectedMoneyVO) {
		collectedMoneyService.collectedMoneyCompleteFn(collectedMoneyVO);
		return "redirect:/collectedmoney";
	}
	
	@GetMapping("/collectedmoneydeletefn")
	public String collectedMoneyDeleteFn(@RequestParam String orderCod) {
		collectedMoneyService.deleteFn(orderCod);
		return "redirect:/collectedmoney";
	}
	
	@RequestMapping("/collectedmoneyupdate")
	public String collectedMoneyUpdate(@RequestParam String orderCod, Model model) {
		CollectedMoneyVO getCollectedMoneyData = collectedMoneyService.getData(orderCod);
		
		model.addAttribute("getCollectedMoneyData", getCollectedMoneyData);
		return "easyrp/collectedmoney/collectedmoneyupdate";
	}
	
	@PostMapping("/collectedmoneyupdatefn")
	public String collectedMoneyUpdateFn(CollectedMoneyVO collectedMoneyVO) {
		collectedMoneyService.updateFn(collectedMoneyVO);
		return "redirect:/collectedmoney";
	}
	

}
