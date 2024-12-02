package co.second.easyrp.orderdetail.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderdetailVO {
	//2024.05.14 15:05 손지은 , orderdetail 수정에 따른 변수 추가
	private String cod;
	private int num;
	private String productCod;
	private int qty;
	private int curRemainQty;
	private int vax;
	private int total;
	private int curRemainPrice;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date deliveryDate;
	private int deliverState;
	private String note;
	private String mpsState;
	private String deleteyn;
	private int subtotal;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date orderDate;
	private String clientName;
	private String prodname;
	private String unitName;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date planDate;
	
	private String empName;
	private String deptName;
	private int productPrice;
	private int availableQty;
	
	//2024.05.23 13:13 손지은 추가
	//출고예정일 대신 납기일 가져오기로 수정해서 변수 추가
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date dday;
}
