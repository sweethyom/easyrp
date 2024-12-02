package co.second.easyrp.orderdetail.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.orderdetail.map.OrderdetailMapper;
import co.second.easyrp.orderdetail.service.OrderdetailService;
import co.second.easyrp.orderdetail.service.OrderdetailVO;
import co.second.easyrp.orders.service.OrdersVO;

@Service
@Primary
public class OrderdetailServiceImpl implements OrderdetailService {
	@Autowired
	private OrderdetailMapper orderdetailMapper;
	@Override
	public List<OrderdetailVO> orderdetailSelectListAll() {
		// TODO Auto-generated method stub
		return orderdetailMapper.orderdetailSelectListAll();
	}

	@Override
	public List<OrderdetailVO> orderdetailSelectList(OrderdetailVO orderdetailVo) {
		// TODO Auto-generated method stub
		return orderdetailMapper.orderdetailSelectList(orderdetailVo);
	}

	@Override
	public int orderdetailInsert(OrderdetailVO orderdetailVo) {
		// TODO Auto-generated method stub
		return orderdetailMapper.orderdetailInsert(orderdetailVo);
	}

	@Override
	public int orderdetailUpdate(OrderdetailVO orderdetailVo) {
		// TODO Auto-generated method stub
		return orderdetailMapper.orderdetailUpdate(orderdetailVo);
	}

	@Override
	public int orderdetailDelete(OrderdetailVO orderdetailVo) {
		// TODO Auto-generated method stub
		return orderdetailMapper.orderdetailDelete(orderdetailVo);
	}

	@Override
	public List<OrderdetailVO> OrderDetailSelectList(String cod) {
		// TODO Auto-generated method stub
		return orderdetailMapper.OrderDetailSelectList(cod);
	}

}
