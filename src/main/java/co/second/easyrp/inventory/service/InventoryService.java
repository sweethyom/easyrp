package co.second.easyrp.inventory.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface InventoryService {
	//재고 모든 목록
	List<InventoryVO> inventoryList(
			@Param("pageSize") int pageSize,
			@Param("offset") int offset,
			@Param("cod") String cod,
		    @Param("warehouse") String warehouse, 
		    @Param("employee") String employee,  
		    @Param("account") String account,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
			);

	int countInventoryLists(
			@Param("cod") String cod,
		    @Param("warehouse") String warehouse, 
		    @Param("employee") String employee, 
		    @Param("account") String account,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
			);

	int insertInventory(InventoryVO vo);
	int updateInventory(InventoryVO vo);
	int deleteInventory(InventoryVO vo);
	
	//자재찾기 modal에 뿌려줄 리스트를 가져오기위한 메소드
	//2024년 5월 14일 오후 2시 28분 하서현
	List<Map<String, Object>> inventorySearch();
	
	//가용재고 계산해서 가져오는 메소드
	//2024.05.20 14:12 손지은 추가
	int selectInventoryQty(String cod);
	
	//자재의 현재고량을 증가 또는 감소하는 메소드
	//하서현
	int updateCurInvQtyFromInv(@Param("amount")int amount, @Param("cod")String cod);
}
