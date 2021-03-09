package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.CustomService;

@Controller
@RequestMapping("/custom/*")
public class CustomController {

	private static final Logger logger = LoggerFactory.getLogger(CustomController.class);

	@Inject
	CustomService service;
	

	// 공지사항 글 작성 화면
	@RequestMapping(value = "/custom/list", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("list");
	}
	
	@RequestMapping( value = "/custom/leftSearch" , method = RequestMethod.POST )
	public @ResponseBody List<Map<String, Object>> leftSearch(@RequestBody Map<String, Object> map) throws Exception{
		
		logger.info( (String) map.get("BUSI_NUM") );
		logger.info( (String) map.get("CUSTOM") );
		
		logger.info(service.leftSearch(map).toString());
		
		return service.leftSearch(map);
		
	}
	
	@RequestMapping( value = "/custom/rightSearch" , method = RequestMethod.POST )
	public @ResponseBody Map<String, Object> rightSearch(@RequestBody Map<String, Object> map) throws Exception{
		
		logger.info( (String) map.get("BUSI_NUM") );
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put( "CUSTOM" , service.getCustom(map));
		returnMap.put("ACCOUNT", service.getAccount(map));
		
		return returnMap;
		
	}
	
	

}
