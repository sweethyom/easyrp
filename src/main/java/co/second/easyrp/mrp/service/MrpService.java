package co.second.easyrp.mrp.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.mps.service.MpsVO;

public interface MrpService {
	List<MrpVO> mrpSelectListAll(SearchVO searchVo);
	List<MrpVO> mrpSelectListAllModal();
	
	int countMrpTables(SearchVO searchVo);
	
	MrpVO mrpSelect(MrpVO mrpVo);
	int mrpInsert(MrpVO mrpVo);
	int mrpUpdate(MrpVO mrpVo);
	int mrpDelete(MrpVO mrpVo);
	
	int mpsClosingUpdateToY(MrpVO mrpVo); //mps의 closing컬럼을 N에서 Y로 바꿔준다.
	int mpsClosingUpdateToN(MrpVO mrpVo); //mps의 closing컬럼을 Y에서 N으로 바꿔준다.
	int selectMaxCod(); //숫자가 제일 높은 코드의 숫자를 구한다.
	
	List<MrpVO> selectBom(String productCod); //제품번호를 통해서 자품목의 코드와 수량을 가져온다.
	List<MrpVO> selectByMpsCod(String mpsCod); //mps번호를 통해 mrp를 불러온다.
}
