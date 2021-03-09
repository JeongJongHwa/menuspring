package kr.co.dao;

import java.util.List;
import java.util.Map;

public interface CustomDAO {

	// left search
	public List<Map<String, Object>> leftSearch(Map<String,Object> map) throws Exception;
	
	// right search getCustom
	public Map<String, Object> getCustom(Map<String,Object> map) throws Exception;

	// right search getAccount
	public Map<String, Object> getAccount(Map<String,Object> map) throws Exception;
}
