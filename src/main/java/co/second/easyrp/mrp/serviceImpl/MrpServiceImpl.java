package co.second.easyrp.mrp.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.mrp.map.MrpMapper;
import co.second.easyrp.mrp.service.MrpService;
import co.second.easyrp.mrp.service.MrpVO;
import co.second.easyrp.mrp.service.SearchVO;

@Service
@Primary
public class MrpServiceImpl implements MrpService {
	@Autowired MrpMapper mrpMapper;

	@Override
	public List<MrpVO> mrpSelectListAll(SearchVO searchVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpSelectListAll(searchVo);
	}

	@Override
	public int countMrpTables(SearchVO searchVo) {
		// TODO Auto-generated method stub
		return mrpMapper.countMrpTables(searchVo);
	}

	@Override
	public MrpVO mrpSelect(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpSelect(mrpVo);
	}

	@Override
	public int mrpInsert(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpInsert(mrpVo);
	}

	@Override
	public int mrpUpdate(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpUpdate(mrpVo);
	}

	@Override
	public int mrpDelete(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mrpDelete(mrpVo);
	}

	@Override
	public int selectMaxCod() {
		// TODO Auto-generated method stub
		return mrpMapper.selectMaxCod();
	}

	@Override
	public int mpsClosingUpdateToY(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mpsClosingUpdateToY(mrpVo);
	}

	@Override
	public int mpsClosingUpdateToN(MrpVO mrpVo) {
		// TODO Auto-generated method stub
		return mrpMapper.mpsClosingUpdateToN(mrpVo);
	}

	@Override
	public List<MrpVO> selectBom(String productCod) {
		// TODO Auto-generated method stub
		return mrpMapper.selectBom(productCod);
	}

	@Override
	public List<MrpVO> mrpSelectListAllModal() {
		// TODO Auto-generated method stub
		return mrpMapper.mrpSelectListAllModal();
	}

	@Override
	public List<MrpVO> selectByMpsCod(String mpsCod) {
		// TODO Auto-generated method stub
		return mrpMapper.selectByMpsCod(mpsCod);
	}

}
