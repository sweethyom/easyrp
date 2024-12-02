package co.second.easyrp.salesplan.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import co.second.easyrp.commontable.service.CommonTableCopyVO;
import co.second.easyrp.commontable.service.CommonTableService;
import co.second.easyrp.commontable.service.CommonTableVO;
import co.second.easyrp.commontable.service.KeyValueVO;
import co.second.easyrp.salesplan.service.SalesplanService;
import co.second.easyrp.salesplan.service.SalesplanVO;

@Controller
public class SalesplanController {
	@Autowired
	private SalesplanService salesplanService;

	
    @RequestMapping(value = "/salesplanmanagement", method = RequestMethod.GET)
    public String salesplanmangement(@RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "10") int size,
                              @RequestParam(required = false) String cod,
                              @RequestParam(required = false) String clientCod,
                              @RequestParam(required = false) String productCod,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
                              Model model) { 
        
    	List<SalesplanVO> salesplan = salesplanService.SalesplanSelectList(page, size, cod, clientCod, productCod, preSearchDate, postSearchDate);
        int totalRecords = salesplanService.countSalesTables(page, size, cod, clientCod, productCod, preSearchDate, postSearchDate);
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        int pageGroupSize = 10;
        int currentPageGroup = (page - 1) / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize + 1;
        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
        
        model.addAttribute("cod", cod);
        model.addAttribute("clientCod", clientCod);
        model.addAttribute("productCod", productCod);
        model.addAttribute("preSearchDate", preSearchDate);
        model.addAttribute("postSearchDate", postSearchDate);
        
        model.addAttribute("salesplan", salesplan);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        model.addAttribute("endPage", endPage);
        model.addAttribute("startPage", startPage);
        
        return "easyrp/salesplan/salesplanmanagement";
    }
    
    @RequestMapping(value = "/salesplaninsert", method = RequestMethod.GET)
    public String commonInsert(SalesplanVO vo, Model model) {
    	
    	List<SalesplanVO> ProductNames = new ArrayList<SalesplanVO>();
    	ProductNames = salesplanService.ProductNameSelectList();
    	System.out.println(ProductNames);
    	model.addAttribute("ProductNames", ProductNames);
    	
    	List<SalesplanVO> ClientNames = new ArrayList<SalesplanVO>();
    	ClientNames = salesplanService.ClientNameSelectList();
    	model.addAttribute("ClientNames", ClientNames);
    	
    	
    	
    	return "easyrp/salesplan/salesplaninsert";
    }
   
    @RequestMapping(value = "/salesplaninsertFn", method = RequestMethod.POST)
    public String salesplanInsert(@RequestParam("ClientName") String ClientName,
    							  @RequestParam("ProductName") String ProductName,
    							  @RequestParam("basicplnQty") int basicplnQty,
    							  SalesplanVO vo) {
    	
    	String ClientCod = salesplanService.ClientCodSelect(ClientName);
    	String ProductCod = salesplanService.ProductCodSelect(ProductName);
    	
    	vo.setClientCod(ClientCod);
    	vo.setProductCod(ProductCod);
    	vo.setBasicplnQty(basicplnQty);
    	
    	
    	int result = salesplanService.SalesplanInsert(vo);
    	
    	
    	return "redirect:/salesplanmanagement";
    }
    
	
	@RequestMapping(value = "/salesplanupdate", method = RequestMethod.GET)
	public String salesplanupdate(@RequestParam("cod") String cod,
								  Model model) {
		
		
		SalesplanVO vo = salesplanService.SalesplanNameSelect(cod);
		vo.setCod(cod);
		String salesplanCod = vo.getCod();
		
		String clientName = vo.getName();
		String productName = vo.getProdName();
		model.addAttribute("clientName", clientName);
		model.addAttribute("productName", productName);
		model.addAttribute("salesplanCod", salesplanCod);
	  
		return "easyrp/salesplan/salesplanupdate"; 
	}
   
	@PostMapping("/salesplanupdateFn")
	public String salesplanupdateFn(@RequestParam("cod") String cod,
    								@RequestParam("modplnQty") int modplnQty,
    								SalesplanVO vo) {
	   
	   vo.setCod(cod);
	   vo.setModplnQty(modplnQty);
	   
	   int result = salesplanService.SalesplanUpdate(vo);
    	
    	return "redirect:/salesplanmanagement";
    }
    
	@GetMapping("/salesplandeleteFn")
    public String salesplandeleteFn(@RequestParam("cod") String cod, 
    								SalesplanVO vo,
    								Model model) {
		
		vo.setCod(cod);
		
    	int result = salesplanService.SalesplanDelete(vo);
    	
    	return "redirect:/salesplanmanagement";
    }
    
//    @GetMapping("/api/get-kv")
//    @ResponseBody
//    public List<KeyValueVO> getKeyValues() {
//        return commonTableService.getAllKeyValues();
//   }
    
//    @GetMapping("/api/get-data")
//   @ResponseBody
//    public List<CommonTableCopyVO> getDatas() {
//        return commonTableService.getAllCopyDatas();
//    }
		
}
