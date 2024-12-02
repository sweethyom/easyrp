package co.second.easyrp.mps.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.mps.map.MpsMapper;
import co.second.easyrp.mps.service.MpsService;
import co.second.easyrp.mps.service.MpsVO;

@Service
@Primary
public class MpsServiceImpl implements MpsService {
	@Autowired
	private MpsMapper mpsMapper;

	@Override
	public int mpsInsert(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsInsert(mpsVo);
	}

	@Override
	public int mpsUpdate(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsUpdate(mpsVo);
	}

	@Override
	public int mpsDelete(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsDelete(mpsVo);
	}

	@Override
	public int orderdetailMpsStateToY(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.orderdetailMpsStateToY(mpsVo);
	}

	@Override
	public int selectMaxCod() {
		// TODO Auto-generated method stub
		return mpsMapper.selectMaxCod();
	}

	@Override
	public int countMpsTables(String searchPlan, String searchProdCod, String searchProdName, String searchClient,
			Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		
		return mpsMapper.countMpsTables(searchPlan, searchProdCod, searchProdName, searchClient, preSearchDate, postSearchDate);
	}
	
	@Override
	public List<MpsVO> mpsSelectListAll(int page, int size, String searchPlan, String searchProdCod, String searchProdName,
			String searchClient, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		int offset = (page-1)*size; 
		return mpsMapper.mpsSelectListAll(size, offset, searchPlan, searchProdCod, searchProdName, searchClient, preSearchDate, postSearchDate);
	}

	@Override
	public MpsVO mpsSelect(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.mpsSelect(mpsVo);
	}

	@Override
	public int orderdetailMpsStateToN(MpsVO mpsVo) {
		// TODO Auto-generated method stub
		return mpsMapper.orderdetailMpsStateToN(mpsVo);
	}

	@Override
	public List<MpsVO> mpsSelectListAllModal() {
		// TODO Auto-generated method stub
		return mpsMapper.mpsSelectListAllModal();
	}
}
