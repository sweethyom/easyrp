package co.second.easyrp.estimate.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EstimateVO {
	private String cod;
	private Date estDate;
	private String clientCod;
	private String employeeCod;
	private int price;
	private int subtotal;
	private String deleteyn;
	private int total;
	private String orderyn;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date preSearchDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date postSearchDate;
	
	private String name;
	
	private int num;
	private int qty;
	private String prodName;
	private String productCod;
	private String clientName;
	private String empName;
	private String deptName;
	private int unitprice;
	private int totalsum;
	private String employeeName;
}
