package co.second.easyrp.employee.serviceImpl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.employee.map.EmployeeMapper;
import co.second.easyrp.employee.service.EmployeeService;
import co.second.easyrp.employee.service.EmployeeVO;

//사원 관리를 구현하기 위한 Employee 서비스 구현체 클래스
//(2024년 4월 29일 오전 11시 23분 박현우)
@Service
@Primary
public class EmployeeServiceImpl implements EmployeeService {

	// employeeMapper 인터페이스 연결
	@Autowired
	private EmployeeMapper employeeMapper;

	// employee 정보(목록)을 구현하기 위한 메서드
	// (2024년 4월 29일 오후 11시 21분 박현우)
	@Override
	public List<EmployeeVO> employeeAllList() {
		return employeeMapper.employeeAllList();
	}

	// 사원을 등록하기위한 메서드
	// (2024 5월 3일 오전 11시 3분 하서현)
	@Override
	public int employeeRegis(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeMapper.employeeRegis(vo);
	}

	// 부서정보를 join한 사원정보를 가져오기위한 메서드
	// (2024 5월 3일 오전 11시 3분 하서현)
	@Override
	public List<Map<String, Object>> empListJoinedDept() {
		// TODO Auto-generated method stub
		return employeeMapper.empListJoinedDept();
	}

	// 로그인 기능 구현을 위한 구현 메서드
	// (2024년 4월 29일 오후 1시 5분 박현우)
	@Override
	public EmployeeVO loginResult(EmployeeVO vo) {
		return employeeMapper.loginResult(vo);
	}

	// 사원의 정보를 업데이트하기위한 메서드
	// (2024 5월 3일 오전 11시 3분 하서현)
	@Override
	public int updateEmployee(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeMapper.updateEmployee(vo);
	}

	// 페이징된 사원리스트를 가져오기위한 메소드(부서정보가 join된 사원리스트)
	// (2024 5월 3일 오후 1시 32분 하서현)
	@Override
	public List<Map<String, Object>> empListPaged(int page, int size, String searchCod, String searchName,
			String searchDeptCod, String searchDeptName, String searchEmpPosition) {
		// TODO Auto-generated method stub
		int offset = (page - 1) * size;
		return employeeMapper.empListPaged(size, offset, searchCod, searchName, searchDeptCod, searchDeptName,
				searchEmpPosition);
	}

	// 필터링된 사원리스트의 총갯수를 가져오는 메소드(페이징버튼의 총 갯수를 구하는데 필요하기 때문에)
	// (2024 5월 3일 오후 1시 32분 하서현)
	@Override
	public int countempList(String searchCod, String searchName, String searchDeptCod, String searchDeptName,
			String searchEmpPosition) {
		// TODO Auto-generated method stub
		return employeeMapper.countempList(searchCod, searchName, searchDeptCod, searchDeptName, searchEmpPosition);
	}

	// 사원한명의 정보를 가져오기위한 메소드
	// (2024 5월 7일 오전 10시 21분 하서현)
	@Override
	public EmployeeVO selectOneEmp(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeMapper.selectOneEmp(vo);
	}

	// 퇴사일을 삭제하는 메소드
	// (2024 5월 7일 오전 10시 14분 하서현)
	@Override
	public int delQuitdate(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return employeeMapper.delQuitdate(vo);
	}

}
