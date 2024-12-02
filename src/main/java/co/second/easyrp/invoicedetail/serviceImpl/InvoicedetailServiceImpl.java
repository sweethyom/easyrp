package co.second.easyrp.invoicedetail.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.invoicedetail.mapper.InvoicedetailMapper;
import co.second.easyrp.invoicedetail.service.InvoicedetailService;
import co.second.easyrp.invoicedetail.service.InvoicedetailVO;
import co.second.easyrp.orderdetail.service.OrderdetailVO;

@Service
@Primary
public class InvoicedetailServiceImpl implements InvoicedetailService {
	@Autowired
	InvoicedetailMapper invoicedetailMapper;
	
	//발주등록페이지에 있는 청구적용 저장값불러오기에서 modal에 뿌려줄 청구리스트를 가져오기위한 메소드(승인된 청구리스트만 가져옵니다)
	@Override
	public List<Map<String, Object>> applyInvoice() {
		// TODO Auto-generated method stub
		return invoicedetailMapper.applyInvoice();
	}

	@Override
	public int insertInvoicedetail(InvoicedetailVO invoicedetailVo) {
		// TODO Auto-generated method stub
		return invoicedetailMapper.insertInvoicedetail(invoicedetailVo);
	}

	@Override
	public List<InvoicedetailVO> selectInvoicedetailByInvoiceCod(InvoicedetailVO invoicedetailVo) {
		// TODO Auto-generated method stub
		return invoicedetailMapper.selectInvoicedetailByInvoiceCod(invoicedetailVo);
	}

	@Override
	public int deleteInvoicedetail(InvoicedetailVO invoicedetailVo) {
		// TODO Auto-generated method stub
		return invoicedetailMapper.deleteInvoicedetail(invoicedetailVo);
	}

	@Override
	public int updateInvoicedetail(InvoicedetailVO invoicedetailVo) {
		// TODO Auto-generated method stub
		return invoicedetailMapper.updateInvoicedetail(invoicedetailVo);
	}

	@Override
	public int updateOrderdetailDeliveryState(String cod, int num, int deliveryState) {
		// TODO Auto-generated method stub
		return invoicedetailMapper.updateOrderdetailDeliveryState(cod, num, deliveryState);
	}

	@Override
	public OrderdetailVO selectOrderdetailByInvoice(String cod, int num) {
		// TODO Auto-generated method stub
		return invoicedetailMapper.selectOrderdetailByInvoice(cod, num);
	}
}
