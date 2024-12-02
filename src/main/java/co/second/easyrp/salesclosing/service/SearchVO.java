package co.second.easyrp.salesclosing.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 20일 오후 2시 22분 박현우)
@Getter
@Setter
@ToString
public class SearchVO {
	private String searchOrderCod;
	private String searchSalesClosingState;
	private String preSearchDate;
	private String postSearchDate;
	private int pageSize = 10;
	private int offset = 0;
}
