package co.second.easyrp.warehouse.map;

import java.util.List;

import co.second.easyrp.warehouse.service.SearchVO;
import co.second.easyrp.warehouse.service.WareHouseVO;

//(2024년 5월 5일 오전 10시 13분 박현우)
public interface WareHouseMapper {
	
	List<WareHouseVO> warehouseTableAllList(SearchVO searchVo);
	
	List<WareHouseVO> apiGetWarehouse();
	
	WareHouseVO getWareHouseData(String cod);
	
	String getMaxCode();
	
	int warehouseInsertFn(WareHouseVO houseVO);
	
	int warehouseUpdateFn(WareHouseVO houseVO);
	
	int warehouseDeleteFn(String cod);
	
	int countWarehouseTable(SearchVO searchVo);
}
