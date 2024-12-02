package co.second.easyrp.inventorycount.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class InventoryAdjustmentVO {
		private String cod;
		private Date date;
		private String employeeCod;
	}
