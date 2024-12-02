package co.second.easyrp.inventorymgmt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.client.service.ClientVO;
import co.second.easyrp.inventorymgmt.service.InventoryMgmtService;
import co.second.easyrp.inventorymgmt.service.InventoryMgmtVO;
import co.second.easyrp.inventorymgmt.service.SearchVO;

@Controller
public class InventoryMgmtController {

	@Autowired
	InventoryMgmtService inventoryMgmtService;

	@GetMapping("/inventorymgmt")
	public String inventoryMgmt(SearchVO searchVO, Model model, @RequestParam(defaultValue = "1") int page) {
		searchVO.setOffset((page - 1) * searchVO.getPageSize());

		List<InventoryMgmtVO> inventoryMgmt = inventoryMgmtService.tableAllList(searchVO);

		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = inventoryMgmtService.countTable(searchVO);

		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / searchVO.getPageSize());
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (searchVO.getPageSize() - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("searchVO", searchVO);
		model.addAttribute("inventoryMgmt", inventoryMgmt);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);

		return "easyrp/inventorymgmt/inventorymgmt";
	}

	@GetMapping("/inventorymgmtinsert")
	public String inventoryMgmtInsert(Model model) {
		String nextCod = inventoryMgmtService.getMaxCode();
		model.addAttribute("nextCod", nextCod);
		return "easyrp/inventorymgmt/inventorymgmtinsert";
	}

	@PostMapping("/inventorymgmtinsertfn")
	public String inventoryMgmtInsertFn(InventoryMgmtVO inventoryMgmtVO) {
		inventoryMgmtService.insertFn(inventoryMgmtVO);
		return "redirect:/inventorymgmt";
	}
	
	@GetMapping("/inventorymgmtupdate")
	public String inventoryMgmtUpdate(@RequestParam("cod") String cod, Model model) {
		InventoryMgmtVO getInventoryData = inventoryMgmtService.getData(cod);
		
		
		model.addAttribute("getInventoryData", getInventoryData);
		return "easyrp/inventorymgmt/inventorymgmtupdate";
	}
	
	@PostMapping("/inventorymgmtupdatefn")
	public String inventoryMgmtUpdateFn(InventoryMgmtVO inventoryMgmtVO) {
		inventoryMgmtService.updateFn(inventoryMgmtVO);
		return "redirect:/inventorymgmt";
	}

	@GetMapping("/inventorymgmtdeletefn")
	public String inventoryMgmtDeleteFn(@RequestParam("cod") String cod) {
		inventoryMgmtService.deleteFn(cod);
		return "redirect:/inventorymgmt";
	}
	
	@GetMapping("/api/get-inventory")
	@ResponseBody
	public List<InventoryMgmtVO> getInventoryData() {
		System.out.println("호출되었습니다");
		return inventoryMgmtService.apiTableAllList();
	}
	
	@GetMapping("/setvalueinventorymodal")
	public String setValueInventoryModal() {
		return "easyrp/inventorymgmt/modal/setvalueinventorymodal";
	}
}
