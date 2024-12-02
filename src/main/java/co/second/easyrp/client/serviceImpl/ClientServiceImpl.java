package co.second.easyrp.client.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.client.map.ClientMapper;
import co.second.easyrp.client.service.ClientService;
import co.second.easyrp.client.service.ClientVO;
import co.second.easyrp.client.service.SearchVO;
import co.second.easyrp.client.service.discountVO;


@Service
@Primary
public class ClientServiceImpl implements ClientService {
	
	@Autowired
	ClientMapper clientMapper;

	@Override
	public List<ClientVO> clientTableAllList(SearchVO searchVO) {
		return clientMapper.clientTableAllList(searchVO);
	}

	@Override
	public ClientVO getClientData(String cod) {
		return clientMapper.getClientData(cod);
	}

	@Override
	public String getMaxCode() {
		String maxCod = clientMapper.getMaxCode();
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
	public int clientInsertFn(ClientVO clientVO) {
		return clientMapper.clientInsertFn(clientVO);
	}

	@Override
	public int clientUpdateFn(ClientVO clientVO) {
		return clientMapper.clientUpdateFn(clientVO);
	}

	@Override
	public int clientDeleteFn(String cod) {
		return clientMapper.clientDeleteFn(cod);
	}

	@Override
	public int countClientTable(SearchVO searchVO) {
		return clientMapper.countClientTable(searchVO);
	}

	@Override
	public List<discountVO> getDiscountData() {
		return clientMapper.getDiscountData();
	}

	@Override
	public List<ClientVO> clientAllList() {
		// TODO Auto-generated method stub
		return clientMapper.clientAllList();
	}

}
