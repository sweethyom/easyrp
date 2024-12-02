package co.second.easyrp.estimate.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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

import co.second.easyrp.estimate.service.EstimateService;
import co.second.easyrp.estimate.service.EstimateVO;


@Controller
public class EstimateController {
	@Autowired
	private EstimateService estimateService;
	
    @RequestMapping(value = "/estimatemanagement", method = RequestMethod.GET)
    public String salesplanmangement(@RequestParam(defaultValue = "1") int page,
                              @RequestParam(defaultValue = "10") int size,
                              @RequestParam(required = false) String cod,
                              @RequestParam(required = false) String clientCod,
                              @RequestParam(required = false) String employeeCod,
                              @RequestParam(required = false) String employeeName,
                              @RequestParam(required = false) String orderyn,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
                              Model model) { 
        
    	List<EstimateVO> estimate = estimateService.EstimateSelectList(page, size, cod, clientCod, employeeCod, employeeName, orderyn, preSearchDate, postSearchDate);
        int totalRecords = estimateService.countSalesTables(page, size, cod, clientCod, employeeCod, employeeName, orderyn, preSearchDate, postSearchDate);
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        int pageGroupSize = 10;
        int currentPageGroup = (page - 1) / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize + 1;
        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
        
        model.addAttribute("cod", cod);
        model.addAttribute("clientCod", clientCod);
        model.addAttribute("employeeCod", employeeCod);
        model.addAttribute("employeeName", employeeName);
        model.addAttribute("orderyn", orderyn);
        model.addAttribute("preSearchDate", preSearchDate);
        model.addAttribute("postSearchDate", postSearchDate);
        
        model.addAttribute("estimate", estimate);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        model.addAttribute("endPage", endPage);
        model.addAttribute("startPage", startPage);
        
        return "easyrp/estimate/estimatemanagement";
    }
    
    @GetMapping(value = "/estimatedetail")
    @ResponseBody
    public Map<String, Object> estimateDetail(@RequestParam("cod") String estimateCod,
    							 			  Model model) {
    	
    	// 해당 견적코드에 해당하는 견적 상세 목록을 estimateDetailList에 저장(estimatedetail 테이블의 데이터)
        List<EstimateVO> estimateDetailList = estimateService.EstimateDetailSelectList(estimateCod);
        model.addAttribute("estimateDetail", estimateDetailList);
        
        // 해당 견적코드에 해당하는 기본 정보를 estimateSelect에 저장(estimate 테이블의 데이터)
        EstimateVO estimateSelect = estimateService.EstimateSelect(estimateCod);
        
        Map<String, Object> response = new HashMap<>();
        response.put("estimateDetailList", estimateDetailList);
        response.put("estimateSelect", estimateSelect);
        
        /* 
        	response라는 map 객체를 생성하고 "estimateDetailList", "estimateSelect" 라는 키에
        	estimateDetailList, estimateSelect 객체를 넣어서 JSON 형태로 반환 했습니다.
        */
        
        System.out.println(response);
        
        return response;
    	
    }

	@RequestMapping(value = "/estimateupdate", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> estimateUpdate(@RequestParam("cod") String cod,
								 @RequestParam("qty") int qty,
								 @RequestParam("num") int num) {
		
//		System.out.println(qty);
		int result = estimateService.EstimateUpdate(cod, qty, num);
		
		return ResponseEntity.ok().body("{\"message\": \"success\"}");
	}
	
	@RequestMapping(value = "/estimatedetaildelete", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> estimatedetailDelete(@RequestParam("productCod") String productCod,
													   @RequestParam("cod") String cod) {
		
//		System.out.println(productCod);
		int result = estimateService.EstimateDetailDelete(productCod, cod);
		
		return ResponseEntity.ok().body("{\"message\": \"success\"}");
	}
	
	
	@RequestMapping(value = "/productnamelist", method = RequestMethod.GET)
    @ResponseBody
    public List<EstimateVO> productnameList() {
    	
    	List<EstimateVO> productNameList = new ArrayList<EstimateVO>();
    	productNameList = estimateService.ProductNameSelectList();
    	System.out.println(productNameList);
    

    	return productNameList;
    }
	
	@RequestMapping(value = "/clientnamelist", method = RequestMethod.GET)
	@ResponseBody
	public List<EstimateVO> clientnameList() {
		
		List<EstimateVO> clientNameList = new ArrayList<EstimateVO>();
		clientNameList = estimateService.ClientNameSelectList();
		System.out.println(clientNameList);
		
		
		return clientNameList;
	}
	
	@RequestMapping(value = "/estimatedetailinsert", method = RequestMethod.GET)
	@ResponseBody
	public List<EstimateVO> estimatedetailInsert(@RequestParam("prodname") String prodname,
												 @RequestParam("qty") int qty,
												 @RequestParam("cod") String cod) {
		
		int result = estimateService.EstimateDetailInsert(cod, prodname, qty);
		
		return new ArrayList<>();
	}

    @GetMapping("/api/get-client")
    @ResponseBody
    public List<EstimateVO> clientNameSelectList() {
    	
    	List<EstimateVO> ClientNames = new ArrayList<EstimateVO>();
    	ClientNames = estimateService.ClientNameSelectList();
//    	System.out.println(ClientNames);
    	
        return ClientNames;
    }
	
   
    @RequestMapping(value = "/estimateinsertFn", method = RequestMethod.POST)
    @ResponseBody
    public String estimateInsertFn(@RequestBody List<EstimateVO> dataToSend) {
    	
    	System.out.println("dataToSend : " + dataToSend);
    	
    	String employeeCod = dataToSend.get(0).getEmployeeCod();
    	String clientName = dataToSend.get(0).getClientName();
    	
    	EstimateVO estimatevo = new EstimateVO();
    	estimatevo.setEmployeeCod(employeeCod);
    	estimatevo.setClientName(clientName);
    	
    	estimateService.EstimateInsert(estimatevo);
    	
    	String cod = estimatevo.getCod();

    	
    	for (EstimateVO vo : dataToSend) {
    		
    		String prodName = vo.getProdName();
    		int qty = vo.getQty();
    		System.out.println("prodName : " + prodName);
    		System.out.println("qty : " + qty);
    		
    		estimateService.EstimateInsert2(cod, prodName, qty);
    	}
    	
    	return "redirect:/estimatemanagement";
    }
    
    @RequestMapping(value = "/estimatedeleteFn", method = RequestMethod.GET)
    public String estimateDeleteFn(@RequestParam("cod") String cod) {
    	
    	int result = estimateService.EstimateDelete(cod);

    	return "redirect:/estimatemanagement";
    }
    
	
	
//	@PostMapping("/salesplanupdateFn")
//	public String salesplanupdateFn(@RequestParam("cod") String cod,
//    								@RequestParam("modplnQty") int modplnQty,
//    								SalesplanVO vo) {
//	   
//	   vo.setCod(cod);
//	   vo.setModplnQty(modplnQty);
//	   
//	   int result = salesplanService.SalesplanUpdate(vo);
//    	
//    	return "redirect:/salesplanmanagement";
//    }
//    
//	@GetMapping("/salesplandeleteFn")
//    public String salesplandeleteFn(@RequestParam("cod") String cod, 
//    								SalesplanVO vo,
//    								Model model) {
//		
//		vo.setCod(cod);
//		
//    	int result = salesplanService.SalesplanDelete(vo);
//    	
//    	return "redirect:/salesplanmanagement";
//    }
    
    

	
}
