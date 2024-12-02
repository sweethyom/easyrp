package co.second.easyrp.collectedmoney.map;

import java.util.List;

import co.second.easyrp.collectedmoney.service.CollectedMoneyVO;
import co.second.easyrp.collectedmoney.service.SearchVO;

//(2024년 5월 16일 오후 3시 12분 박현우)
public interface CollectedMoneyMapper {
	
	List<CollectedMoneyVO> getHyunwooOrderData();
	
	// 데이터베이스에서 삭제되지 않은 모든 값을 가져오기 위한 인터페이스
	List<CollectedMoneyVO> tableAllList(SearchVO searchVO);
	
	// 단일 항목 데이터 가져오기
	CollectedMoneyVO getData(String orderCod);
	
	// 데이터베이스에 데이터를 삽입하기 위한 기능 인터페이스
	int insertFn(CollectedMoneyVO collectedMoneyVO);
	
	// 데이터베이스에 데이터를 수정하기 위한 기능 인터페이스
	int updateFn(CollectedMoneyVO collectedMoneyVO);
	
	// 데이터베이스에 데이터를 삭제하기 위한 기능 인터페이스
	int deleteFn(String orderCod);
	
	// 검색 후 페이지네이션을 위한 인터페이스
	int countTable(SearchVO searchVO);
	
	// 수금완료 기능 인터페이스
	int collectedMoneyCompleteFn(CollectedMoneyVO collectedMoneyVO);
	
}
