package co.second.easyrp.purchaseclosing.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.purchaseclosing.map.PurchaseClosingMapper;
import co.second.easyrp.purchaseclosing.service.PurchaseClosingService;
import co.second.easyrp.purchaseclosing.service.PurchaseClosingVO;
import co.second.easyrp.purchaseclosing.service.SearchVO;

@Service
@Primary
public class PurchaseClosingServiceImpl implements PurchaseClosingService {
	@Autowired PurchaseClosingMapper purchaseClosingMapper;
	
	@Override
	public List<PurchaseClosingVO> tableAllList(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return purchaseClosingMapper.tableAllList(searchVO);
	}

	@Override
	public int countTable(SearchVO searchVO) {
		// TODO Auto-generated method stub
		return purchaseClosingMapper.countTable(searchVO);
	}

	@Override
	public int purchaseClosingUpdate(PurchaseClosingVO purchaseClosingVO) {
		// TODO Auto-generated method stub
		return purchaseClosingMapper.purchaseClosingUpdate(purchaseClosingVO);
	}

}
