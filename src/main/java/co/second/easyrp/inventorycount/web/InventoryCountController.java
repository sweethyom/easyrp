package co.second.easyrp.inventorycount.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.inventorycount.service.InventoryAdjustmentDetailVO;
import co.second.easyrp.inventorycount.service.InventoryAdjustmentVO;
import co.second.easyrp.inventorycount.service.InventoryCountDetailVO;
import co.second.easyrp.inventorycount.service.InventoryCountService;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.ProductInventoryVO;
import co.second.easyrp.inventorycount.service.SearchVO;
import co.second.easyrp.product.service.ProductService;
import co.second.easyrp.warehouse.service.WareHouseVO;

@Controller
public class InventoryCountController {

	@Autowired
	InventoryCountService inventorycountservice;
	
	@Autowired
	InventoryService inventoryservice;
	
	@Autowired
	ProductService productservice;
	
	@GetMapping("/inventorycount")
	public String inventoryCount(SearchVO searchVO, Model model, @RequestParam(defaultValue = "1") int page) {
		
		int size=searchVO.getPageSize();
		
		searchVO.setOffset((page - 1) * size);
		
		List<InventoryCountVO> inventoryCountList=inventorycountservice.inventoryCountList(searchVO);
		
		int totalRecords = inventorycountservice.countInventoryCountLists(searchVO);

		int totalPages = (int) Math.ceil((double) totalRecords / size);
		int pageGroupSize = 10;
		int currentPageGroup = (size-1)/ pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
		
		model.addAttribute("searchVO", searchVO);
		model.addAttribute("inventoryCountList", inventoryCountList);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);

