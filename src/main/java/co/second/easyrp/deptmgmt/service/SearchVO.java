package co.second.easyrp.deptmgmt.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 3일 오후 3시 15분 박현우)
@Getter
@Setter
@ToString
public class SearchVO {
	private String searchCod;
	private String searchName;
	private String searchWrkName;
	private String searchLocation;
	private int pageSize = 10;
	private int offset = 0;
}
