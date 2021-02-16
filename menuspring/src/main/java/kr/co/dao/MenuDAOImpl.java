package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.AppraisalVO;
import kr.co.vo.Criteria;
import kr.co.vo.MenuVO;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(MenuVO menuVO) throws Exception {
		
		sqlSession.insert("menuMapper.insert",menuVO);
		
	}

	@Override
	public List<MenuVO> list(Criteria cri) throws Exception {

		return sqlSession.selectList("menuMapper.list",cri);
	
	}

	@Override
	public MenuVO read(int menuNumber) throws Exception {

		return sqlSession.selectOne("menuMapper.read",menuNumber);
	
	}

	
	@Override
	public void update(MenuVO menuVO) throws Exception {
		sqlSession.update("menuMapper.update", menuVO);
	}

	@Override
	public void delete(int menuNumber) throws Exception {
		
		sqlSession.delete("menuMapper.delete", menuNumber);
		
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		
		return sqlSession.selectOne("menuMapper.gettotalcount",cri);
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {

		sqlSession.insert("menuMapper.insertFile",map);
		
	}

	@Override
	public List<Map<String, Object>> selectFileList(int menuNumber) throws Exception {

		return sqlSession.selectList("menuMapper.selectFileList",menuNumber);
	
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		
		return sqlSession.selectOne("menuMapper.selectFileInfo", map);
	}

	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method

		sqlSession.update("menuMapper.updateFile", map);
		
	}

	@Override
	public void menuReadCnt(int menuNumber) throws Exception {

		sqlSession.update("menuMapper.menuReadCnt", menuNumber);
	}

	@Override
	public AppraisalVO getAppraisal(Map<String, Object> map) throws Exception {

		return sqlSession.selectOne("menuMapper.selectAppraisal",map);
		
	}

	@Override
	public void deleteAppraisal(Map<String, Object> map) throws Exception {
		 
		sqlSession.delete("menuMapper.deleteAppraisal", map );
		
	}

	@Override
	public void insertAppraisal(Map<String, Object> map) throws Exception {

		sqlSession.insert("menuMapper.insertAppraisal", map);
	}

	@Override
	public List<Map<String, Object>> selectIndexList() throws Exception {
		return sqlSession.selectList("menuMapper.selectIndexList");
	}

	
	
}
