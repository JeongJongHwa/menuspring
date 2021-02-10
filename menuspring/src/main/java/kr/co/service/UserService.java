package kr.co.service;

import kr.co.vo.UserVO;

public interface UserService {

	// 회원가입
	public void insert(UserVO userVO) throws Exception;

	// 로그인
	public UserVO login(UserVO userVO) throws Exception;
}
