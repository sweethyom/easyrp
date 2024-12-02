package co.second.easyrp.productmgmt.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.productmgmt.map.ProductMgmtMapper;
import co.second.easyrp.productmgmt.service.ProductMgmtService;
import co.second.easyrp.productmgmt.service.ProductMgmtVO;
import co.second.easyrp.productmgmt.service.SearchVO;

@Service
@Primary
public class ProductMgmtServiceImpl implements ProductMgmtService {
	
	@Autowired
	ProductMgmtMapper productMgmtMapper;
	

	@Override
	public int insertFn(ProductMgmtVO productMgmtVO) {
		return productMgmtMapper.insertFn(productMgmtVO);
	}

	@Override
	public int updateFn(ProductMgmtVO productMgmtVO) {
		return productMgmtMapper.updateFn(productMgmtVO);
	}

	@Override
	public String getMaxCode() {
		String maxCod = productMgmtMapper.getMaxCode();
		if (maxCod != null && !maxCod.isEmpty()) {
			String prefix = maxCod.replaceAll("[0-9]", ""); // 모든 숫자를 제거하여 접두사만 추출
			String numberPart = maxCod.substring(prefix.length()); // 접두사 이후부터 문자열 끝까지 숫자 부분 추출
			int number = Integer.parseInt(numberPart) + 1; // 자른 숫자부분에 +1을 더함
			// C언어 포맷팅 생각하면 편함
			// numberPart.length() 이 부분이 3이라서 자동으로 %03가 완성 (%03d, number)
			// 이렇게되면 number가 21이면 %03d로 인해 021로 바뀜
			String formattedNumber = String.format("%0" + numberPart.length() + "d", number); 

			return prefix + formattedNumber;
		}
		return null;
	}

	@Override
	public List<ProductMgmtVO> tableAllList(SearchVO searchVO) {
		return productMgmtMapper.tableAllList(searchVO);
	}

	@Override
	public ProductMgmtVO getData(String cod) {
		return productMgmtMapper.getData(cod);
	}

	@Override
	public int countTable(SearchVO searchVO) {
		return productMgmtMapper.countTable(searchVO);
	}

	@Override
	public int deleteFn(String cod) {
		return productMgmtMapper.deleteFn(cod);
	}

}
