package co.second.easyrp.salesplan.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SalesplanService {
	List<SalesplanVO> SalesplanSelectList(		    
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("productCod") String productCod,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	
	SalesplanVO SalesplanSelect(SalesplanVO vo);
	int SalesplanInsert(SalesplanVO vo);
	int SalesplanUpdate(SalesplanVO vo);
	int SalesplanDelete(SalesplanVO vo);
	
	int countSalesTables(
			@Param("pageSize") int pageSize, 
		    @Param("offset") int offset, 
		    @Param("cod") String cod,
		    @Param("clientCod") String clientCod,
		    @Param("productCod") String productCod,
		    @Param("preSearchDate") Date preSearchDate, 
		    @Param("postSearchDate") Date postSearchDate
		);
	
	List<SalesplanVO> ClientNameSelectList();
	List<SalesplanVO> ProductNameSelectList();
	String ClientCodSelect(String ClientName);
	String ProductCodSelect(String ProductName);
	
	SalesplanVO SalesplanNameSelect(String cod);
	
}
