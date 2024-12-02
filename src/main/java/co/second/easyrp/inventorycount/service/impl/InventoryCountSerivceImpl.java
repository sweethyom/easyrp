package co.second.easyrp.inventorycount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.inventorycount.mapper.InventoryCountMapper;
import co.second.easyrp.inventorycount.service.InventoryAdjustmentDetailVO;
import co.second.easyrp.inventorycount.service.InventoryAdjustmentVO;
import co.second.easyrp.inventorycount.service.InventoryCountDetailVO;
import co.second.easyrp.inventorycount.service.InventoryCountService;
import co.second.easyrp.inventorycount.service.InventoryCountVO;
import co.second.easyrp.inventorycount.service.ProductInventoryVO;
import co.second.easyrp.inventorycount.service.SearchVO;
import co.second.easyrp.warehouse.service.WareHouseVO;

@Service
@Primary
public class InventoryCountSerivceImpl implements InventoryCountService {

	@Autowired
	InventoryCountMapper inventorycountmapper;
	

	@Override
	public int insertInventoryCount(InventoryCountVO vo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.insertInventoryCount(vo);
	}

	@Override
	public int updateInventoryCount(InventoryCountVO vo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.updateInventoryCount(vo);
	}

	@Override
	public int deleteInventoryCount(InventoryCountVO vo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.deleteInventoryCount(vo);
	}


	@Override
	public List<InventoryCountVO> inventoryCountList(SearchVO searchVo) {
		return inventorycountmapper.inventoryCountList(searchVo);
	}

	@Override
	public int countInventoryCountLists(SearchVO searchVo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.countInventoryCountLists(searchVo);
	}

	@Override
	public List<InventoryCountVO> selectInventoryCountList(String countdetail) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectInventoryCountList(countdetail);
	}


	@Override
	public List<ProductInventoryVO> getAllProductInventoryList() {
		// TODO Auto-generated method stub
		return inventorycountmapper.getAllProductInventoryList();
	}

	@Override
	public List<ProductInventoryVO> getAllSelectedCountList(String prodInvCod) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getAllSelectedCountList(prodInvCod);
	}

	@Override
	public int insertCountDetailList(InventoryCountDetailVO inventorycountdetailvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.insertCountDetailList(inventorycountdetailvo);
	}

	@Override
	public List<WareHouseVO> warehouseList() {
		// TODO Auto-generated method stub
		return inventorycountmapper.warehouseList();
	}

	@Override
	public List<ProductInventoryVO> getAllProdInvWarehouse(WareHouseVO warehousevo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getAllProdInvWarehouse(warehousevo);
	}

	@Override
	public List<WareHouseVO> selectedWarehouseList(WareHouseVO warehousevo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectedWarehouseList(warehousevo);
	}

	@Override
	public List<ProductInventoryVO> getProdInvAccount(ProductInventoryVO productinventoryvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getProdInvAccount(productinventoryvo);
	}

	@Override
	public int selectMaxCod() {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectMaxCod();
	}

	@Override
	public String wareHouseCod(String warehouse) {
		// TODO Auto-generated method stub
		return inventorycountmapper.wareHouseCod(warehouse);
	}

	@Override
	public Integer getcomputingqty(String prodinvcod) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getcomputingqty(prodinvcod);
	}

	@Override
	public List<InventoryCountDetailVO> selectedInventoryCountDetailList(String countdetail) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectedInventoryCountDetailList(countdetail);
	}

	@Override
	public String selectinventoryadjustmentdetail(int adjustmentnum) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectinventoryadjustmentdetail(adjustmentnum);
	}

	@Override
	public String selectedInventoryCountDetailName(int adjustmentnum) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectedInventoryCountDetailName(adjustmentnum);
	}

	@Override
	public Integer getcountqty(int adjustmentnum) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getcountqty(adjustmentnum);
	}

	@Override
	public Integer getprice(String prodinvcod) {
		// TODO Auto-generated method stub
		return inventorycountmapper.getprice(prodinvcod);
	}

	@Override
	public int insertAdjustmentList(InventoryAdjustmentVO inventoryadjustmentvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.insertAdjustmentList(inventoryadjustmentvo);
	}

	@Override
	public int insertAdjustmentDetailList(InventoryAdjustmentDetailVO inventoryadjustmentdetailvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.insertAdjustmentDetailList(inventoryadjustmentdetailvo);
	}

	@Override
	public int selectMaxinvadjCod() {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectMaxinvadjCod();
	}

	@Override
	public int updateinventoryadjustment(InventoryAdjustmentDetailVO inventoryadjustmentdetailvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.updateinventoryadjustment(inventoryadjustmentdetailvo);
	}

	@Override
	public int updateproductadjustment(InventoryAdjustmentDetailVO inventoryadjustmentdetailvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.updateproductadjustment(inventoryadjustmentdetailvo);
	}

	@Override
	public int updateinventorycountdetailprocclass(int adjnum) {
		// TODO Auto-generated method stub
		return inventorycountmapper.updateinventorycountdetailprocclass(adjnum);
	}

	@Override
	public Integer selectinventoryadjustmentnum(InventoryAdjustmentDetailVO inventoryadjustmentdetailvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectinventoryadjustmentnum(inventoryadjustmentdetailvo);
	}

	@Override
	public Integer selectinventorycountmentnum(InventoryCountDetailVO inventorycountdetailvo) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectinventorycountmentnum(inventorycountdetailvo);
	}

	@Override
	public InventoryCountVO selectInventoryCount(String countdetail) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectInventoryCount(countdetail);
	}

	@Override
	public InventoryCountDetailVO selectedInventoryCountDetail(String countdetail) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectedInventoryCountDetail(countdetail);
	}

	@Override
	public int updateinventorycountprocclass(String countcod) {
		// TODO Auto-generated method stub
		return inventorycountmapper.updateinventorycountprocclass(countcod);
	}

	@Override
	public String selectinventorycountcod(int adjnum) {
		// TODO Auto-generated method stub
		return inventorycountmapper.selectinventorycountcod(adjnum);
	}

}
