package co.second.easyrp.inventorymgmt.service;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 12일 오후 7시 3분 박현우)
@Getter
@Setter
@ToString
public class InventoryMgmtVO {
	private String cod;
	private String name;
	private Date invDate;
	private long unitprice;
	private int qty;
	private long price;
	private String spec;
	private int safetyInvQty;
	private int curInvQty;
	private long curInvPrice;
	private String warehouseCod;
	private String productGroupCod;
	private int unitCod;
	private int unitAmount;
	private int mgmtUnitCod;
	private int mgmtUnitAmount;
	private String account;
	private String note;
	private String employeeCod;
	private String deleteyn;
	private String productGroupName;
	private String warehouseName;
	private String unitName;
	private String mgmtUnitName;
}
