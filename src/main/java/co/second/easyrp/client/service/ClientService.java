package co.second.easyrp.client.service;

import java.util.List;

//(2024년 5월 7일 오전 11시 36분 박현우)

public interface ClientService {

	List<ClientVO> clientTableAllList(SearchVO searchVO);

	ClientVO getClientData(String cod);

	List<discountVO> getDiscountData();

	String getMaxCode();

	int clientInsertFn(ClientVO clientVO);

	int clientUpdateFn(ClientVO clientVO);

	int clientDeleteFn(String cod);

	int countClientTable(SearchVO searchVO);

	// 페이징 및 검색조건이 적용되어있지않은 순수 거래처리스트를 가져오는 메소드
	// 2024년 5월 13일 오전 10시 20분 하서현
	List<ClientVO> clientAllList();

}
