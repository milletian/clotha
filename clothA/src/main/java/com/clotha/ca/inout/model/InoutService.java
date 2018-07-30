package com.clotha.ca.inout.model;

import java.util.List;
import java.util.Map;

public interface InoutService {
	public List<Map<String, Object>> inoutSelectAll(InoutVO inoutVo);
}
