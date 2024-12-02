package co.second.easyrp.purchaseorderdetail.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PurchaseOrderDetailVO {
	private int num;
	private String purchaseorderCod;
	private String invoiceCod;
	private int invoicedetailNum;
	private String productCod;
	private String inventoryCod;
	private int unitMgmt;
	private int mgmtQty;
	private int unitInv;
	private int invQty;
	private int unitprice;
	private int supprice;
	private int vax;
	private int total;
}
