package co.second.easyrp.bom.service;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 5월 14일 오전 9시 23분 박현우)
@Getter
@Setter
@ToString
public class BomVO {
	private String prodCod;
	private String productName;
	private String productGroupName;
	private String invCod;
	private String invName;
	private int quantity;
	private int invUnitprice;
	private int stdprice;
	
    // 여러 개의 BOM 데이터를 담을 리스트 추가
    private List<BomVO> bomList;
}
