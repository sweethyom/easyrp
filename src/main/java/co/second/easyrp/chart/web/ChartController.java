package co.second.easyrp.chart.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.chart.map.ChartMapper;
import co.second.easyrp.chart.service.ChartService;
import co.second.easyrp.chart.service.ChartVO;

@Controller
public class ChartController {
	@Autowired
	private ChartService chartService;
	
    @GetMapping("/ChartUpdate")
    @ResponseBody
    public Map<String, List<ChartVO>> getOrderQty(@RequestParam("productCod") String productCod, 
    								 @RequestParam("year") int year) {
    	
    	Map<String, List<ChartVO>> dataMap = new HashMap<>();
    	
        // 주문량 데이터 가져오기
        List<ChartVO> orderData = chartService.getOrderByProductAndYear(productCod, year);
        dataMap.put("orderData", orderData);
        
//        System.out.println("orderData : " + orderData);
        
        // 판매 계획량 데이터 가져오기
        List<ChartVO> planData = chartService.getSalesPlanByProductAndYear(productCod, year);
        dataMap.put("planData", planData);
        
//        System.out.println("planData : " + planData);
        
//        System.out.println("dataMap : " + dataMap);
        
        return dataMap;
    }
    
    @GetMapping("/DonutChartUpdate")
    @ResponseBody
    public Map<String, Object> getSalesRatioByProduct(ChartVO vo) {

    	int donut_year = vo.getDonut_year();
    	int month = vo.getMonth();
    	
    	List<ChartVO> DonutData = chartService.getTop3Product(donut_year, month);
    	
    	List<String> labels = new ArrayList<>();
    	List<Long> data = new ArrayList<>();
    	
    	for (ChartVO chartVO : DonutData) {
    		labels.add(chartVO.getProdname());
    		data.add(chartVO.getProductSales());
    	}
    	
    	Map<String, Object> response = new HashMap<>();
    	response.put("labels", labels);
    	response.put("data", data);
    	
    	System.out.println(response);
    	
    	
    	return response;
    	
    }

}
