package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.MenuDAO;
import kr.co.util.FileUtils;
import kr.co.vo.Criteria;
import kr.co.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService {

	@Inject
	private MenuDAO dao;
	
	@Autowired
	private FileUtils fileUtils;
	
	// 메뉴 작성
	@Override
	public void write(MenuVO menuVO,MultipartHttpServletRequest mpRequest) throws Exception {
		
		dao.write(menuVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(menuVO, mpRequest);
		int size = list.size();
		for( int i=0; i<size; i++ ) {
			dao.insertFile(list.get(i));
		}
		
		
		
	}

	@Override
	public List<MenuVO> list(Criteria cri) throws Exception {

		return dao.list(cri);
	}

	@Override
	public MenuVO read(int menuNumber) throws Exception {
		
		dao.menuReadCnt(menuNumber);
		return dao.read(menuNumber);
	}

	@Override
	public void update(MenuVO menuVO,String[] files, String[] fileNames,MultipartHttpServletRequest mpRequest) throws Exception {

		dao.update(menuVO);
		
		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(menuVO, files, fileNames, mpRequest);
		Map<String, Object> tempMap = null;
		int size = list.size();
		for( int i=0;i<size;i++ ) {
			tempMap = list.get(i);
			if( tempMap.get("isNew").equals("Y") ) {
				dao.insertFile(tempMap);
			} else {
				dao.updateFile(tempMap);
			}
		}
		
		
	}

	@Override
	public void delete(int menuNumber) throws Exception {

		dao.delete(menuNumber);
		
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {

		return dao.getTotalCount(cri);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int menuNumber) throws Exception {

		return dao.selectFileList(menuNumber);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {

		return dao.selectFileInfo(map);
	}

	

}
