package co.second.easyrp.inventorymgmt.service;

import java.util.List;

//(2024년 5월 9일 오후 11시 11분 박현우)
public interface InventoryMgmtService {
	
	// 데이터베이스에서 삭제되지 않은 모든 값을 가져오기 위한 인터페이스
	List<InventoryMgmtVO> tableAllList(SearchVO searchVO);
	
	// api 데이터를 얻기위한 인터페이스
	List<InventoryMgmtVO> apiTableAllList();
	
	// 단일 항목 데이터 가져오기
	InventoryMgmtVO getData(String cod);
	
	// 검색 후 페이지네이션을 위한 인터페이스
	int countTable(SearchVO searchVO);
	
	// 데이터베이스에 데이터를 삽입하기 위한 기능 인터페이스
	int insertFn(InventoryMgmtVO inventoryMgmtVO);
	
	// 코드의 최대값을 가져와서 값을 자동 삽입 해주기 위한 인터페이스
	String getMaxCode();
	
	// 데이터베이스에 데이터를 삽입하기 위한 기능 인터페이스
	int updateFn(InventoryMgmtVO inventoryMgmtVO);
	
	// 데이터베이스에 데이터를 삽입하기 위한 기능 인터페이스
	int qtyupdateFn(InventoryMgmtVO inventoryMgmtVO);
	
	// 데이터베이스에 데이터를 삭제하기 위한 기능 인터페이스
	int deleteFn(String cod);
	
}
