package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.MenuService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	MenuService service;

	// index 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) throws Exception {
		
				
		logger.info("indexView");
		System.out.println("asdf");
		
		model.addAttribute("list", service.selectIndexList());
		return "index";
	}

	

}
