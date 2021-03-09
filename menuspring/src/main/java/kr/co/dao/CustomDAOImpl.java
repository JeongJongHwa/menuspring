package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CustomDAOImpl implements CustomDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> leftSearch(Map<String,Object> map) throws Exception {
		return sqlSession.selectList("customMapper.getLeftList", map);
	}

	@Override
	public Map<String, Object> getCustom(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne("customMapper.getCustom",map);
	}

	@Override
	public Map<String, Object> getAccount(Map<String, Object> map) throws Exception {
		
		return sqlSession.selectOne("customMapper.getAccount",map);
	}



}
