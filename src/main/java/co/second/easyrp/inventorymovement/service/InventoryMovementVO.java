package co.second.easyrp.inventorymovement.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InventoryMovementVO {
	private String cod;
	private Date moveDate;
	private String oboundWarehouse;
	private String oboundLocation;
	private String iboundWarehouse;
	private String iboundLocation;
	private String employeeCod;
	private String productCod;
	private String productName;
	private String spec;
	private int unit;
	private String deleteyn;
	private int qty;
}
