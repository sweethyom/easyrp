package co.second.easyrp.inventorycount.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InventoryCountDetailVO {
	private int num;
	private String inventorycountCod; 
	private String productCod;
	private String inventoryCod;
	private String spec;
	private int unitCod;
	private int qty;
	private String procClass;
	private int adjustmentdetailNum;
	private String account;
	private String deleteyn;
	private String note;
	private int diffQty;
	private int computingQty;
	private String product;
	private String inventory;
	private int price;
	private int unitprice;
}
