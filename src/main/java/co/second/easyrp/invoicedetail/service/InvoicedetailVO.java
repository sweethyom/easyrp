package co.second.easyrp.invoicedetail.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InvoicedetailVO {
	private int num;
	private String invoiceCod;
	private String mrpCod;
	private String productCod;
	private String inventoryCod;
	private int invQty;
	private int invMgmtQty;
	private int inqQty;
	private int inqRemainQty;
	private int unitprice;
	private int supprice;
	private int vax;
	private int total;
	private String closing;
	private String deleteyn;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date invDate;
	private String employeeName;
	private String note;
	private String prodname;
	private String spec;
	private String unitName;
	private String mgmtUnitName;
	private String invname;
	private String invSpec;
	private String invUnitName;
	private String invMgmtUnitName;
	private String clientName;
	private String invClass;
}
