package co.second.easyrp.warehouse.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.warehouse.service.SearchVO;
import co.second.easyrp.warehouse.service.WareHouseService;
import co.second.easyrp.warehouse.service.WareHouseVO;

@Controller
public class WareHouseController {

	@Autowired
	WareHouseService houseService;

	@GetMapping("/warehouse")
	public String warehouse(SearchVO searchVo, Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize,
			@RequestParam(required = false) String searchCod, @RequestParam(required = false) String searchName,
			@RequestParam(required = false) String searchLocation) {
		
		searchVo.setSearchCod(searchCod);
		searchVo.setSearchLocation(searchLocation);
		searchVo.setSearchName(searchName);
		searchVo.setOffset((page - 1) * pageSize);
		
		List<WareHouseVO> warehouse = houseService.warehouseTableAllList(searchVo);
		
		
		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = houseService.countWarehouseTable(searchVo);

		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (pageSize - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		
		model.addAttribute("searchVO", searchVo);
		model.addAttribute("warehouse", warehouse);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/warehouse/warehousetable";
	}
	
	@GetMapping("/warehouseinsert")
	public String warehouseInsert(Model model) {
		String nextCod = houseService.getMaxCode();
		model.addAttribute("nextCod", nextCod);
		return "easyrp/warehouse/warehouseinsert";
	}
	
	@PostMapping("/warehouseinsertfn")
	public String warehouseInsertFn(WareHouseVO wareHouseVO, Model model) {
		houseService.warehouseInsertFn(wareHouseVO);
		return "redirect:/warehouse";
	}
	
	@GetMapping("/warehouseupdate")
	public String warehouseUpdate(@RequestParam("cod") String cod, Model model) {
		WareHouseVO getWarehouseData = houseService.getWareHouseData(cod);
		
		model.addAttribute("getWarehouseData", getWarehouseData);
		return "easyrp/warehouse/warehouseupdate";
	}
	
	@PostMapping("/warehouseupdatefn")
	public String warehouseUpdateFn(WareHouseVO wareHouseVO) {
		houseService.warehouseUpdateFn(wareHouseVO);
		return "redirect:/warehouse";
	}
	
	@GetMapping("/warehousedeletefn")
	public String warehouseDeleteFn(@RequestParam("cod") String cod) {
		houseService.warehouseDeleteFn(cod);
		return "redirect:/warehouse";
	}
	
	@GetMapping("/api/get-warehouse")
	@ResponseBody
	public List<WareHouseVO> apiGetWarehouse() {
		return houseService.apiGetWarehouse();
	}
	
	@GetMapping("/warehousemodal")
	public String warehouseModal() {
		return "easyrp/warehouse/modal/warehousemodal";
	}

}
