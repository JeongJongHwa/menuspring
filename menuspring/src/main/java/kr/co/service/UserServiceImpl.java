package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.UserDAO;
import kr.co.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject 
	private UserDAO dao;
	
	@Override
	public void insert(UserVO userVO) throws Exception {

		dao.insert(userVO);
		
	}

	@Override
	public UserVO login(UserVO userVO) throws Exception {

		return dao.login(userVO);
	
	}

}
