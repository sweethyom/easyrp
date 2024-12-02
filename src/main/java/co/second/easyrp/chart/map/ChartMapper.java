package co.second.easyrp.chart.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.second.easyrp.chart.service.ChartVO;

public interface ChartMapper {

	List<ChartVO> ProductSelectList();
	List<ChartVO> getOrderByProductAndYear(@Param("productCod") String productCod, @Param("year") int year);
	List<ChartVO> getSalesPlanByProductAndYear(@Param("productCod") String productCod, @Param("year") int year);
	
	List<ChartVO> getTop3Product(@Param("donut_year") int donut_year, @Param("month") int month);
	
}
