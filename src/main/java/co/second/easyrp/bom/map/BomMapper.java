package co.second.easyrp.bom.map;

import java.util.List;

import co.second.easyrp.bom.service.BomVO;
import co.second.easyrp.productmgmt.service.ProductMgmtVO;

//(2024년 5월 14일 오전 9시 23분 박현우)
public interface BomMapper {
	
	List<BomVO> getHyunwooProductData();
	
	// 단일 항목 데이터 가져오기
	List<BomVO> getBomDetailData(String prodCod);
	
	int insertBom(BomVO bomVO);
	
	// stdprice 삽입하기
	int insertStdprice(BomVO bomVO);
	
	// 데이터베이스에 데이터를 삭제하기 위한 기능 인터페이스
	int deleteBom(BomVO bomVO);
}
