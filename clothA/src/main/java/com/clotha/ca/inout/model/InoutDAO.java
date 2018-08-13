package com.clotha.ca.inout.model;

import java.util.List;
import java.util.Map;

public interface InoutDAO {
	
	public List<Map<String, Object>> inoutSelectAll(InoutVO inoutVo);
	
	public int insertInout(InoutVO inoutVO);
	public int insertInoutDetail(InoutVO inoutVO);
	public int agreeInOut(String inoutCode);
	public int InOutDel(String inoutCode);
	public int InOutDelDetail(String inoutCode);

}
