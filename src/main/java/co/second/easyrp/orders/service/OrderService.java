package co.second.easyrp.orders.service;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.estimate.service.EstimateVO;


public interface OrderService {
	
	List<OrdersVO> OrdersSelectList(		    
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("employeeCod") String employeeCod,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate,
		    @Param("ddaypreSearchDate") Date ddaypreSearchDate, 
		    @Param("ddaypostSearchDate") Date ddaypostSearchDate
		);
	
	int countSalesTables(
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("employeeCod") String employeeCod,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate,
		    @Param("ddaypreSearchDate") Date ddaypreSearchDate, 
		    @Param("ddaypostSearchDate") Date ddaypostSearchDate
		);
	
	List<OrdersVO> OrderDetailSelectList(String cod);
	OrdersVO OrderSelect(String cod);
	
	
	List<OrdersVO> ordersSelectListAll(); //수주 리스트 전체 조회
	List<OrdersVO> ordersSelectList(OrdersVO ordersVo); //조건에 따른 리스트 조회
	OrdersVO ordersSelect(OrdersVO ordersVo); //건별 조회(상세보기)
	
	int ordersInsert(OrdersVO ordersVo); //등록
	int ordersInsert2(String cod, String prodname, int qty);
	
	int ordersUpdate(OrdersVO ordersVo); //수정
	int ordersDelete(OrdersVO ordersVo); //삭제
	
	int checkProduct(String productCod);
	int updateOrderDetailFull(int curRemainQty, String productCod, String cod);
	int updateProductFull(int curRemainQty, String productCod);
	int updateOrderDetailPartial(int availableQty, String productCod, String cod);
	int updateProductPartial(int availableQty, String productCod);
	
	int updateNoProuctQty(String productCod, String cod);
}
