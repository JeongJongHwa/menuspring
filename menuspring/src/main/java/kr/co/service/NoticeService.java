package kr.co.service;

import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> list(Criteria cri) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;

}
