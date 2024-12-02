package co.second.easyrp.orders.serviceImpl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.orders.map.OrdersMapper;
import co.second.easyrp.orders.service.OrderService;
import co.second.easyrp.orders.service.OrdersVO;

@Service
@Primary
public class OrdersServiceImpl implements OrderService {
	@Autowired 
	private OrdersMapper ordersMapper;
	
	@Override
	public List<OrdersVO> OrdersSelectList(int page, int size, String cod, String clientCod, String employeeCod,
			Date preSearchDate, Date postSearchDate, Date ddaypreSearchDate, Date ddaypostSearchDate) {
		
			int offset = (page - 1) * size;
			
		return ordersMapper.OrdersSelectList(size, offset, cod, clientCod, employeeCod, preSearchDate, postSearchDate, ddaypreSearchDate, ddaypostSearchDate);
	}

	@Override
	public int countSalesTables(int pageSize, int offset, String cod, String clientCod, String employeeCod,
			Date preSearchDate, Date postSearchDate , Date ddaypreSearchDate, Date ddaypostSearchDate) {
		// TODO Auto-generated method stub
		return ordersMapper.countSalesTables(pageSize, offset, cod, clientCod, employeeCod, preSearchDate, postSearchDate, ddaypreSearchDate, ddaypostSearchDate);
	}
	
	@Override
	public List<OrdersVO> ordersSelectListAll() {
		// TODO Auto-generated method stub
		return ordersMapper.ordersSelectListAll();
	}

	@Override
	public List<OrdersVO> ordersSelectList(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersSelectList(ordersVo);
	}

	@Override
	public OrdersVO ordersSelect(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersSelect(ordersVo);
	}

	@Override
	public int ordersInsert(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersInsert(ordersVo);
	}

	@Override
	public int ordersInsert2(String cod, String prodname, int qty) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersInsert2(cod, prodname, qty);
	}
	
	@Override
	public int ordersUpdate(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersUpdate(ordersVo);
	}

	@Override
	public int ordersDelete(OrdersVO ordersVo) {
		// TODO Auto-generated method stub
		return ordersMapper.ordersDelete(ordersVo);
	}

	@Override
	public List<OrdersVO> OrderDetailSelectList(String cod) {
		// TODO Auto-generated method stub
		return ordersMapper.OrderDetailSelectList(cod);
	}

	@Override
	public OrdersVO OrderSelect(String cod) {
		// TODO Auto-generated method stub
		return ordersMapper.OrderSelect(cod);
	}

	@Override
	public int checkProduct(String productCod) {
		// TODO Auto-generated method stub
		return ordersMapper.checkProduct(productCod);
	}

	@Override
	public int updateOrderDetailFull(int curRemainQty, String productCod, String cod) {
		// TODO Auto-generated method stub
		return ordersMapper.updateOrderDetailFull(curRemainQty, productCod, cod);
	}

	@Override
	public int updateProductFull(int curRemainQty, String productCod) {
		// TODO Auto-generated method stub
		return ordersMapper.updateProductFull(curRemainQty, productCod);
	}

	@Override
	public int updateOrderDetailPartial(int availableQty, String productCod, String cod) {
		// TODO Auto-generated method stub
		return ordersMapper.updateOrderDetailPartial(availableQty, productCod, cod);
	}

	@Override
	public int updateProductPartial(int availableQty, String productCod) {
		// TODO Auto-generated method stub
		return ordersMapper.updateProductPartial(availableQty, productCod);
	}

	@Override
	public int updateNoProuctQty(String productCod, String cod) {
		// TODO Auto-generated method stub
		return ordersMapper.updateNoProuctQty(productCod, cod);
	}






}
