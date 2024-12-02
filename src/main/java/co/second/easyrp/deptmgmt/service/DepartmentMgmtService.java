package co.second.easyrp.deptmgmt.service;

import java.util.List;

//(2024년 5월 3일 오후 3시 13분 박현우)
public interface DepartmentMgmtService {
	
	List<DepartmentMgmtVO> departmentTableAllList(SearchVO searchVo);
	
	DepartmentMgmtVO getDeptData(String cod);
	
	List<WorkplaceVO> getAllWorkplaceValues();
	
	String getMaxCode();
	
	int deptmgmtInsertFn(DepartmentMgmtVO deptMgmtVo);
	
	int deptmgmtUpdateFn(DepartmentMgmtVO deptMgmtVo); // 아직 미완성
	
	int deptmgmtDeleteFn(String cod); // 아직 미완성

	int countDepartmentTable(SearchVO searchVo);
	
	//부서리스트를 가져오는 메소드(페이징X 검색조건X 오직 부서정보만)
	// 2024년 5월 7일 오후 1시 11분 하서현
	List<DepartmentMgmtVO> deptAllList();
}
