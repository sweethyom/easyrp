package co.second.easyrp.specification.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SpecificationVO {
	
	// 수주쪽 VO
	private String orderCod;
	private String clientName;
	private String clientAddress;
	private String clientTel;
	private Date orderDate;
	private String productName;
	private int orderQty;
	private int unitPrice;
	private int supplyPrice;
	private String outboundState;
	private String isSpecification;
	
	// 발주쪽 VO
	private String purchaseCod;
	private Date purchaseDate;
	private int purchaseMgmtQty;
	private int purchaseInvQty;
	private String stateCod;
	private String inventoryName;
}
