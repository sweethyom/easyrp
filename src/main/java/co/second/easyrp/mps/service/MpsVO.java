package co.second.easyrp.mps.service;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MpsVO {
	private String cod;
	private String orderCod;
	private int orderdetailNum;
	private String salesplanCod;
	private String productCod;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date planDate;
	private int qty;
	private String employeeCod;
	private String procurement;
	private String account;
	private String plan;
	private String note;
	private String closing;
	private String deleteyn;
	
	private String prodname;
	private String spec;
	private String unitName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date dday;
	private String clientName;
	
//	private String searchProdCod;
//	private String searchProdName;
//	private String searchClient;
//	@DateTimeFormat(pattern="yyyy-MM-dd")
//	private Date preSearchDate;
//	@DateTimeFormat(pattern="yyyy-MM-dd")
//	private Date postSearchDate;
}
