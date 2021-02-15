package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.Criteria;
import kr.co.vo.MenuVO;

public interface MenuService {
	// 메뉴 작성
	public void write(MenuVO menuVO, MultipartHttpServletRequest mpRequest) throws Exception;

	public List<MenuVO> list(Criteria cri) throws Exception;

	public int getTotalCount(Criteria cri) throws Exception;

	// 메뉴 조회
	public MenuVO read(int menuNumber) throws Exception;

	// 메뉴 수정
	public void update(MenuVO menuVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception;

	// 메뉴 삭제
	public void delete(int menuNumber) throws Exception;

	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int menuNumber) throws Exception;

	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;


}
