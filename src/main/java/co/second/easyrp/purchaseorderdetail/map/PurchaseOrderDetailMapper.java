package co.second.easyrp.purchaseorderdetail.map;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import co.second.easyrp.purchaseorder.service.PurchaseOrderVO;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

public interface PurchaseOrderDetailMapper {
	//발주상세테이블에 발주등록을하는 메소드
	//하서현
	int insertPoDetail(PurchaseOrderDetailVO vo);
	
	//특정 발주번호에 해당하는 발주상세리스트를 가져오는 메소드
	//하서현
    List<Map<String, Object>> poDetailListByPoCod(String PoCod);

    //특정 발주상세데이터를 삭제하는 메소드
    //하서현
    int delPoDetail(@Param("poCod")String poCod, @Param("num")int num);

    //특정 발주번호에 해당하는 발주상세데이터를 전부 삭제하는 메소드
    //하서현
    int delPoDetailAll(PurchaseOrderVO vo);

}
