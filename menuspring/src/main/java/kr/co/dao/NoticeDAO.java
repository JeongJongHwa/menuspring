package kr.co.dao;

import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.NoticeVO;

public interface NoticeDAO {

	public List<NoticeVO> list(Criteria cri) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
	
}
