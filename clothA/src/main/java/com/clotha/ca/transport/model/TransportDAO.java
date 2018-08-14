package com.clotha.ca.transport.model;

import java.util.List;
import java.util.Map;

public interface TransportDAO {

	public List<Map<String,Object>> transportSearchtList(TransportVO transportVO);
	public Map<String,Object> transportSearchOne(String tpCode);
	
	public int insertTP(TransportVO transportVO);
	public int insertTPDetail(TransportDetailVO transportDetailVO);
	
	public int deleteTP(String tpCode);
	public int deleteTPDetail(String tpCode);
	public int agreeTP(String tpCode);
}
