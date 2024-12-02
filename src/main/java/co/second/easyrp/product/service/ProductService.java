package co.second.easyrp.product.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ProductService {
	List<ProductVO>productList(
			@Param("pageSize") int pageSize,
			@Param("offset") int offset,
			@Param("cod") String cod,
		    @Param("warehouse") String warehouse, 
		    @Param("employee") String employee,  
		    @Param("account") String account,
			 @Param("preSearchDate") Date preSearchDate, 
			    @Param("postSearchDate") Date postSearchDate
	);
	
	int countProductLists(
			@Param("cod") String cod,
		    @Param("warehouse") String warehouse, 
		    @Param("employee") String employee, 
		    @Param("account") String account,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
			);
	
	//제품찾기 modal에 뿌려줄 리스트를 가져오기위한 메소드
	//2024년 5월 14일 하서현
	List<Map<String, Object>> prodSearch();
	
	//제품의 현재고량을 증가 또는 감소하는 메소드
	//하서현
	int updateCurInvQtyFromPrd(int amount, String cod);
}
