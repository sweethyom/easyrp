package co.second.easyrp.employee.map;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.employee.service.EmployeeVO;

//사원 관리를 구현하기 위한 EmployeeMapper 인터페이스
//(2024년 4월 29일 오전 11시 20분 박현우)
public interface EmployeeMapper {

	// 사원 데이터베이스 테이블의 모든 정보를 가져오는 메서드
	// (2024년 4월 29일 오전 11시 20분 박현우)
	List<EmployeeVO> employeeAllList();

	// 사원을 등록하는 메서드
	// (2024 5월 3일 오전 11시 3분 하서현)
	int employeeRegis(EmployeeVO vo);

	// 부서정보를 join한 사원정보를 가져오는 메소드(사원조회목록에 뿌려주기위한 리스트)
	// (2024 5월 3일 오전 11시 3분 하서현)
	List<Map<String, Object>> empListJoinedDept();

	// 로그인 기능 구현을 위한 추상 메서드
	// (2024년 4월 29일 오후 1시 4분 박현우)
	EmployeeVO loginResult(EmployeeVO vo);

	// 사원의 정보를 업데이트하는 메서드
	// (2024 5월 3일 오전 11시 3분 하서현)
	int updateEmployee(EmployeeVO vo);

	// 페이징된 사원리스트를 가져오는 메소드(부서정보가 join된 사원리스트)
	// (2024 5월 3일 오후 1시 32분 하서현)
	List<Map<String, Object>> empListPaged(@Param("pageSize") int pageSize, @Param("offset") int offset,
			@Param("searchCod") String searchCod, @Param("searchName") String searchName,
			@Param("searchDeptCod") String searchDeptCod, @Param("searchDeptName") String searchDeptName,
			@Param("searchEmpPosition") String searchEmpPosition);

	// 필터링된 사원리스트의 총갯수를 가져오는 메소드(페이징버튼의 총 갯수를 구하는데 필요하기 때문에)
	// (2024 5월 3일 오후 1시 32분 하서현)
	int countempList(@Param("searchCod") String searchCod, @Param("searchName") String searchName,
			@Param("searchDeptCod") String searchDeptCod, @Param("searchDeptName") String searchDeptName,
			@Param("searchEmpPosition") String searchEmpPosition);

	// 사원코드를 파라미터로 받아서 사원한명의 정보를 가져오는 메소드
	// (2024 5월 7일 오전 10시 14분 하서현)
	EmployeeVO selectOneEmp(EmployeeVO vo);

	// 퇴사일을 삭제하는 메소드
	// (2024 5월 7일 오전 10시 14분 하서현)
	int delQuitdate(EmployeeVO vo);
}
