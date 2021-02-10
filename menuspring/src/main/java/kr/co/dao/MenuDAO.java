package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.Criteria;
import kr.co.vo.MenuVO;

public interface MenuDAO {

	// 메뉴 작성
	public void write(MenuVO menuVO) throws Exception;
	
	// 메뉴 리스트 조회
	public List<MenuVO> list(Criteria cri) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
	
	// 메뉴 조회
	public MenuVO read(int menuNumber) throws Exception;
	
	// 메뉴 수정
	public void update(MenuVO menuVO) throws Exception;
	
	// 메뉴 삭제
	public void delete(int menuNumber) throws Exception;
	
	// 첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int menuNumber) throws Exception;
	
	// 첨부파일 다운
	public Map<String,Object> selectFileInfo(Map<String,Object> map)throws Exception;
	
	// 첨부파일 수정
	public void updateFile(Map<String, Object> map) throws Exception;
	
}
