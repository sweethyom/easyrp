package co.second.easyrp.estimate.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;



public interface EstimateService {
	
	List<EstimateVO> EstimateSelectList(		    
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("employeeCod") String employeeCod,
		    @Param("employeeName") String employeeName,
		    @Param("orderyn") String orderyn,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	
	EstimateVO EstimateSelect(String cod);
	
	int EstimateInsert(EstimateVO estimatevo);
	int EstimateInsert2(String cod, String prodName, int qty);
	
	String EstimateRecentCodSelect();
	
	int EstimateUpdate(String cod, int qty, int num);
	int EstimateDelete(String cod);
	int EstimateDetailDelete(String productCod, String cod);
	
	int countSalesTables(
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("employeeCod") String employeeCod,
		    @Param("employeeName") String employeeName,
		    @Param("orderyn") String orderyn,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	
	List<EstimateVO> ClientNameSelectList();
	List<EstimateVO> ProductNameSelectList();
	
	List<EstimateVO> EstimateDetailSelectList(String cod);
	
	int EstimateDetailInsert(String cod, String prodname, int qty);
	
	List<EstimateVO> EstimateSelectList1();
	
	
}
