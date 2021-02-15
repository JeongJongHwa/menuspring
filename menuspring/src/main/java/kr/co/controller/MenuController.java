package kr.co.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MenuService;
import kr.co.util.FileUtils;
import kr.co.vo.Criteria;
import kr.co.vo.MenuVO;
import kr.co.vo.PageMaker;


@Controller
@RequestMapping("/menu/*")
public class MenuController {

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	@Inject
	MenuService service;

	// 메뉴 글 작성 화면
	@RequestMapping(value = "/menu/writeView",method = RequestMethod.GET )
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	
	// 메뉴 글 작성
	
	@RequestMapping( value="/menu/write" , method = RequestMethod.POST )
	public String write(MenuVO menuVO,MultipartHttpServletRequest mpRequest) throws Exception {
		logger.info("write");
//		logger.info( menuVO.toString() );
		service.write(menuVO,mpRequest);
		return "redirect:/menu/list";
	}
	
	// 메뉴 리스트 조회
	
	@RequestMapping( value = "/menu/list", method= RequestMethod.GET )
	public String list(Model model,@ModelAttribute("cri") Criteria cri) throws Exception{
		logger.info("list");
		
		//현재 페이지에 해당하는 게시물을 조회해 옴 
		List<MenuVO> menus = service.list(cri);
		// 모델에 추가
		model.addAttribute("list", menus );
		//PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = service.getTotalCount(cri);
		//pageMaker로 전달 -> pageMaker은 startPage, endPagwe, prev, next 를계산함
		pageMaker.setTotalCount(totalCount);
		//모델에 추가
		model.addAttribute("pageMaker",pageMaker);
		
		//PageMaker pageMaker = new PageMaker();
		//pageMaker.setCri(cri);
		//pageMaker.setTotalCount(service.listCount());
		
		return "menu/list";
	}
	
	// 메뉴 읽기
	@RequestMapping( value="/menu/readView", method = RequestMethod.GET )
	public String read(MenuVO menuVO,@ModelAttribute("cri") Criteria cri,Model model) throws Exception{
		logger.info("read");
		model.addAttribute("read",service.read(menuVO.getMenuNumber()));
		
		List<Map<String, Object>> fileList = service.selectFileList(menuVO.getMenuNumber());
		model.addAttribute("file", fileList);
		
		return "menu/readView";
	}
	
	// 메뉴 수정 뷰
	@RequestMapping( value="/menu/updateView", method = RequestMethod.GET )
	public String updateView( MenuVO menuVO,@ModelAttribute("cri") Criteria cri,Model model ) throws Exception{
		
		logger.info("updateView");
		model.addAttribute("read", service.read(menuVO.getMenuNumber()));
		
		List<Map<String, Object>> fileList = service.selectFileList(menuVO.getMenuNumber());
		model.addAttribute("file",fileList);
		
		
		return "menu/updateView";
	}
	
	// 메뉴 수정
	@RequestMapping( value="/menu/update", method = RequestMethod.POST )
	public String update(MenuVO menuVO,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr,
			@RequestParam(value = "fileNoDel[]") String[] files,
			@RequestParam(value="fileNameDel[]")String[] fileNames,
			MultipartHttpServletRequest mpRequest)throws Exception{
		logger.info("update");
		service.update(menuVO,files,fileNames,mpRequest);
		logger.info( cri.toString() );
		return "redirect:/menu/list";
	}
	
	// 메뉴 삭제
	@RequestMapping( value="/menu/delete", method = RequestMethod.POST )
	public String delete(MenuVO menuVO,@ModelAttribute("cri") Criteria cri,RedirectAttributes rttr)throws Exception{
		logger.info("delete");
		service.delete(menuVO.getMenuNumber());
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		
		return "redirect:/menu/list";
	}
	
	@RequestMapping(value="/menu/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map,HttpServletResponse response) throws Exception{
		
		
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName= (String)resultMap.get("storedFileName");
		String originalFileName = (String)resultMap.get("orgFileName");
		
		// 파이릉ㄹ 저장햇던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File(FileUtils.getFilepath()+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		
	}
	
	
}


