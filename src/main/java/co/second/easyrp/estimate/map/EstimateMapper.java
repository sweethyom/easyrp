package co.second.easyrp.estimate.map;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.estimate.service.EstimateVO;

public interface EstimateMapper {

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
	int EstimateInsert2(@Param("cod") String cod, @Param("prodName") String prodName, @Param("qty") int qty);
	
	String EstimateRecentCodSelect();
	
	int EstimateUpdate(@Param("cod") String cod, @Param("qty") int qty, @Param("num") int num);
	int EstimateDelete(String cod);
	int EstimateDetailDelete(@Param("productCod") String productCod, @Param("cod") String cod);
	
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
	
	int EstimateDetailInsert(@Param("cod") String cod, @Param("prodname") String prodname, @Param("qty") int qty);
	
	List<EstimateVO> EstimateSelectList1();
	
}
