package co.second.easyrp.productmgmt.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월12일 오후 2시 3분 박현우)
@Getter
@Setter
@ToString
public class SearchVO {
	private String searchCod;
	private String searchName;
	private String searchWarehouseName;
	private String searchProductGroupName;
	private String searchEmployeeCod;
	private int pageSize = 10;
	private int offset = 0;
}
