package co.second.easyrp.productmgmt.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.productmgmt.map.UnitMapper;
import co.second.easyrp.productmgmt.service.UnitService;
import co.second.easyrp.productmgmt.service.UnitVO;

@Service
@Primary
public class UnitServiceImpl implements UnitService {

	@Autowired
	UnitMapper unitMapper;

	@Override
	public List<UnitVO> unitTableAllList() {
		return unitMapper.unitTableAllList();
	}

	@Override
	public int unitInsertFn(UnitVO unitVO) {
		return unitMapper.unitInsertFn(unitVO);
	}

	@Override
	public int getMaxCode() {
			int maxCod = unitMapper.getMaxCode();
			int number = maxCod + 1; // 가져온 int 부분에 1을 더함
			return number;
	}

	@Override
	public int unitUpdateFn(UnitVO unitVO) {
		return unitMapper.unitUpdateFn(unitVO);
	}

	@Override
	public int unitDeleteFn(UnitVO unitVO) {
		return unitMapper.unitDeleteFn(unitVO);
	}

}
