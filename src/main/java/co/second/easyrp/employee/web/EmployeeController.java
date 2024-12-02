package co.second.easyrp.employee.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.second.easyrp.client.service.ClientVO;
import co.second.easyrp.commontable.service.CommonTableVO;
import co.second.easyrp.employee.service.EmployeeService;
import co.second.easyrp.employee.service.EmployeeVO;

//사원 관리를 구현하기 위한 Employee 컨트롤러
//(2024년 4월 29일 오전 11시 23분 박현우)
@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;

	// 기초 사원 관리 페이지 이동 + 정보 출력
	// (2024년 4월 29일 오후 11시 17분 수정 박현우)
	@GetMapping("/employeelist")
	public String employeelist(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int size,
			@RequestParam(required = false) String searchCod, @RequestParam(required = false) String searchName,
			@RequestParam(required = false) String searchDeptCod, @RequestParam(required = false) String searchDeptName,
			@RequestParam(required = false) String searchEmpPosition, Model model) {
		List<Map<String, Object>> employeeList = employeeService.empListPaged(page, size, searchCod, searchName,
				searchDeptCod, searchDeptName, searchEmpPosition);
		int totalRecords = employeeService.countempList(searchCod, searchName, searchDeptCod, searchDeptName,
				searchEmpPosition);
		int totalPages = (int) Math.ceil((double) totalRecords / size);

		int pageGroupSize = 10;
		int currentPageGroup = (page - 1) / pageGroupSize;
		int startPage = currentPageGroup * pageGroupSize + 1;
		int endPage = Math.min(totalPages, (currentPageGroup + 1) * pageGroupSize);

		model.addAttribute("employeeList", employeeList);
		model.addAttribute("searchCod", searchCod);
		model.addAttribute("searchName", searchName);
		model.addAttribute("searchDeptCod", searchDeptCod);
		model.addAttribute("searchDeptName", searchDeptName);
		model.addAttribute("searchEmpPosition", searchEmpPosition);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", size);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		return "easyrp/basic-information/employeelist";
	}

	// 사원등록 페이지로 이동
	// (2024년 4월 29일 오전 12시 44분 하서현)
	@RequestMapping("/employeeregis")
	public String employeeRegis() {
		return "easyrp/basic-information/employeeregis";
	}

	// 사원등록
	// (2024년 4월 29일 오후 2시 38분 하서현)
	@ResponseBody
	@PostMapping("/employeeregissubmit")
	public String employeeRegisSubmit(EmployeeVO vo) {
		int employeeRegis = employeeService.employeeRegis(vo);
		String message = "";
		if (employeeRegis > 0) {
			message = "success";
		}
		return message;
	}

	// 로그인 기능 구현
	// (2024년 4월 29일 오후 11시 45분 수정 박현우)
	// 수정내용 : ModelAndView는 좋지 않다는 이야기에 기능 분리를 하기 위한 수정
	@RequestMapping("/loginresult")
	@ResponseBody
	public String loginResult(EmployeeVO employeeVo, HttpSession session) {
		EmployeeVO employeeLoginResult = employeeService.loginResult(employeeVo);

		if (employeeLoginResult != null) {
			session.setAttribute("empCode", employeeLoginResult.getCod());
			session.setAttribute("empName", employeeLoginResult.getName());
			session.setAttribute("empDeptCode", employeeLoginResult.getDepartmentCod());
			session.setAttribute("empPosition", employeeLoginResult.getEmpPosition());
			return "success"; // 성공 시 success 문자열 반환 (Ajax로 값을 보내서 Ajax 내용을 실행하기 위한 리턴값)
		} else {
			return "fail"; // 실패 시 fail 문자열 반환 (Ajax로 값을 보내서 Ajax 내용을 실행하기 위한 리턴값)
		}
	}

	// (2024년 4월 30일 오전 9시 25분 추가 박현우)
	// 로그아웃 기능 구현
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest httpServletRequest) {
		session = httpServletRequest.getSession(); // 현재 Servlet에 존재하는 세션을 session 변수에 담음
		session.invalidate(); // 세션 완전 삭제
		return "redirect:/";
	}

	// 퇴사등록 기능 구현
	// 2024년 5월 3일 오전 11시 하서현
	@PostMapping("/quitregis")
	@ResponseBody
	public int quitregis(EmployeeVO vo) {

		int result = employeeService.updateEmployee(vo);
		return result;
	}

	// 사원수정페이지로 이동하는 메서드
	// 2024년 5월 7일 오전 9시 45분 하서현
	@GetMapping("/employeeupdate")
	public String employeeupdate(EmployeeVO vo, Model model) {
		EmployeeVO resultEmp = employeeService.selectOneEmp(vo);
		model.addAttribute("emp", resultEmp);
		return "easyrp/basic-information/employeeupdate";
	}

	// 사원을 삭제하는 메서드
	// 2024년 5월 7일 오전 9시 45분 하서현
	@PostMapping("/deleteEmp")
	@ResponseBody
	public int deleteEmp(EmployeeVO vo) {
		int result = employeeService.updateEmployee(vo);
		return result;
	}

	// 사원정보를 수정하는 메소드
	// 2024년 5월 7일 오전 9시 45분 하서현
	@PostMapping("/empupdatefn")
	public String empUpdateFn(EmployeeVO vo) {
		System.out.println(vo);
		employeeService.updateEmployee(vo);
		if(vo.getQuitdate() == null) {
			employeeService.delQuitdate(vo);
		}
		return "redirect:/employeelist";
	}
	
	// 사원찾기 Modal
	@RequestMapping("/empSearch")
	@ResponseBody
	public List<EmployeeVO> empSearch() {
		List<EmployeeVO> returnList = employeeService.employeeAllList();
		return returnList;
	}
}
