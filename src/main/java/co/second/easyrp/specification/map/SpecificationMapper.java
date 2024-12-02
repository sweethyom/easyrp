package co.second.easyrp.specification.map;

import java.util.List;

import co.second.easyrp.specification.service.SpecificationVO;

//(2024년 5월 22일 오전 10시 59분 박현우)
public interface SpecificationMapper {
	
	// 명세서에 값을 담을 데이터 List
	List<SpecificationVO> getOrderDatas(SpecificationVO specificationVO);
	
	// 명세서 상태 업데이트를 위한 기능 인터페이스
	int updateOrderSpecificationState(SpecificationVO specificationVO);
	
	// 발주명세서 값을 담을 데이터 List
	List<SpecificationVO> getPurchaseDatas(SpecificationVO specificationVO);
	
	// 발주명세서 상태 업데이트를 위한 기능 인터페이스
	int updatePurchaseSpecificationState(SpecificationVO specificationVO);
}
