package co.second.easyrp.salesplan.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.salesplan.map.SalesplanMapper;
import co.second.easyrp.salesplan.service.SalesplanService;
import co.second.easyrp.salesplan.service.SalesplanVO;


@Service
@Primary
public class SalesplanServiceImpl implements SalesplanService {
	@Autowired
	private SalesplanMapper salesplanMapper;
	


	@Override
	public SalesplanVO SalesplanSelect(SalesplanVO vo) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanSelect(vo);
	}

	@Override
	public int SalesplanInsert(SalesplanVO vo) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanInsert(vo);
	}

	@Override
	public int SalesplanUpdate(SalesplanVO vo) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanUpdate(vo);
	}

	@Override
	public int SalesplanDelete(SalesplanVO vo) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanDelete(vo);
	}

	@Override
	public List<SalesplanVO> SalesplanSelectList(int page, int size, String cod, String clientCod,
			String productCod, Date preSearchDate, Date postSearchDate) {
		int offset = (page - 1) * size;
		return salesplanMapper.SalesplanSelectList(size, offset, cod, clientCod, productCod, preSearchDate, postSearchDate);
	}

	@Override
	public int countSalesTables(int pageSize, int offset, String cod, String clientCod, String productCod,
			Date preSearchDate, Date postSearchDate) {
		return salesplanMapper.countSalesTables(pageSize, offset, cod, clientCod, productCod, preSearchDate, postSearchDate);
	}

	@Override
	public List<SalesplanVO> ClientNameSelectList() {
		// TODO Auto-generated method stub
		return salesplanMapper.ClientNameSelectList();
	}

	@Override
	public List<SalesplanVO> ProductNameSelectList() {
		// TODO Auto-generated method stub
		return salesplanMapper.ProductNameSelectList();
	}

	@Override
	public String ClientCodSelect(String ClientName) {
		// TODO Auto-generated method stub
		return salesplanMapper.ClientCodSelect(ClientName);
	}

	@Override
	public String ProductCodSelect(String ProductName) {
		// TODO Auto-generated method stub
		return salesplanMapper.ProductCodSelect(ProductName);
	}

	@Override	
	public SalesplanVO SalesplanNameSelect(String cod) {
		// TODO Auto-generated method stub
		return salesplanMapper.SalesplanNameSelect(cod);
	}


	

}
