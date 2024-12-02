package co.second.easyrp.inventorycount.service;

import java.util.List;

import co.second.easyrp.warehouse.service.WareHouseVO;


//import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;

public interface InventoryCountService {
	List<InventoryCountVO> inventoryCountList(SearchVO searchvo);
	int insertInventoryCount(InventoryCountVO vo);
	int updateInventoryCount(InventoryCountVO vo);
	int deleteInventoryCount(InventoryCountVO vo); 
	List<InventoryCountVO> selectInventoryCountList(String countdetail);
	List<InventoryCountDetailVO> selectedInventoryCountDetailList(String countdetail);
	List<ProductInventoryVO> getAllProductInventoryList();
	List<ProductInventoryVO> getAllSelectedCountList(String prodInvCod);
	int countInventoryCountLists(SearchVO searchVo);
	int insertCountDetailList(InventoryCountDetailVO inventorycountdetailvo);
	List<WareHouseVO> warehouseList();
	List<ProductInventoryVO> getAllProdInvWarehouse(WareHouseVO warehousevo);
	List<WareHouseVO> selectedWarehouseList(WareHouseVO warehousevo);
	List<ProductInventoryVO> getProdInvAccount(ProductInventoryVO productinventoryvo);
	int selectMaxCod();
	String wareHouseCod(String warehouse);
	Integer getcomputingqty(String prodinvcod);
	String selectinventoryadjustmentdetail(int adjustmentnum);
	String selectedInventoryCountDetailName(int adjustmentnum);
	Integer getcountqty(int adjustmentnum);
	Integer getprice(String prodinvcod);
	int insertAdjustmentList(InventoryAdjustmentVO inventoryadjustmentvo);
	int insertAdjustmentDetailList(InventoryAdjustmentDetailVO inventoryadjustmentdetailvo);
	int selectMaxinvadjCod();
	int updateinventoryadjustment(InventoryAdjustmentDetailVO inventoryadjustmentdetailvo);
	int updateproductadjustment(InventoryAdjustmentDetailVO inventoryadjustmentdetailvo);
	int updateinventorycountdetailprocclass(int adjnum);
	Integer selectinventoryadjustmentnum(InventoryAdjustmentDetailVO inventoryadjustmentdetailvo);
	Integer selectinventorycountmentnum(InventoryCountDetailVO inventorycountdetailvo);
	InventoryCountVO selectInventoryCount(String countdetail);
	InventoryCountDetailVO selectedInventoryCountDetail(String countdetail);
	int updateinventorycountprocclass(String countcod);
	String selectinventorycountcod(int adjnum);
}
