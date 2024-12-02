package co.second.easyrp.salesplan.service;



import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SalesplanVO {
	private String cod;
	private String clientCod;
	private String productCod;
	private Date planDate;
	private int basicplnQty;
	private int modplnQty;
	private String closing;
	private String deleteyn;
	private Date preSearchDate;
	private Date postSearchDate;
	
	private String name;
	private String prodName;
	

}
