package co.second.easyrp.purchaseclosing.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchVO {
	private String searchPurchaseCod;
	private int searchPurchaseClosingState;
	private String preSearchDate;
	private String postSearchDate;
	private int pageSize = 10;
	private int offset = 0;
}