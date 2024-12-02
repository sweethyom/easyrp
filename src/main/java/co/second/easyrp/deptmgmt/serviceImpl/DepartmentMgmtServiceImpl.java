package co.second.easyrp.deptmgmt.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.deptmgmt.map.DepartmentMgmtMapper;
import co.second.easyrp.deptmgmt.service.DepartmentMgmtService;
import co.second.easyrp.deptmgmt.service.DepartmentMgmtVO;
import co.second.easyrp.deptmgmt.service.SearchVO;
import co.second.easyrp.deptmgmt.service.WorkplaceVO;

@Service
@Primary
public class DepartmentMgmtServiceImpl implements DepartmentMgmtService {

	@Autowired
	private DepartmentMgmtMapper departmentMgmtMapper;

	@Override
	public List<DepartmentMgmtVO> departmentTableAllList(SearchVO searchVo) {
		return departmentMgmtMapper.departmentTableAllList(searchVo);
	}

	@Override
	public int countDepartmentTable(SearchVO searchVo) {
		return departmentMgmtMapper.countDepartmentTable(searchVo);
	}

	@Override
	public List<WorkplaceVO> getAllWorkplaceValues() {
		return departmentMgmtMapper.getAllWorkplaceValues();
	}

	@Override
	public int deptmgmtInsertFn(DepartmentMgmtVO deptMgmtVo) {
		return departmentMgmtMapper.deptmgmtInsertFn(deptMgmtVo);
	}

	@Override
	public String getMaxCode() {
		String maxCod = departmentMgmtMapper.getMaxCode();
		if (maxCod != null && !maxCod.isEmpty()) {
			String prefix = maxCod.replaceAll("[0-9]", ""); // 모든 숫자를 제거하여 접두사만 추출
			String numberPart = maxCod.substring(prefix.length()); // 접두사 이후부터 문자열 끝까지 숫자 부분 추출
			int number = Integer.parseInt(numberPart) + 1; // 자른 숫자부분에 +1을 더함
			// C언어 포맷팅 생각하면 편함
			// numberPart.length() 이 부분이 3이라서 자동으로 %03가 완성 (%03d, number)
			// 이렇게되면 number가 21이면 %03d로 인해 021로 바뀜
			String formattedNumber = String.format("%0" + numberPart.length() + "d", number); 

			return prefix + formattedNumber;
		}
		return null;
	}

	@Override
	public int deptmgmtUpdateFn(DepartmentMgmtVO deptMgmtVo) {
		return departmentMgmtMapper.deptmgmtUpdateFn(deptMgmtVo);
	}

	@Override
	public DepartmentMgmtVO getDeptData(String cod) {
		return departmentMgmtMapper.getDeptData(cod);
	}

	@Override
	public int deptmgmtDeleteFn(String cod) {
		return departmentMgmtMapper.deptmgmtDeleteFn(cod);
	}

	@Override
	public List<DepartmentMgmtVO> deptAllList() {
		// TODO Auto-generated method stub
		return departmentMgmtMapper.deptAllList();
	}

}
