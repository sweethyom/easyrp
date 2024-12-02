package co.second.easyrp.orders.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.estimate.service.EstimateService;
import co.second.easyrp.estimate.service.EstimateVO;
import co.second.easyrp.orderdetail.service.OrderdetailService;
import co.second.easyrp.orderdetail.service.OrderdetailVO;
import co.second.easyrp.orders.service.OrderService;
import co.second.easyrp.orders.service.OrdersVO;


@Controller
public class OrdersController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderdetailService orderDetailService;
	@Autowired
	private EstimateService estimateService;
	
    @RequestMapping(value = "/ordersmanagement", method = RequestMethod.GET)
    public String ordersmanagement(@RequestParam(defaultValue = "1") int page,
                             @RequestParam(defaultValue = "10") int size,
                              @RequestParam(required = false) String cod,
                              @RequestParam(required = false) String clientCod,
                              @RequestParam(required = false) String employeeCod,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date preSearchDate,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date postSearchDate,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date ddaypreSearchDate,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date ddaypostSearchDate,
                              Model model) { 
        
    	List<OrdersVO> orders = orderService.OrdersSelectList(page, size, cod, clientCod, employeeCod, preSearchDate, postSearchDate, ddaypreSearchDate, ddaypostSearchDate);
        int totalRecords = orderService.countSalesTables(page, size, cod, clientCod, employeeCod, preSearchDate, postSearchDate, ddaypreSearchDate, ddaypostSearchDate);
        int totalPages = (int) Math.ceil((double) totalRecords / size);

        int pageGroupSize = 10;
        int currentPageGroup = (page - 1) / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize + 1;
        int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);
        
        model.addAttribute("cod", cod);
        model.addAttribute("clientCod", clientCod);
        model.addAttribute("employeeCod", employeeCod);
        model.addAttribute("preSearchDate", preSearchDate);
        model.addAttribute("postSearchDate", postSearchDate);
        model.addAttribute("ddaypreSearchDate", ddaypreSearchDate);
        model.addAttribute("ddaypostSearchDate", ddaypostSearchDate);
        
        model.addAttribute("orders", orders);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);
        model.addAttribute("endPage", endPage);
        model.addAttribute("startPage", startPage);
        
        return "easyrp/orders/ordersmanagement";
    }
    
    @GetMapping(value = "/orderdetail")
    @ResponseBody
    public Map<String, Object> orderDetail(@RequestParam("cod") String orderCod,
    							 			  Model model) {
    	
    	// 해당 수주코드에 해당하는 수주 상세 목록을 orderDetailList에 저장(orderdetail 테이블의 데이터)
        List<OrderdetailVO> orderDetailList = orderDetailService.OrderDetailSelectList(orderCod);
        model.addAttribute("orderDetail", orderDetailList);
        
        // 해당 수주코드에 해당하는 기본 정보를 orderSelect에 저장(orders 테이블의 데이터)
        OrdersVO orderSelect = orderService.OrderSelect(orderCod);
        
        Map<String, Object> response = new HashMap<>();
        response.put("orderDetailList", orderDetailList);
        response.put("orderSelect", orderSelect);
        
        /* 
        	response라는 map 객체를 생성하고 "estimateDetailList", "estimateSelect" 라는 키에
        	estimateDetailList, estimateSelect 객체를 넣어서 JSON 형태로 반환 했습니다.
        */
        
        System.out.println(response);
        
        return response;
    	
    }
    
	@RequestMapping(value = "/estimatelist", method = RequestMethod.GET)
	@ResponseBody
	public List<EstimateVO> clientnameList() {
		
		List<EstimateVO> estimatelist = new ArrayList<EstimateVO>();
		estimatelist = estimateService.EstimateSelectList1();
		
		
		return estimatelist;
	}
	
	
    @GetMapping(value = "/estimateDetailList")
    @ResponseBody
    public Map<String, Object> estimateDetailList(HttpServletRequest req,
    							 			  Model model) {
    	String estimateCod = req.getParameter("cod");
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

    @RequestMapping(value = "/orderinsertFn", method = RequestMethod.POST)
    @ResponseBody
    public String orderInsertFn(@RequestBody List<OrdersVO> dataToSend) {
    	
    	System.out.println("dataToSend : " + dataToSend);
    	
    	String employeeCod = dataToSend.get(0).getEmployeeCod();
    	String clientName = dataToSend.get(0).getClientName();
    	Date dday = dataToSend.get(0).getDday();
    	
    	
    	String estimateCod = dataToSend.get(0).getEstimateCod();
    	
    	
    	OrdersVO ordervo = new OrdersVO();
    	ordervo.setEmployeeCod(employeeCod);
    	ordervo.setClientName(clientName);
    	ordervo.setDday(dday);
    	ordervo.setEstimateCod(estimateCod);
    	
    	orderService.ordersInsert(ordervo);
    	
    	String cod = ordervo.getCod();

    	
    	for (OrdersVO vo : dataToSend) {
    		
    		String prodname = vo.getProdname();
    		int qty = vo.getQty();
//    		System.out.println("prodname : " + prodname);
//    		System.out.println("qty : " + qty);
    		
    		orderService.ordersInsert2(cod, prodname, qty);
    	}
    	

    	
    	return "redirect:/ordersmanagement";
    }
    
    @RequestMapping(value = "/deliveryFn", method = RequestMethod.POST)
    @ResponseBody
    public String deliveryFn(@RequestParam("cod") String cod,
    						 @RequestParam("productCod") String productCod,
    						 @RequestParam("qty") int qty,
    						 @RequestParam("curRemainQty") int curRemainQty) {
    	
        
            // 재고 검증
            int availableQty = orderService.checkProduct(productCod);
            System.out.println(availableQty);

            if (availableQty > 0) {
                if (availableQty >= curRemainQty) {
                    // 가용재고량 >= 남은 수주 수량
                    orderService.updateProductFull(curRemainQty, productCod);
                    orderService.updateOrderDetailFull(curRemainQty, productCod, cod);
                } else {
                    // 가용재고량 < 남은 수주 수량
                    orderService.updateProductPartial(availableQty, productCod);
                    orderService.updateOrderDetailPartial(availableQty, productCod, cod);
                }
            } else {
                orderService.updateNoProuctQty(productCod, cod);
            }

            return "success";
        
    }
    
    @RequestMapping(value = "/ordersdeleteFn", method = RequestMethod.GET)
    public String ordersDeleteFn(@RequestParam("cod") String cod,
    							 OrdersVO vo) {
    	
    	vo.setCod(cod);
    	
    	int result = orderService.ordersDelete(vo);

    	return "redirect:/ordersmanagement";
    }
	
	
}
