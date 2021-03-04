package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.Criteria;
import kr.co.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<NoticeVO> list(Criteria cri) throws Exception {

		return sqlSession.selectList("noticeMapper.list", cri);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {

		return sqlSession.selectOne("noticeMapper.gettotalcount", cri);
	}
	
	

	
	
}
