package kr.co.service;

import java.util.List;
import java.util.Map;

public interface CustomService {

	// left search
	public List<Map<String, Object>> leftSearch(Map<String, Object> map) throws Exception;

	// right search
	public Map<String, Object> getCustom(Map<String, Object> map) throws Exception;

	// right search getAccount
	public Map<String, Object> getAccount(Map<String,Object> map) throws Exception;
}
