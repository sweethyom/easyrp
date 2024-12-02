package co.second.easyrp.purchaseclosing.map;

import java.util.List;

import co.second.easyrp.purchaseclosing.service.PurchaseClosingVO;
import co.second.easyrp.purchaseclosing.service.SearchVO;

public interface PurchaseClosingMapper {
	// 데이터베이스에서 삭제되지 않은 모든 값을 가져오기 위한 인터페이스
	List<PurchaseClosingVO> tableAllList(SearchVO searchVO);
	
	// 검색 후 페이지 네이션을 위한 인터페이스
	int countTable(SearchVO searchVO);
	
	// 매출 마감을 위한 인터페이스
	int purchaseClosingUpdate(PurchaseClosingVO purchaseClosingVO);
}
