package com.clotha.ca.transport.model;

import java.util.List;
import java.util.Map;

public interface TransportService {
	public List<Map<String, Object>> transportSearchtList(TransportVO transportVO);
	
	public int insertTP(TransportVO transportVO,TransportDetailVO transportDetailVO);
	public int deleteTP(String tpCode);
	public int agreeTP(Map<String,Object> map);
	public Map<String, Object> transportSearchOne(String tpCode);
}