		return "easyrp/inventory/inventorycount";
		
	}
	
	@RequestMapping("inventorycountinsert")
	public String inventoryCountInsert(Model model) {
		List<WareHouseVO> warehouseinv = warehouseList();
		model.addAttribute("warehouseinv", warehouseinv);
		return "easyrp/inventory/inventorycountinsert";
	}
	
	@RequestMapping("/api/get-prodinvinsert")
	@ResponseBody
	public String inventoryCountInsertFn( HttpServletRequest httpservletrequest, HttpSession httpsession) {
		String rs = "N";
		String[] prodinvcod;
		String[] countqty;
		String[] note;
		String warehouse;
		
		prodinvcod= httpservletrequest.getParameterValues("prodinvcod");
		countqty = httpservletrequest.getParameterValues("countqty");
		note = httpservletrequest.getParameterValues("note");
		warehouse= httpservletrequest.getParameter("warehouse");
		System.out.println(warehouse);
		
				System.out.println(Arrays.toString(countqty));
				System.out.println(Arrays.toString(note));
				System.out.println(Arrays.toString(prodinvcod));
		
		InventoryCountDetailVO inventorycountdetailvo = new InventoryCountDetailVO();
		InventoryCountVO inventorycountvo = new InventoryCountVO();		
		
		int maxNumber = inventorycountservice.selectMaxCod() + 1;
    	String newCode = String.format("%03d", maxNumber);
    	System.out.println("NewCode :"+ newCode);
    	
    	if(warehouse != null) {
    		inventorycountvo.setWarehouse(warehouse);
    	}
    	
    	inventorycountvo.setCod("invcnt"+newCode);
    	inventorycountvo.setEmployeeCod((String) httpsession.getAttribute("empCode"));
    	inventorycountvo.setWarehouseCod(inventorycountservice.wareHouseCod(warehouse));
    	inventorycountvo.setCountclass("정기");
    	
    	inventorycountservice.insertInventoryCount(inventorycountvo);
    	
    
    	
		if(prodinvcod != null) {
			for(int i=0; i<prodinvcod.length; i++) {
				int computingqty = inventorycountservice.getcomputingqty(prodinvcod[i]);
				int countingqty = Integer.parseInt(countqty[i]);
				int diffqty = computingqty-countingqty;
				int unitprice =inventorycountservice.getprice(prodinvcod[i]);

				
				System.out.println(computingqty);
				boolean prodinvcods = prodinvcod[i].contains("prd");
				if(prodinvcods) {
					
					inventorycountdetailvo.setAccount("완제품");
					inventorycountdetailvo.setProductCod(prodinvcod[i]);
					inventorycountdetailvo.setComputingQty(computingqty);
				}else {
					inventorycountdetailvo.setAccount("자재");
					inventorycountdetailvo.setInventoryCod(prodinvcod[i]);
					inventorycountdetailvo.setComputingQty(computingqty);
				}
				
				
				
				System.out.println("prodinvcod:"+prodinvcod[i]);
				inventorycountdetailvo.setInventorycountCod(inventorycountvo.getCod());
				inventorycountdetailvo.setQty(countingqty);	
				inventorycountdetailvo.setNote(note[i]);
				inventorycountdetailvo.setUnitCod(1);
				inventorycountdetailvo.setDiffQty(computingqty-countingqty);
				inventorycountdetailvo.setUnitprice(unitprice);
				inventorycountdetailvo.setPrice(diffqty*unitprice);
				
				System.out.println(inventorycountdetailvo);
				
				inventorycountservice.insertCountDetailList(inventorycountdetailvo);
		}
			}
		rs = "Y";
		
		return rs;
	}
	
	
	@GetMapping("/api/get-prodinv")
	@ResponseBody
	public List<ProductInventoryVO> getAllProdInv(HttpServletRequest httpservletrequest){
		
		String warehouse = httpservletrequest.getParameter("warehouse");
		
		
		WareHouseVO warehousevo = new WareHouseVO();
		
		
		warehousevo.setName(warehouse);
		
		
		System.out.println(inventorycountservice.selectedWarehouseList(warehousevo));
		

		return inventorycountservice.getAllProdInvWarehouse(warehousevo);
	}

	public List<WareHouseVO> warehouseList() {
	        return inventorycountservice.warehouseList();
	    }
	
	@GetMapping("/api/get-prodinvlist")
	@ResponseBody
	public List<ProductInventoryVO> getAccount(HttpServletRequest httpservletrequest){
		
		String prodinv = httpservletrequest.getParameter("prodinv");
		String warehouse = httpservletrequest.getParameter("warehouse");
		
		
		ProductInventoryVO prodinvvo= new ProductInventoryVO();
		
		
		prodinvvo.setAccount(prodinv);
		
		prodinvvo.setWarehouse(warehouse);
		System.out.println(prodinv);
		
		
			
		
		return inventorycountservice.getProdInvAccount(prodinvvo);
	}
	
	@PostMapping("inventorycountdelivr")
	public String inventorycountdelivery(Model model, HttpServletRequest httpservletrequest) {
		
		String countdetail = httpservletrequest.getParameter("detailkey");
		
		List<InventoryCountDetailVO> inventoryCountDetailList =new ArrayList<InventoryCountDetailVO>();
		inventoryCountDetailList = inventorycountservice.selectedInventoryCountDetailList(countdetail);
		List<InventoryCountVO> inventoryCountList = new ArrayList<InventoryCountVO>();
		inventoryCountList = inventorycountservice.selectInventoryCountList(countdetail);

		model.addAttribute("inventoryCountList", inventoryCountList);
		model.addAttribute("inventoryCountDetailList", inventoryCountDetailList);
		
		return "easyrp/inventory/inventorycountdetail";
	}
	
	@PostMapping("/api/get-adjustment")
	@ResponseBody
	public String adjustment(HttpServletRequest httpservletrequest, HttpSession httpsession) {
		String rs = "N";
		String [] adjust;
		String [] note;
		String [] adjustnum;
		
		adjust = httpservletrequest.getParameterValues("adjust");
		note = httpservletrequest.getParameterValues("note");
		adjustnum = httpservletrequest.getParameterValues("adjustnum");
		
		InventoryAdjustmentVO inventoryadjustmentvo = new InventoryAdjustmentVO();
		InventoryAdjustmentDetailVO inventoryadjustmentdetailvo = new InventoryAdjustmentDetailVO();
		
		int maxNumber = inventorycountservice.selectMaxinvadjCod() + 1;
    	String newCode = String.format("%03d", maxNumber);
    	
    	
    	inventoryadjustmentvo.setCod("invadj"+newCode);
    	inventoryadjustmentvo.setEmployeeCod((String) httpsession.getAttribute("empCode"));
    	inventorycountservice.insertAdjustmentList(inventoryadjustmentvo);
    	
    	if(adjust != null) {
    		for(int i=0; i<adjust.length; i++) {
    			int adjustnumber = Integer.parseInt(adjustnum[i]);
    			String prodinvCod=inventorycountservice.selectinventoryadjustmentdetail(adjustnumber);    			
    			String prodinv=inventorycountservice.selectedInventoryCountDetailName(adjustnumber);
    			int computingqty = inventorycountservice.getcomputingqty(prodinvCod);
    			int countingqty = inventorycountservice.getcountqty(adjustnumber);
    			int unitprice =inventorycountservice.getprice(prodinvCod);
    			System.out.println(adjust[i]);
    			int qty=Integer.parseInt(adjust[i]);
    			
    			
    			inventoryadjustmentdetailvo.setInventoryadjustmentCod(inventoryadjustmentvo.getCod());
    			
    			boolean prodinvcods = prodinvCod.contains("prd");			
    			if(prodinvcods) {
    				inventoryadjustmentdetailvo.setProductCod(prodinvCod);
    				inventoryadjustmentdetailvo.setProduct(prodinv);
				}else {
					inventoryadjustmentdetailvo.setInvCod(prodinvCod);
					inventoryadjustmentdetailvo.setInventory(prodinv);
				}
    			inventoryadjustmentdetailvo.setUnitCod(1);
    			inventoryadjustmentdetailvo.setComputingQty(computingqty);
    			inventoryadjustmentdetailvo.setCountQty(countingqty);
    			inventoryadjustmentdetailvo.setNote(note[i]);
    			inventoryadjustmentdetailvo.setQty(qty);
    			inventoryadjustmentdetailvo.setUnitPrice(unitprice);
    			inventoryadjustmentdetailvo.setPrice(unitprice*qty);
    			inventoryadjustmentdetailvo.setIcdnum(adjustnumber);
    			
    			inventorycountservice.insertAdjustmentDetailList(inventoryadjustmentdetailvo);
    			
    			int adjnum = inventorycountservice.selectinventoryadjustmentnum(inventoryadjustmentdetailvo);
    			
    			System.out.println("adjust:" + adjnum);
    			inventoryadjustmentdetailvo.setIcdnum(adjustnumber);
    			if(prodinvcods) {
    				inventorycountservice.updateproductadjustment(inventoryadjustmentdetailvo);
				}else {
					inventorycountservice.updateinventoryadjustment(inventoryadjustmentdetailvo);
				}
    			System.out.println(inventoryadjustmentdetailvo);
    			
    			inventorycountservice.updateinventorycountdetailprocclass(adjustnumber);
    			String countcod=inventorycountservice.selectinventorycountcod(adjustnumber);
    			System.out.println("countcod:"+countcod);
    			inventorycountservice.updateinventorycountprocclass(countcod);
	
    		}	
    		
    		
    	}
    	rs = "Y";
    	return rs;
	}
}
