package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.NoticeDAO;
import kr.co.vo.Criteria;
import kr.co.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;

	@Override
	public List<NoticeVO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {

		return dao.getTotalCount(cri);
	}

	

}
