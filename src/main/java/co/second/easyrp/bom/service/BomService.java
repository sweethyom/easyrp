package co.second.easyrp.bom.service;

import java.util.List;

//(2024년 5월 9일 오후 11시 11분 박현우)
public interface BomService {
	
	List<BomVO> getHyunwooProductData();
	
	// 단일 항목 데이터 가져오기
	List<BomVO> getBomDetailData(String prodCod);
	
	int insertBom(BomVO bomVO);
	
	// stdprice 삽입하기
	int insertStdprice(BomVO bomVO);
	
	// 데이터베이스에 데이터를 삭제하기 위한 기능 인터페이스
	int deleteBom(BomVO bomVO);
}
