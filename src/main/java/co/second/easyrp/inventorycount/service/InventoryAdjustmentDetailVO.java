package co.second.easyrp.inventorycount.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InventoryAdjustmentDetailVO {
		private int num;
		private String inventoryadjustmentCod;
		private String invCod;
		private String productCod;
		private String spec;
		private int unitCod;
		private int qty;
		private int price;
		private String deleteyn;
		private String note;
		private String product;
		private String inventory;
		private int countQty;
		private int computingQty;
		private int unitPrice;
		private int icdnum;
	}
