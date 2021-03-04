package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.NoticeService;
import kr.co.vo.Criteria;
import kr.co.vo.NoticeVO;
import kr.co.vo.PageMaker;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	NoticeService service;

	// 메뉴 리스트 조회

	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("cri") Criteria cri) throws Exception {
		logger.info("notice");

		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<NoticeVO> notices = service.list(cri);
		// 모델에 추가
		model.addAttribute("list", notices);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = service.getTotalCount(cri);
		// pageMaker로 전달 -> pageMaker은 startPage, endPagwe, prev, next 를계산함
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);

		// PageMaker pageMaker = new PageMaker();
		// pageMaker.setCri(cri);
		// pageMaker.setTotalCount(service.listCount());

		return "notice/list";
	}

	

}
