package co.second.easyrp.warehouse.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.warehouse.map.WareHouseMapper;
import co.second.easyrp.warehouse.service.SearchVO;
import co.second.easyrp.warehouse.service.WareHouseService;
import co.second.easyrp.warehouse.service.WareHouseVO;

@Service
@Primary
public class WareHouseServiceImpl implements WareHouseService {
	
	@Autowired
	WareHouseMapper houseMapper;

	@Override
	public List<WareHouseVO> warehouseTableAllList(SearchVO searchVo) {
		return houseMapper.warehouseTableAllList(searchVo);
	}

	@Override
	public WareHouseVO getWareHouseData(String cod) {
		return houseMapper.getWareHouseData(cod);
	}

	@Override
	public String getMaxCode() {
		String maxCod = houseMapper.getMaxCode();
		if (maxCod != null && !maxCod.isEmpty()) {
			String prefix = maxCod.replaceAll("[0-9]", ""); // 모든 숫자를 제거하여 접두사만 추출
			String numberPart = maxCod.substring(prefix.length()); // 접두사 이후부터 문자열 끝까지 숫자 부분 추출
			int number = Integer.parseInt(numberPart) + 1; // 자른 숫자부분에 +1을 더함
			// C언어 포맷팅 생각하면 편함
			// numberPart.length() 이 부분이 3이라서 자동으로 %03가 완성 (%03d, number)
			// 이렇게되면 number가 21이면 %03d로 인해 021로 바뀜
			String formattedNumber = String.format("%0" + numberPart.length() + "d", number); 

			return prefix + formattedNumber;
		}
		return null;
	}

	@Override
	public int warehouseInsertFn(WareHouseVO houseVO) {
		return houseMapper.warehouseInsertFn(houseVO);
	}

	@Override
	public int warehouseUpdateFn(WareHouseVO houseVO) {
		return houseMapper.warehouseUpdateFn(houseVO);
	}

	@Override
	public int warehouseDeleteFn(String cod) {
		return houseMapper.warehouseDeleteFn(cod);
	}

	@Override
	public int countWarehouseTable(SearchVO searchVo) {
		return houseMapper.countWarehouseTable(searchVo);
	}

	@Override
	public List<WareHouseVO> apiGetWarehouse() {
		return houseMapper.apiGetWarehouse();
	}

}
