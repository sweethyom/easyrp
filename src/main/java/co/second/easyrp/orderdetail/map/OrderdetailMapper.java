package co.second.easyrp.orderdetail.map;

import java.util.List;

import co.second.easyrp.orderdetail.service.OrderdetailVO;
import co.second.easyrp.orders.service.OrdersVO;

public interface OrderdetailMapper {
	List<OrderdetailVO> orderdetailSelectListAll(); //리스트 전체 조회
	List<OrderdetailVO> orderdetailSelectList(OrderdetailVO orderdetailVo); //조건으로 리스트 조회
	
	int orderdetailInsert(OrderdetailVO orderdetailVo); //등록
	int orderdetailUpdate(OrderdetailVO orderdetailVo); //수정
	int orderdetailDelete(OrderdetailVO orderdetailVo); //삭제
	
	List<OrderdetailVO> OrderDetailSelectList(String cod);
}
