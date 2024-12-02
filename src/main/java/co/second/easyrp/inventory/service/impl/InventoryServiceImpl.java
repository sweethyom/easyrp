package co.second.easyrp.inventory.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.inventory.map.InventoryMapper;
import co.second.easyrp.inventory.service.InventoryService;
import co.second.easyrp.inventory.service.InventoryVO;

@Service
@Primary
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryMapper inventorymapper;

	@Override
	public List<InventoryVO> inventoryList(int page, int size, String cod, String warehouse,String employee, String account, Date preSearchDate, Date postSearchDate) {
		int offset = (page-1)*size;
		return inventorymapper.inventoryList(size, offset, cod, warehouse, employee, account, preSearchDate, postSearchDate);
	}

	@Override
	public int countInventoryLists(String cod, String warehouse, String employee, String account, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return inventorymapper.countInventoryLists(cod, warehouse, employee, account, preSearchDate, postSearchDate);
	}

	@Override
	public int insertInventory(InventoryVO vo) {
		// TODO Auto-generated method stub
		return inventorymapper.insertInventory(vo);
	}

	@Override
	public int updateInventory(InventoryVO vo) {
		// TODO Auto-generated method stub
		return inventorymapper.updateInventory(vo);
	}

	@Override
	public int deleteInventory(InventoryVO vo) {
		// TODO Auto-generated method stub
		return inventorymapper.deleteInventory(vo);
	}
	
	//자재찾기 modal에 뿌려줄 리스트를 가져오기위한 메소드
	//2024년 5월 14일 오후 2시 28분 하서현
	@Override
	public List<Map<String, Object>> inventorySearch() {
		// TODO Auto-generated method stub
		return inventorymapper.inventorySearch();
	}

	//안전재고를 계산해서 가져오는 메소드
	//2024.05.20 14:12 손지은 추가
	@Override
	public int selectInventoryQty(String cod) {
		// TODO Auto-generated method stub
		return inventorymapper.selectInventoryQty(cod);
	}
	
	@Override
	public int updateCurInvQtyFromInv(int amount, String cod) {
		// TODO Auto-generated method stub
		return inventorymapper.updateCurInvQtyFromInv(amount, cod);
	}

}
