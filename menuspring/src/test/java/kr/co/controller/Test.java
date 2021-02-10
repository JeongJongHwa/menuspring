package kr.co.controller;

import static org.junit.Assert.assertEquals;

import java.sql.Connection;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.service.MenuService;
import kr.co.vo.Criteria;
import kr.co.vo.MenuVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})




public class Test {

	@Inject
	private DataSource ds;
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	@Inject
	private MenuService service;
	private static Logger logger = LoggerFactory.getLogger(Test.class);

	@org.junit.Test
	public void uriTest() {
		
		int page = 6;
		int perPageNum = 10;
		
		UriComponents uriComponets = UriComponentsBuilder.newInstance().path("/{1}/{2}/list")
				.queryParam("page", page).queryParam("perPageNum", perPageNum).build().expand("controller","read");
		
		logger.info(uriComponets.toString());
		
		
	}
	
	
	
	
//	@org.junit.Test
	public void getTotalCountTest() throws Exception{
		Criteria cri = new Criteria();
		Integer totalCount = service.getTotalCount(cri);
		logger.info("totalCount: "+totalCount.toString());
	}
	
//	@org.junit.Test
	public void listPageTest() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(20);
		List<MenuVO> menus =service.list(cri);
		for ( MenuVO menu : menus ) {
			logger.info( menu.getMenuNumber() + " : "+menu.getMenuTitle() );
		}
	}
	
	//@org.junit.Test
	public void queryCreateFor() throws Exception{
		
		MenuVO menuVO = new MenuVO();
		for( int i=0; i < 250 ; i++ ) {
			menuVO.setMenuTitle(i+"");
			menuVO.setMenuContent(i+"");
			//service.write(menuVO);
		}
		
		
	}
	
	
	
	
	public void Test() throws Exception{

		try(Connection conn = ds.getConnection()){
			System.out.println(conn);
		} catch( Exception e ) {
			e.printStackTrace();
		}
	}
	
	public void factoryTest() {
		System.out.println(sqlFactory);
	}
	
	@org.junit.Test
	public void sessionTest() throws Exception {
		try(Connection conn = ds.getConnection()){
			System.out.println(conn);
		} catch( Exception e ) {
			e.printStackTrace();
		}
	}
	
		
	
	
	
}
