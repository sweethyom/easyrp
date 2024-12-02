package co.second.easyrp.commontable.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import co.second.easyrp.commontable.map.CommonTableMapper;
import co.second.easyrp.commontable.service.CommonTableCopyVO;
import co.second.easyrp.commontable.service.CommonTableService;
import co.second.easyrp.commontable.service.CommonTableVO;
import co.second.easyrp.commontable.service.KeyValueVO;

//(2024년 4월 30일 오후 3시 4분 박현우)
@Service
@Primary
public class CommonTableServiceImpl implements CommonTableService {
	
	@Autowired
	private CommonTableMapper commonTableMapper;


	@Override
	public int commonInsert(CommonTableVO commonTableVO) {
		return commonTableMapper.commonInsert(commonTableVO);
	}

	@Override
	public CommonTableVO getCommonData(int postId) {
		return commonTableMapper.getCommonData(postId);
	}

	@Override
	public int commonUpdate(CommonTableVO commonTableVO) {
		return commonTableMapper.commonUpdate(commonTableVO);
	}

	@Override
	public int commonDelete(CommonTableVO commonTableVO) {
		return commonTableMapper.commonDelete(commonTableVO);
	}
	
	@Override
	public List<CommonTableVO> commonTableAllListPaged(int page, int size, String searchNumber, String searchTitle, String searchContent, String searchAuthor, Date preSearchDate, Date postSearchDate) {
	    int offset = (page - 1) * size;
	    return commonTableMapper.commonTableAllListPaged(size, offset, searchNumber, searchTitle, searchContent, searchAuthor, preSearchDate, postSearchDate);
	}

	@Override
	public int countCommonTables(String searchNumber, String searchTitle, String searchContent, String searchAuthor, Date preSearchDate, Date postSearchDate) {
		return commonTableMapper.countCommonTables(searchNumber, searchTitle, searchContent, searchAuthor, preSearchDate, postSearchDate);
	}

	@Override
	public List<KeyValueVO> getAllKeyValues() {
		return commonTableMapper.getAllKeyValues();
	}

	@Override
	public List<CommonTableCopyVO> getAllCopyDatas() {
		return commonTableMapper.getAllCopyDatas();
	}



}
