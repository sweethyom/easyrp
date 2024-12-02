package co.second.easyrp.purchaseorder.service;

import java.util.List;
import java.util.Map;


public interface PurchaseOrderService {
	// 순수 발주리스트를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	List<Map<String, Object>> poMgmtList();

	// 페이징 및 검색결과가 적용된 발주리트스를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	List<Map<String, Object>> poMgmtListPaged(PurchaseOrderVO vo);

	// 검색결과가 적용된 발주리트스의 갯수를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	int countPoMgmtList(PurchaseOrderVO vo);

	//과세구분리스트를 가져오는 메소드
	List<Map<String, Object>> taxDivList();
	
	//발주테이블에 발주등록을하는 메소드
	//하서현
	int insertPo(PurchaseOrderVO vo);
	
	//발주등록을할때 고유한 발주번호를 부여해주기위한 메소드
	//하서현
	String newPoCod();
	
	//2024.05.20 15:25 손지은 추가
	//매입마감된 목록만 가져오는 메소드
	List<Map<String, Object>> selectPurchaseOrdersClosing(PurchaseOrderVO vo);

	//특정 발주데이터를 가져오기위한 메소드
	//하서현
	Map<String, Object> selectPo(String key);

	//발주테이블의 정보를 수정하는 메소드
	int updatePo(PurchaseOrderVO vo);
	
	//입고일자.마감일자.납기일.비고를 update하는 메소드
	//하서현
	int updateIboundDateClosingDateDdayNote(PurchaseOrderVO vo);
}

