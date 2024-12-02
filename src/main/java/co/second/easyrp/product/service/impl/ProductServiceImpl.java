package co.second.easyrp.product.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.product.map.ProductMapper;
import co.second.easyrp.product.service.ProductService;
import co.second.easyrp.product.service.ProductVO;

@Service
@Primary
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productmapper;
	
	@Override
	public List<ProductVO> productList(int page, int size, String cod, String warehouse, String employee,String account, Date preSearchDate, Date postSearchDate) {
		int offset = (page-1)*size;
		return productmapper.productList(size, offset, cod, warehouse, employee, account, preSearchDate, postSearchDate);
	}

	@Override
	public int countProductLists(String cod, String warehouse, String employee, String account, Date preSearchDate, Date postSearchDate) {
		// TODO Auto-generated method stub
		return productmapper.countProductLists(cod, warehouse, employee, account, preSearchDate, postSearchDate);
	}

	//제품찾기 modal에 뿌려줄 리스트를 가져오기위한 메소드
	//2024년 5월 14일 하서현
	@Override
	public List<Map<String, Object>> prodSearch() {
		// TODO Auto-generated method stub
		return productmapper.prodSearch();
	}

	@Override
	public int updateCurInvQtyFromPrd(int amount, String cod) {
		// TODO Auto-generated method stub
		return productmapper.updateCurInvQtyFromPrd(amount, cod);
	}

}
