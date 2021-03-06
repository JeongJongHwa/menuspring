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

	@Override
	public void write(NoticeVO noticeVO) throws Exception {

		dao.write(noticeVO);
		
	}

	@Override
	public NoticeVO read(int noticeNumber) throws Exception {
		
		return dao.read(noticeNumber);
		
	}

	@Override
	public void update(NoticeVO noticeVO) throws Exception {

		dao.update(noticeVO);
	}

	@Override
	public void delete(int noticeNumber) throws Exception {

		dao.delete(noticeNumber);
	}

	

}
