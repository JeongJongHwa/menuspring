package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sql;
	
	@Override
	public void insert(UserVO userVO) throws Exception {

		sql.insert("userMapper.insert",userVO);
		
	}

	@Override
	public UserVO login(UserVO userVO) throws Exception {

		return sql.selectOne("userMapper.login", userVO);
	
	}

}
