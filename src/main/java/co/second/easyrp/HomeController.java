package co.second.easyrp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.second.easyrp.chart.service.ChartService;
import co.second.easyrp.chart.service.ChartVO;

@Controller
public class HomeController {
	@Autowired
	private ChartService chartService;
	
	// 메인 페이지 이동
	// 2024년 4월 30일 오전 12시 10분 수정 박현우
	@RequestMapping("/")
	public String rootHome(HttpSession session,
						   Model model) {
		
		List<ChartVO> productList = chartService.ProductSelectList();
		model.addAttribute("productList", productList);
		
	    return (session.getAttribute("empCode") != null) ? "home/home" : "redirect:/login";
	}
	
	// 메인 페이지 이동 home을 이용한 이동
	// 2024년 4월 30일 오전 12시 10분 추가 박현우
	@RequestMapping("/home")
	public String home(Model model) {
		
		List<ChartVO> productList = chartService.ProductSelectList();
		model.addAttribute("productList", productList);
		System.out.println(productList);
		
		return "home/home";
	}
	
	// 로그인 페이지 이동
	// 2024년 4월 29일 오후 9시 3분 수정 박현우
	@RequestMapping("/login")
	public String login() {
		return "authentication/login";
	}


	// 판매 계획 관리 페이지 이동
	// 2024년 4얼 30일 오전 11시 23분 추가 류현석
	@RequestMapping("salesplanmanagement")
	public String salesPlan() {
		return "easyrp/salesplan/salesplanmanagement";
	}
	
	
}