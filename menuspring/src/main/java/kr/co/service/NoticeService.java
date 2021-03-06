package kr.co.service;

import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> list(Criteria cri) throws Exception;

	public int getTotalCount(Criteria cri) throws Exception;

	public void write(NoticeVO noticeVO) throws Exception;

	public NoticeVO read(int noticeNumber) throws Exception;

	// 메뉴 수정
	public void update(NoticeVO noticeVO) throws Exception;

	// 메뉴 삭제
	public void delete(int noticeNumber) throws Exception;
}
