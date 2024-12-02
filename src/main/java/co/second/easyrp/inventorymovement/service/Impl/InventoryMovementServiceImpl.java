package co.second.easyrp.inventorymovement.service.Impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.inventorymovement.mapper.InventoryMovementMapper;
import co.second.easyrp.inventorymovement.service.InventoryMovementService;
import co.second.easyrp.inventorymovement.service.InventoryMovementVO;
import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;
@Service
@Primary
public class InventoryMovementServiceImpl implements InventoryMovementService {

	@Autowired
	InventoryMovementMapper inventorymovementmapper;
	
	@Override
	public InventoryMovementVO selectInventoryMovementDateScope(InventoryMovementVO vo) {
		return inventorymovementmapper.selectInventoryMovementDateScope(vo);
	}
	
	@Override
	public int insertInventoryMovement(InventoryMovementVO vo) {
		// TODO Auto-generated method stub
		return inventorymovementmapper.insertInventoryMovement(vo);
	}

	@Override
	public int updateInventoryMovement(InventoryMovementVO vo) {
		// TODO Auto-generated method stub
		return inventorymovementmapper.updateInventoryMovement(vo);
	}

	@Override
	public int deleteInventoryMovement(InventoryMovementVO vo) {
		// TODO Auto-generated method stub
		return inventorymovementmapper.deleteInventoryMovement(vo);
	}

	@Override
	public List<InventoryMovementVO> inventoryMovementList(int page, int size, String cod, String oboundWarehouse,
			String oboundLocation, String iboundWarehouse, String iboundLocation, String employeeCod,
			String purchaseDetailCod, String productCod, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		int offset = (page-1)*size;
		return inventorymovementmapper.inventoryMovementList(size, offset, cod, oboundWarehouse, oboundLocation, iboundWarehouse, iboundLocation, employeeCod, purchaseDetailCod, productCod, preSearchDate, postSearchDate);
	}

//	@Override
//	public List<KeyValueVO> getAllKeyValues() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<PurchaseOrderDetailVO> getAllPurchaseOrderDatas() {
		// TODO Auto-generated method stub
		return inventorymovementmapper.getAllPurchaseOrderDatas();
	}

//	@Override
//	public CommonTableVO getCommonData(int postId) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int countInventoryMovementLists(String cod, String oboundWarehouse, String oboundLocation,
			String iboundWarehouse, String iboundLocation, String employeeCod, String purchaseDetailCod,
			String productCod, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return inventorymovementmapper.countInventoryMovementLists(cod, oboundWarehouse, oboundLocation, iboundWarehouse, iboundLocation, employeeCod, purchaseDetailCod, productCod, preSearchDate, postSearchDate);
	}

}
