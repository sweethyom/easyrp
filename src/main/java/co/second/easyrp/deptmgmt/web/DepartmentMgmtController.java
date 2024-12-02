package co.second.easyrp.deptmgmt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.deptmgmt.service.DepartmentMgmtService;
import co.second.easyrp.deptmgmt.service.DepartmentMgmtVO;
import co.second.easyrp.deptmgmt.service.SearchVO;
import co.second.easyrp.deptmgmt.service.WorkplaceVO;

@Controller
public class DepartmentMgmtController {

	@Autowired
	DepartmentMgmtService departmentMgmtService;

	@GetMapping("/departmentmgmt")
	public String departmentMgmt(SearchVO searchVo, Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize,
			@RequestParam(required = false) String searchCod, @RequestParam(required = false) String searchName,
			@RequestParam(required = false) String searchWrkName,
			@RequestParam(required = false) String searchLocation) {
		
		searchVo.setSearchCod(searchCod);
		searchVo.setSearchLocation(searchLocation);
		searchVo.setSearchName(searchName);
		searchVo.setSearchWrkName(searchWrkName);
		searchVo.setOffset((page - 1) * pageSize);
		
		List<DepartmentMgmtVO> departmentmgmt = departmentMgmtService.departmentTableAllList(searchVo);
		
		
		// 제품 개수 만큼 페이지 네이션 생성을 위한 변수
		int totalRecords = departmentMgmtService.countDepartmentTable(searchVo); 

		// 제품 개수 / 10(페이지사이즈)를 해서, 총 페이지 개수를 정한다.
		int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
		int pageGroupSize = 10;
		// 페이지네이션에서 한 그룹 당 페이지개수는 10개까지 보여주기 위한 변수
		int currentPageGroup = (pageSize - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		
		model.addAttribute("searchVO", searchVo);
		model.addAttribute("departmentmgmt", departmentmgmt);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/deptmgmt/deptmgmttable";
	}
	
	@GetMapping("/deptmgmtinsert")
	public String deptmgmtInsert(Model model) {
		String nextCod = departmentMgmtService.getMaxCode();
		model.addAttribute("nextCod", nextCod);
		return "easyrp/deptmgmt/deptmgmtinsert";
	}
	
	@PostMapping("/deptmgmtinsertfn")
	public String deptmgmtInsertFn(DepartmentMgmtVO deptMgmtVo, Model model) {
		departmentMgmtService.deptmgmtInsertFn(deptMgmtVo);
		return "redirect:/departmentmgmt";
	}
	
	@GetMapping("/deptmgmtupdate")
	public String deptmgmtUpdate(@RequestParam("cod") String cod, Model model) {
		DepartmentMgmtVO getDeptData = departmentMgmtService.getDeptData(cod);
		
		model.addAttribute("getDeptData", getDeptData);
		return "easyrp/deptmgmt/deptmgmtupdate";
	}
	
	@PostMapping("/deptmgmtupdatefn")
	public String deptmgmtUpdateFn(DepartmentMgmtVO departmentMgmtVO) {
		departmentMgmtService.deptmgmtUpdateFn(departmentMgmtVO);
		return "redirect:/departmentmgmt";
	}
	
	@GetMapping("/deptmgmtdeletefn")
	public String deptmgmtDeleteFn(@RequestParam("cod") String cod) {
		departmentMgmtService.deptmgmtDeleteFn(cod);
		return "redirect:/departmentmgmt";
	}
	
	@GetMapping("/api/get-wrkdata")
	@ResponseBody
	public List<WorkplaceVO> getWrkData() {
		return departmentMgmtService.getAllWorkplaceValues();
	}
	
	@GetMapping("/deptsearch")
	@ResponseBody
	public List<DepartmentMgmtVO> deptSearch() {
		List<DepartmentMgmtVO> returnList = departmentMgmtService.deptAllList();
		return returnList;
	}

}
