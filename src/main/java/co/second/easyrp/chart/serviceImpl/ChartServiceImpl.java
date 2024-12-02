package co.second.easyrp.chart.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.chart.map.ChartMapper;
import co.second.easyrp.chart.service.ChartService;
import co.second.easyrp.chart.service.ChartVO;

@Service
@Primary
public class ChartServiceImpl implements ChartService {
	@Autowired
	private ChartMapper chartMapper;

	@Override
	public List<ChartVO> ProductSelectList() {
		// TODO Auto-generated method stub
		return chartMapper.ProductSelectList();
	}

	@Override
	public List<ChartVO> getOrderByProductAndYear(String productCod, int year) {
		// TODO Auto-generated method stub
		return chartMapper.getOrderByProductAndYear(productCod, year);
	}

	@Override
	public List<ChartVO> getSalesPlanByProductAndYear(String productCod, int year) {
		// TODO Auto-generated method stub
		return chartMapper.getSalesPlanByProductAndYear(productCod, year);
	}

	@Override
	public List<ChartVO> getTop3Product(int donut_year, int month) {
		// TODO Auto-generated method stub
		return chartMapper.getTop3Product(donut_year, month);
	}
	
	
}
