package co.second.easyrp.invoice.service;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchVO {
	private String searchPlan;
	private String searchProdCod;
	private String searchProdName;
	private String searchClient;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date preSearchDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date postSearchDate;
	private int pageSize = 10;
	private int offset = 0;
}
