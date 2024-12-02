package co.second.easyrp.client.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 7일 오전 11시 46분 박현우)
@Getter
@Setter
@ToString
public class SearchVO {
	private String searchCod;
	private String searchName;
	private String searchAddress;
	private String searchRepresentative;
	private String searchManagerName;
	private int pageSize = 10;
	private int offset = 0;
}
