package co.second.easyrp.salesclosing.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.salesclosing.map.SalesClosingMapper;
import co.second.easyrp.salesclosing.service.SalesClosingService;
import co.second.easyrp.salesclosing.service.SalesClosingVO;
import co.second.easyrp.salesclosing.service.SearchVO;

@Service
@Primary
public class SalesClosingServiceImpl implements SalesClosingService {
	
	@Autowired
	SalesClosingMapper salesClosingMapper;

	@Override
	public List<SalesClosingVO> tableAllList(SearchVO searchVO) {
		return salesClosingMapper.tableAllList(searchVO);
	}

	@Override
	public int countTable(SearchVO searchVO) {
		return salesClosingMapper.countTable(searchVO);
	}

	@Override
	public int salesClosingUpdate(SalesClosingVO salesClosingVO) {
		return salesClosingMapper.salesClosingUpdate(salesClosingVO);
	}

}
