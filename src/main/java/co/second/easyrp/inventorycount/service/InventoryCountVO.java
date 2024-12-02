package co.second.easyrp.inventorycount.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InventoryCountVO {
	private String cod;
	private String employeeCod;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date countDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date invDate;
	private String warehouseCod;
	private String locationCod;
	private String countclass;
	private String deleteyn;
	private String warehouse;
	private String employee;
	private String location;
	private String prcClass;
}
