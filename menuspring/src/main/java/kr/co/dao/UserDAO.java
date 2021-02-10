package kr.co.dao;

import kr.co.vo.UserVO;

public interface UserDAO {
	
	//회원가입
	public void insert(UserVO userVO) throws Exception;

	// 로그인
	public UserVO login(UserVO userVO) throws Exception;
}
