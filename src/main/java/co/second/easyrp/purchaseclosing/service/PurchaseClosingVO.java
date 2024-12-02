package co.second.easyrp.purchaseclosing.service;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PurchaseClosingVO {
	private String purchaseCod;
	private long total;
	private int stateCod;
	private Date closingDate;
	
	// 여러개의 row Cod를 받기 위한 리스트 추가
	private List<PurchaseClosingVO> rowPurchaseCodDatas;
}
