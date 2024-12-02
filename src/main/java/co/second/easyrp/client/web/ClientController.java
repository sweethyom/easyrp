package co.second.easyrp.client.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.client.service.ClientService;
import co.second.easyrp.client.service.ClientVO;
import co.second.easyrp.client.service.SearchVO;
import co.second.easyrp.client.service.discountVO;
import co.second.easyrp.deptmgmt.service.WorkplaceVO;
import co.second.easyrp.warehouse.service.WareHouseVO;

@Controller
public class ClientController {
	
	@Autowired
	ClientService clientService;

	@GetMapping("/client")
	public String cleint(SearchVO searchVO, Model model, @RequestParam(defaultValue = "1") int page) {
		
		searchVO.setOffset((page - 1) * searchVO.getPageSize());
		
		List<ClientVO> client = clientService.clientTableAllList(searchVO);
		
		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = clientService.countClientTable(searchVO);

		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / searchVO.getPageSize());
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (searchVO.getPageSize() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("client", client);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);

		return "easyrp/client/client";
	}

	@GetMapping("/clientinsert")
	public String clientInsert(Model model) {
		String nextCod = clientService.getMaxCode();
		model.addAttribute("nextCod", nextCod);
		return "easyrp/client/clientinsert";
	}
	
	@PostMapping("/clientinsertfn")
	public String clientInsertFn(ClientVO clientVO) {
		clientService.clientInsertFn(clientVO);
		return "redirect:/client";
	}

	@GetMapping("/clientupdate")
	public String clientUpdate(@RequestParam("cod") String cod, Model model) {
		ClientVO getClientData = clientService.getClientData(cod);
		
		model.addAttribute("getClientData", getClientData);
		return "easyrp/client/clientupdate";
	}
	
	@PostMapping("/clientupdatefn")
	public String clientUpdateFn(ClientVO clientVO) {
		clientService.clientUpdateFn(clientVO);
		return "redirect:/client";
	}
	
	@GetMapping("/clientdeletefn")
	public String clientDeleteFn(@RequestParam("cod") String cod) {
		clientService.clientDeleteFn(cod);
		return "redirect:/client";
	}
	
	@GetMapping("/api/get-discount")
	@ResponseBody
	public List<discountVO> getDiscountData() {
		return clientService.getDiscountData();
	}
	
	//거래처찾기 Modal
	//2024년 5월 3일 오전 11시 11분 하서현
	@RequestMapping("/clientSearch")
	@ResponseBody
	public List<ClientVO> clientSearch() {
		List<ClientVO> returnList = clientService.clientAllList();
		return returnList;
	}

}
