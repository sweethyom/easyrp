package co.second.easyrp.invoice.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.invoice.mapper.InvoiceMapper;
import co.second.easyrp.invoice.service.InvoiceService;
import co.second.easyrp.invoice.service.InvoiceVO;
import co.second.easyrp.invoice.service.SearchVO;
import co.second.easyrp.invoicedetail.service.InvoicedetailVO;

@Service
@Primary
public class InvoiceServiceImpl implements InvoiceService {
	@Autowired InvoiceMapper invoiceMapper;

	@Override
	public List<InvoiceVO> selectInvoiceAll(SearchVO searchVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.selectInvoiceAll(searchVo);
	}

	@Override
	public InvoiceVO selectInvoice(InvoiceVO invoiceVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.selectInvoice(invoiceVo);
	}

	@Override
	public int insertInvoice(InvoiceVO invoiceVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.insertInvoice(invoiceVo);
	}

	@Override
	public int updateInvoice(InvoiceVO invoiceVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.updateInvoice(invoiceVo);
	}

	@Override
	public int deleteInvoice(InvoiceVO invoiceVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.deleteInvoice(invoiceVo);
	}

	@Override
	public int mrpClosingUpdateToY(InvoicedetailVO invoicedetailVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.mrpClosingUpdateToY(invoicedetailVo);
	}

	@Override
	public int mrpClosingUpdateToN(InvoicedetailVO invoicedetailVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.mrpClosingUpdateToN(invoicedetailVo);
	}

	@Override
	public int countInvoiceTables(SearchVO searchVo) {
		// TODO Auto-generated method stub
		return invoiceMapper.countInvoiceTables(searchVo);
	}

	@Override
	public int selectMaxCod() {
		// TODO Auto-generated method stub
		return invoiceMapper.selectMaxCod();
	}

	@Override
	public int updateInvoiceClosing(String cod) {
		// TODO Auto-generated method stub
		return invoiceMapper.updateInvoiceClosing(cod);
	}
		
	public int updateIboundynOrProdReady() {
		// TODO Auto-generated method stub
		return invoiceMapper.updateIboundynOrProdReady();
	}

	@Override
	public List<Map<String, Object>> allIboundedInvoiceList() {
		// TODO Auto-generated method stub
		return invoiceMapper.allIboundedInvoiceList();
	}

}
