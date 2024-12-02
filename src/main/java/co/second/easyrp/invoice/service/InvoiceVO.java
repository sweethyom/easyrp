package co.second.easyrp.invoice.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InvoiceVO {
	private String cod;
	private String invDate;
	private String invClass;
	private String employeeCod;
	private String inqClass;
	private String inqDate;
	private String employeeCodInq;
	private String inqReason;
	private String note;
	private String prodReady;
	private String deleteyn;
	
	private String employeeName;

	private String iboundyn;
}
