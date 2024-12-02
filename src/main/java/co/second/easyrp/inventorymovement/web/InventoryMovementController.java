package co.second.easyrp.inventorymovement.web;

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


import co.second.easyrp.inventorymovement.service.InventoryMovementService;
import co.second.easyrp.inventorymovement.service.InventoryMovementVO;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

@Controller
public class InventoryMovementController {
	
	@Autowired
	InventoryMovementService inventorymovementservice;
	
	@GetMapping("/inventorymovement")
	public String inventoryMovement(@RequestParam(defaultValue = "1") int page,
						            @RequestParam(defaultValue = "10") int size,
						            @RequestParam(required = false) String cod,
						            @RequestParam(required = false) String oboundWarehouse,
						            @RequestParam(required = false) String oboundLocation,
						            @RequestParam(required = false) String iboundWarehouse,
						            @RequestParam(required = false) String iboundLocation,
						            @RequestParam(required = false) String employeeCod,
						            @RequestParam(required = false) String purchaseDetailCod,
						            @RequestParam(required = false) String productCod,
						            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
						            @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
						            Model model
						            ) {
		
		List<InventoryMovementVO> inventoryMovementList=inventorymovementservice.inventoryMovementList(page, size, cod, oboundWarehouse, oboundLocation, iboundWarehouse, iboundLocation, employeeCod, purchaseDetailCod, productCod, preSearchDate, postSearchDate);
		int totalRecords = inventorymovementservice.countInventoryMovementLists(cod, oboundWarehouse, oboundLocation, iboundWarehouse, iboundLocation, employeeCod, purchaseDetailCod, productCod, preSearchDate, postSearchDate);
		int totalPages = (int) Math.ceil((double) totalRecords / size);

		int pageGroupSize = 10;
		int currentPageGroup = (page - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("oboundWarehouse", oboundWarehouse);
		model.addAttribute("oboundLocation", oboundLocation);
		model.addAttribute("iboundWarehouse", iboundWarehouse);
		model.addAttribute("iboundLocation", iboundLocation);
		model.addAttribute("employeeCod", employeeCod);
		model.addAttribute("purchaseDetailCod", purchaseDetailCod);
		model.addAttribute("productCod", productCod);
		model.addAttribute("preSearchDate", preSearchDate);
		model.addAttribute("postSearchDate", postSearchDate);
		model.addAttribute("inventoryMovementList", inventoryMovementList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		
		return "easyrp/inventory/inventorymovement";
		}

	@GetMapping("/inventorymovementinsert")
    public String inventoryMovementInsert() {
    	return "easyrp/inventory/inventorymovementinsert";
    }
    
    @PostMapping("/inventorymovementinsertfn")
    public String inventorymovementInsertfn(InventoryMovementVO inventoryMovementVO, Model model) {
    	inventorymovementservice.insertInventoryMovement(inventoryMovementVO);
    	return "redirect:/inventorymovement";
    }
	 					
	@GetMapping("/api/get-podata")
	@ResponseBody
	public List<PurchaseOrderDetailVO> getPoDatas(){
		return inventorymovementservice.getAllPurchaseOrderDatas();
	}
}