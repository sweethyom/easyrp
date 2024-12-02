package co.second.easyrp.inventorycount.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchVO {
	private String searchCod;
	private Date searchCountDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date preSearchDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date postSearchDate;
	private String searchWarehouse;
	private String searchLocation;
	private String searchProduct;
	private String searchInventory;
	private String searchCountClass;
	private String searchEmployee;
	private String searchAccount;
	private int pageSize = 10;
	private int offset = 0;
}
