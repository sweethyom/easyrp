package co.second.easyrp.purchaseorder.service;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import co.second.easyrp.purchaseorderdetail.service.PurchaseOrderDetailVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PurchaseOrderVO {
	private List<PurchaseOrderDetailVO> poDetailList;
	private String cod;
	private String poDate;
	private String closingDate;
	private String clientCod;
	private String iboundDate;
	private String dday;
	private int stateCod;
	private int taxdivisionCod;
	private String employeeCodWriter;
	private String employeeCodPo;
	private String employeeCodIbound;
	private int printcnt;
	private String note;
	private String deleteyn;
	private String searchCod;
	private String searchFromPoDate;
	private String searchToPoDate;
	private String searchFromIboundDate;
	private String searchToIboundDate;
	private String searchClientCod;
	private String searchClientName;
	private String searchEmpCodPo;
	private String searchEmpNamePo;	
	private String searchEmpCodIbound;
	private String searchEmpNameIbound;
	private String searchStateCod;
	private String searchFromClosingDate;
	private String searchToClosingDate;
	private String searchFromDday;
	private String searchToDday;
	private int page;
	private int size;
	private int offset;
	
	public PurchaseOrderVO() {
		this.page = 1;
		this.size = 10;
	}
}
