package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.UserService;
import kr.co.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

	@Inject
	UserService service;

	// 로그인 view page
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public void loginView() throws Exception {
		logger.info("login view page");
	}

	// 로그인
	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(UserVO userVO, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		
		logger.info("login view page");
		
		HttpSession session = request.getSession();
		UserVO login = service.login(userVO);
		
		if( login == null ) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg",false);
			return "redirect:/user/login";
			
		} else {
			session.setAttribute("user", login);
			return "redirect:/";
		}
		
		
		
	}
	
	// 로그아웃
	@RequestMapping(value="/user/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		return "redirect:/";
	}

	// 회원가입 view page
	@RequestMapping(value = "/user/writeView", method = RequestMethod.GET)
	public void WriteView() throws Exception {
		logger.info("user insert view page");
	}

	// 회원가입
	@RequestMapping(value = "/user/write", method = RequestMethod.POST)
	public String Write(UserVO userVO,RedirectAttributes rttr) throws Exception {

		logger.info("user write");
		service.insert(userVO);
	
		return "redirect:/user/login";
	
	}

}
