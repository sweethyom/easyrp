package co.second.easyrp.collectedmoney.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.collectedmoney.map.CollectedMoneyMapper;
import co.second.easyrp.collectedmoney.service.CollectedMoneyService;
import co.second.easyrp.collectedmoney.service.CollectedMoneyVO;
import co.second.easyrp.collectedmoney.service.SearchVO;

@Service
@Primary
public class CollectedMoneyServiceImpl implements CollectedMoneyService {
	
	@Autowired
	CollectedMoneyMapper collectedMoneyMapper;

	@Override
	public List<CollectedMoneyVO> getHyunwooOrderData() {
		return collectedMoneyMapper.getHyunwooOrderData();
	}

	@Override
	public List<CollectedMoneyVO> tableAllList(SearchVO searchVO) {
		return collectedMoneyMapper.tableAllList(searchVO);
	}

	@Override
	public int insertFn(CollectedMoneyVO collectedMoneyVO) {
		return collectedMoneyMapper.insertFn(collectedMoneyVO);
	}

	@Override
	public int updateFn(CollectedMoneyVO collectedMoneyVO) {
		return collectedMoneyMapper.updateFn(collectedMoneyVO);
	}

	@Override
	public int deleteFn(String orderCod) {
		return collectedMoneyMapper.deleteFn(orderCod);
	}

	@Override
	public int countTable(SearchVO searchVO) {
		return collectedMoneyMapper.countTable(searchVO);
	}

	@Override
	public int collectedMoneyCompleteFn(CollectedMoneyVO collectedMoneyVO) {
		return collectedMoneyMapper.collectedMoneyCompleteFn(collectedMoneyVO);
	}

	@Override
	public CollectedMoneyVO getData(String orderCod) {
		return collectedMoneyMapper.getData(orderCod);
	}

}
