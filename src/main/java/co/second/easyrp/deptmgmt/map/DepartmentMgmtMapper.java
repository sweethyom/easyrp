package co.second.easyrp.deptmgmt.map;

import java.util.List;

import co.second.easyrp.deptmgmt.service.DepartmentMgmtVO;
import co.second.easyrp.deptmgmt.service.SearchVO;
import co.second.easyrp.deptmgmt.service.WorkplaceVO;

//(2024년 5월 3일 오후 3시 19분 박현우)
public interface DepartmentMgmtMapper {
	
	List<DepartmentMgmtVO> departmentTableAllList(SearchVO searchVo);
	
	DepartmentMgmtVO getDeptData(String cod);
	
	List<WorkplaceVO> getAllWorkplaceValues();
	
	String getMaxCode();
	
	int deptmgmtInsertFn(DepartmentMgmtVO deptMgmtVo);
	
	int deptmgmtUpdateFn(DepartmentMgmtVO deptMgmtVo);
	
	int deptmgmtDeleteFn(String cod);
	
	int countDepartmentTable(SearchVO searchVo);
	
	//부서리스트를 가져오는 메소드(페이징X 검색조건X 오직 부서정보만)
	// 2024년 5월 7일 오후 1시 11분 하서현
	List<DepartmentMgmtVO> deptAllList();

}
