package co.second.easyrp.productmgmt.service;

import java.util.List;

//(2024년 5월 8일 오후 2시 26분 박현우)

public interface UnitService {
	
	// 관리 데이터베이스에서 삭제되지 않은 모든 값을 가져오기 위한 인터페이스
	List<UnitVO> unitTableAllList();
	
	// 관리 데이터베이스에 단위를 삽입하기 위한 기능 인터페이스
	int unitInsertFn(UnitVO unitVO);
	
	// 관리 데이터베이스에 단위를 수정하기 위한 기능 인터페이스
	int unitUpdateFn(UnitVO unitVO);
	
	// 관리 데이터베이스에 단위를 삭제하기 위한 기능 인터페이스
	int unitDeleteFn(UnitVO unitVO);
	
	// 코드의 최대값을 가져와서 값을 자동 삽입 해주기 위한 인터페이스
	int getMaxCode();
}
