package co.second.easyrp.purchaseorder.serviveImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.purchaseorder.map.PurchaseOrderMapper;
import co.second.easyrp.purchaseorder.service.PurchaseOrderService;
import co.second.easyrp.purchaseorder.service.PurchaseOrderVO;

@Service
@Primary
public class PurchaseOrderServiceImpl implements PurchaseOrderService {
	@Autowired
	PurchaseOrderMapper purchaseOrderMapper;

	// 순수 발주리스트를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	@Override
	public List<Map<String, Object>> poMgmtList() {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.poMgmtList();
	}

	// 페이징 및 검색결과가 적용된 발주리스트를 가져오기위한 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	@Override
	public List<Map<String, Object>> poMgmtListPaged(PurchaseOrderVO vo) {
		// TODO Auto-generated method stub
		vo.setOffset((vo.getPage() - 1) * vo.getSize());
		return purchaseOrderMapper.poMgmtListPaged(vo);
	}

	// 검색결과가 적용된 발주리트스의 갯수를 가져오는 메소드(발주관리)
	// 2024년 5월 9일 오전 11시 28분
	@Override
	public int countPoMgmtList(PurchaseOrderVO vo) {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.countPoMgmtList(vo);
	}
	
	//과세구분리스트를 가져오는 메소드
	//하서현
	@Override
	public List<Map<String, Object>> taxDivList() {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.taxDivList();
	}

	//발주테이블에 발주등록을하는 메소드
	//하서현
	@Override
	public int insertPo(PurchaseOrderVO vo) {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.insertPo(vo);
	}

	//고유한 발주번호를 부여해주기위한 메소드
	//하서현
	@Override
	public String newPoCod() {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.newPoCod();
	}

	@Override
	public List<Map<String, Object>> selectPurchaseOrdersClosing(PurchaseOrderVO vo) {
		// TODO Auto-generated method stub
		vo.setOffset((vo.getPage() - 1) * vo.getSize());
		return purchaseOrderMapper.selectPurchaseOrdersClosing(vo);
	}

	//특정 발주데이터를 가져오기위한 메소드
	//하서현
	@Override
	public Map<String, Object> selectPo(String key) {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.selectPo(key);
	}

	@Override
	public int updatePo(PurchaseOrderVO vo) {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.updatePo(vo);
	}

	@Override
	public int updateIboundDateClosingDateDdayNote(PurchaseOrderVO vo) {
		// TODO Auto-generated method stub
		return purchaseOrderMapper.updateIboundDateClosingDateDdayNote(vo);
	}

}
