package co.second.easyrp.productmgmt.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 12일 오후 1시 55분 박현우)
@Getter
@Setter
@ToString
public class ProductMgmtVO {
	private String cod;
	private String prodname;
	private int stdprice;
	private int unitprice;
	private int basicInvQty;
	private long basicInvPrice;
	private String spec;
	private int safteyInvQty;
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
	private String prodGroupName;
	private String warehouseName;
	private String unitName;
	private String mgmtUnitName;
	private String isBominsert;
}
