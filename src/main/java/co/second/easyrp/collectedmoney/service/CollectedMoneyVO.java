package co.second.easyrp.collectedmoney.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 16일 오후 1시 32분 박현우)
@Getter
@Setter
@ToString
public class CollectedMoneyVO {
	private String orderCod;
	private long colsum;
	private Date collectedStartDate;
	private Date colday;
	private int state;
	private long colamount;
	private long unrev;
	private long balance;
	private String empCod;
	private String deleteyn;
	private String stateName;
}
