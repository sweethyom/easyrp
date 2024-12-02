package co.second.easyrp.orders.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersVO {
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date preSearchDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date postSearchDate;
	
	
	private String cod;
	private String prodname;
	private int stdprice;
	private int unitprice;
	private int basicInvQty;
	private int baseInvPrice;
	private String spec;
	private int safetyInvQty;
	private int curInvQty;
	private int curInvPrice;
	private String warehouseCod;
	private String productgroupCod;
	private int unitCod;
	private String account;
	private String note;
	
	private String empName;
	private String employeeCod;
	private String clientCod;
	private Date orderDate;
	private Date dday;
	private int subtotal;
	private int total;
	private String clientName;
	private String deptName;
	private String productCod;
	private int qty;
	private int curRemainQty;
	private int deliveryState;
	private String estimateCod;
	private String instockyn;
	
	// 2024년 5월 22일 오후 12시 02분 박현우 추가
	private String outboundState;
	private String isSpecification;
	
}
