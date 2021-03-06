package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// 공지사항 리스트 조회

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

	// 공지사항 글 작성 화면
	@RequestMapping(value = "/notice/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("writeView");
	}

	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String write(NoticeVO noticeVO) throws Exception {
		logger.info("write");
		service.write(noticeVO);
		return "redirect:/notice/list";
	}
	
	// 공지사항 읽기
	@RequestMapping(value = "/notice/readView", method = RequestMethod.GET)
	public String read(NoticeVO noticeVO, @ModelAttribute("cri") Criteria cri, Model model, HttpServletRequest request)
			throws Exception {
		logger.info("read");
		logger.info(noticeVO.toString());
		model.addAttribute("read", service.read(noticeVO.getNoticeNumber()));

		return "notice/readView";
	}
	
	// 공지사항 수정 뷰
	@RequestMapping(value = "/notice/updateView", method = RequestMethod.GET)
	public String updateView(NoticeVO noticeVO, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

		logger.info("updateView");
		model.addAttribute("read", service.read(noticeVO.getNoticeNumber()));

		return "notice/updateView";
	}
	
	// 공지사항 수정
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String update(NoticeVO noticeVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("update");
		service.update(noticeVO);
		
		return "redirect:/notice/list";
	}
	
	// 공지사항 삭제
	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	public String delete(NoticeVO noticeVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("delete");
		service.delete(noticeVO.getNoticeNumber());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		return "redirect:/notice/list";
	}

}
