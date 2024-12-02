package co.second.easyrp.inventory.web;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.inventory.service.InventoryVO;
import co.second.easyrp.product.service.ProductService;
import co.second.easyrp.product.service.ProductVO;

@Controller
public class InventoryController {
	
	@Autowired
	InventoryService inventoryservice;
	
	@Autowired
	ProductService productservice;
	
	@GetMapping("/inventory")
	public String inventory(@RequestParam(defaultValue="1")int page,
							@RequestParam(defaultValue="10")int size,
							@RequestParam(required=false)String cod,
							@RequestParam(required=false)String warehouse,
							@RequestParam(required=false)String employee,
							@RequestParam(required=false)String account,
							@RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
				            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
				            Model model
							) {
		List<InventoryVO> inventoryList=inventoryservice.inventoryList(page, size, cod, warehouse, employee, account, preSearchDate, postSearchDate);
			int totalRecords = inventoryservice.countInventoryLists(cod, warehouse, employee, account, preSearchDate, postSearchDate);
			int totalPages = (int) Math.ceil((double) totalRecords / size);

			List<ProductVO> productList=productservice.productList(page, size, cod, warehouse, employee, account, preSearchDate, postSearchDate);
			int totalProductRecords = productservice.countProductLists(cod, warehouse, employee, account, preSearchDate, postSearchDate);
			int totalProductPages = (int) Math.ceil((double) totalProductRecords / size);	
			
			System.out.println(productList);
		
		int pageGroupSize = 10;
		int currentPageGroup = (page - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(Math.max(totalPages,  totalProductPages), (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("cod", cod);
		model.addAttribute("warehouse", warehouse);
		model.addAttribute("employee", employee);
		model.addAttribute("account", account);
		model.addAttribute("preSearchDate", preSearchDate);
		model.addAttribute("postSearchDate", postSearchDate);
		model.addAttribute("inventoryList", inventoryList);
		model.addAttribute("productList", productList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", Math.max(totalPages, totalProductPages));
		model.addAttribute("pageSize", size);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		
		
		return "easyrp/inventory/inventory";
		}
	
	//자재찾기 modal에 뿌려줄 리스트를 보내주는 메소드
	//2024년 5월 14일 오후 2시 28분 하서현
	@GetMapping("/invSearch")
	@ResponseBody
	public List<Map<String, Object>> invSearch() {
		List<Map<String, Object>> returnList = inventoryservice.inventorySearch();
		return returnList;
	}
}
