package co.second.easyrp.salesclosing.service;


import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 20일 오후 2시 23분 박현우)
@Getter
@Setter
@ToString
public class SalesClosingVO {
	private String orderCod;
	private long total;
	private String salesClosingState;
	private Date salesClosingDate;
	
	// 여러개의 row Cod를 받기 위한 리스트 추가
	private List<SalesClosingVO> rowOrderCodDatas;
}
