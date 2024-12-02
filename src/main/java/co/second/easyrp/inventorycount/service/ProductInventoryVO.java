package co.second.easyrp.inventorycount.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductInventoryVO {
	private String cod;
	private String name;
	private int computingQty;
	private int countQty;
	private int diffQty;
	private String procclass;
	private int adjQty;
	private String note;
	private String warehouse;
	private String account;
}
