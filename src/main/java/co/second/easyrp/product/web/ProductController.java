package co.second.easyrp.product.web;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.product.service.ProductService;
import co.second.easyrp.product.service.ProductVO;


@Controller
public class ProductController {
	@Autowired
	ProductService productService;
	
	//제품찾기 modal에 뿌려줄 리스트를 보내주는 메소드
	//2024년 5월 14일 하서현
	@GetMapping("/prodSearch")
	@ResponseBody
	public List<Map<String, Object>> prodSearch() {
		List<Map<String, Object>> returnList = productService.prodSearch();
		return returnList;
	}
	
}
