package co.second.easyrp.mrp.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MrpVO {
	//2024.05.14 16:00 손지은 수정 / 테이블에 컬럼 추가로 변수 생성
	private String cod;
	private int num;
	private String mpsCod;
	private String productCod;
	private String inventoryCod;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date takeDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date poDate;
	private int qty;
	private String employeeCod;
	private String account;
	private String closing;
	private String deleteyn;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date dday;
	private String prodname;
	private String spec;
	private String unitName;
	private String invCod;
	private int invQty;
	private String invname;
	private String invSpec;
	private String invUnitName;
	private String invoiceUnitName;
	private String invoiceInvUnitNmae;
	private int amount;
	private int invAmount;
	private int invoiceAmount;
	private int invoiceUnitAmount;
	private String clientName;
	private int unitprice;
	private String prodCod;
	private int curInvQty;
}
