package co.second.easyrp.warehouse.service;

import java.util.List;

//(2024년 5월 5일 오전 10시 13분 박현우)
public interface WareHouseService {
	
	List<WareHouseVO> warehouseTableAllList(SearchVO searchVo);
	
	WareHouseVO getWareHouseData(String cod);
	
	List<WareHouseVO> apiGetWarehouse();
	
	String getMaxCode();
	
	int warehouseInsertFn(WareHouseVO houseVO);
	
	int warehouseUpdateFn(WareHouseVO houseVO);
	
	int warehouseDeleteFn(String cod);
	
	int countWarehouseTable(SearchVO searchVo);
	
}
