package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.CustomDAO;

@Service
public class CustomServiceImpl implements CustomService {

	@Inject
	private CustomDAO dao;

	@Override
	public List<Map<String, Object>> leftSearch(Map<String, Object> map) throws Exception {
		return dao.leftSearch(map);
	}

	@Override
	public Map<String, Object> getCustom(Map<String, Object> map) throws Exception {
		return dao.getCustom(map);
	}

	@Override
	public Map<String, Object> getAccount(Map<String, Object> map) throws Exception {
		return dao.getAccount(map);
	}



	

}
