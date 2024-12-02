package co.second.easyrp.mps.map;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.mps.service.MpsVO;

public interface MpsMapper {
	//모든 조회는 소요량전개(다음단계)가 이행되지 않은 주계획만 조회한다.
	
	//리스트 전체 조회
	List<MpsVO> mpsSelectListAll(
		    @Param("pageSize") int pageSize, 
		    @Param("offset") int offset,
		    @Param("searchPlan") String searchPlan,
		    @Param("searchProdCod") String searchProdCod, 
		    @Param("searchProdName") String searchProdName, 
		    @Param("searchClient") String searchClient, 
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		); 
	//리스트 페이지 구하기
	int countMpsTables(
			@Param("searchPlan") String searchPlan,
			@Param("searchProdCod") String searchProdCod,
			@Param("searchProdName") String searchProdName,
			@Param("searchClient") String searchClient,
			@Param("preSearchDate") Date preSearchDate, 
			@Param("postSearchDate") Date postSearchDate);
	
	List<MpsVO> mpsSelectListAllModal(); //모달에서 불러오기
	
	//개별조회
	MpsVO mpsSelect(MpsVO mpsVo); 
	
	int mpsInsert(MpsVO mpsVo); //등록
	int mpsUpdate(MpsVO mpsVo); //수정
	int mpsDelete(MpsVO mpsVo); //삭제
	
	//2024.05.09 14:28 손지은 수정
	//메소드 이름 orderdetailMpsStateUpdate -> orderdetailMpsStateToN 로 변경
	//메소드 orderdetailMpsStateToY 추가
	int orderdetailMpsStateToN(MpsVO mpsVo); //orderdetail의 mps_state 컬럼을 N에서 Y로 바꿔준다.
	int orderdetailMpsStateToY(MpsVO mpsVo); //orderdetail의 mps_state 컬럼을 Y에서 N으로 바꿔준다.
	
	int selectMaxCod(); //숫자가 제일 높은 코드의 숫자를 구한다.
}
