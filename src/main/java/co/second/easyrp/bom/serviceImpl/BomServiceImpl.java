package co.second.easyrp.bom.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.bom.map.BomMapper;
import co.second.easyrp.bom.service.BomService;
import co.second.easyrp.bom.service.BomVO;


@Service
@Primary
public class BomServiceImpl implements BomService {
	
	@Autowired
	BomMapper bomMapper;

	
	@Override
	public int insertBom(BomVO bomVO) {
		return bomMapper.insertBom(bomVO);
	}

	@Override
	public List<BomVO> getHyunwooProductData() {
		return bomMapper.getHyunwooProductData();
	}

	@Override
	public int insertStdprice(BomVO bomVO) {
		return bomMapper.insertStdprice(bomVO);
	}

	@Override
	public List<BomVO> getBomDetailData(String prodCod) {
		return bomMapper.getBomDetailData(prodCod);
	}

	@Override
	public int deleteBom(BomVO bomVO) {
		return bomMapper.deleteBom(bomVO);
	}
}
