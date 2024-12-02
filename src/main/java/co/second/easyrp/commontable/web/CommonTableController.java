package co.second.easyrp.commontable.web;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.commontable.service.CommonTableCopyVO;
import co.second.easyrp.commontable.service.CommonTableService;
import co.second.easyrp.commontable.service.CommonTableVO;
import co.second.easyrp.commontable.service.KeyValueVO;

// (2024년 5월 1일 오후 6시 18분 박현우)
@Controller
public class CommonTableController {

	@Autowired
	CommonTableService commonTableService;

	@GetMapping("/commontable")
	public String commonTable(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size,
			@RequestParam(required = false) String searchNumber, @RequestParam(required = false) String searchTitle,
			@RequestParam(required = false) String searchContent, @RequestParam(required = false) String searchAuthor,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
			@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate, Model model) {

		List<CommonTableVO> commonTable = commonTableService.commonTableAllListPaged(page, size, searchNumber,
				searchTitle, searchContent, searchAuthor, preSearchDate, postSearchDate);

		int totalRecords = commonTableService.countCommonTables(searchNumber, searchTitle, searchContent, searchAuthor,
				preSearchDate, postSearchDate);

		int totalPages = (int) Math.ceil((double) totalRecords / size);
		int pageGroupSize = 10;
		int currentPageGroup = (page - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("searchNumber", searchNumber);
		model.addAttribute("searchTitle", searchTitle);
		model.addAttribute("searchContent", searchContent);
		model.addAttribute("searchAuthor", searchAuthor);
		model.addAttribute("preSearchDate", preSearchDate);
		model.addAttribute("postSearchDate", postSearchDate);
		model.addAttribute("commonTable", commonTable);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		return "easyrp/common/commontable";
	}

	@GetMapping("/commoninsert")
	public String commonInsert() {
		return "easyrp/common/commoninsert";
	}

	@PostMapping("/commoninsertfn")
	public String commonInsertFn(CommonTableVO commonTableVO, Model model) {
		commonTableService.commonInsert(commonTableVO);
		return "redirect:/commontable";
	}

	@GetMapping("/commonupdate")
	public String commonUpdate(Model model, @RequestParam("postId") int postId) {
		CommonTableVO updateData = commonTableService.getCommonData(postId);

		model.addAttribute("updateData", updateData);

		return "easyrp/common/commonupdate";
	}

	@PostMapping("/commonupdatefn")
	public String commonUpdateFn(CommonTableVO commonTableVO) {
		
		commonTableService.commonUpdate(commonTableVO);
		
		return "redirect:/commontable";
	}

	@GetMapping("/commondeletefn")
	public String commonDeleteFn(CommonTableVO commonTableVO, @RequestParam("postId") int postId, Model model) {
		CommonTableVO deleteData = commonTableService.getCommonData(postId);

		model.addAttribute("deleteData", deleteData);
		commonTableService.commonDelete(commonTableVO);
		return "redirect:/commontable";
	}

	@GetMapping("/api/get-kv")
	@ResponseBody
	public List<KeyValueVO> getKeyValues() {
		return commonTableService.getAllKeyValues();
	}

	@GetMapping("/api/get-data")
	@ResponseBody
	public List<CommonTableCopyVO> getDatas() {
		return commonTableService.getAllCopyDatas();
	}

	
	@GetMapping("/commonspecification")
	public String commonSpecification() {
		return "easyrp/specification/notiles/commonspecification";
	}
}
