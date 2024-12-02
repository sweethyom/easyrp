package co.second.easyrp.productmgmt.map;

import java.util.List;

import co.second.easyrp.productmgmt.service.ProductMgmtVO;
import co.second.easyrp.productmgmt.service.SearchVO;

//(2024년 5월 9일 오후 11시 11분 박현우)
public interface ProductMgmtMapper {
	
	// 데이터베이스에서 삭제되지 않은 모든 값을 가져오기 위한 인터페이스
	List<ProductMgmtVO> tableAllList(SearchVO searchVO);
	
	// 단일 항목 데이터 가져오기
	ProductMgmtVO getData(String cod);
	
	// 데이터베이스에 데이터를 삽입하기 위한 기능 인터페이스
	int insertFn(ProductMgmtVO productMgmtVO);
	
	// 데이터베이스에 데이터를 수정하기 위한 기능 인터페이스
	int updateFn(ProductMgmtVO productMgmtVO);
	
	// 데이터베이스에 데이터를 삭제하기 위한 기능 인터페이스
	int deleteFn(String cod);
	
	// 코드의 최대값을 가져와서 값을 자동 삽입 해주기 위한 인터페이스
	String getMaxCode();
	
	// 검색 후 페이지 네이션을 위한 인터페이스
	int countTable(SearchVO searchVO);
	
}
