package co.second.easyrp.chart.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChartVO {
	private String productCod;
	private String prodname;
	private int year;
	private int month;
	private int totalQty;
	private String salesClosingState;
	
	private int ratio;
	
	private int orderYear;
	private int orderMonth;
	private Long productSales;
	private double salesPercentage;
	
	private int donut_year;
}
