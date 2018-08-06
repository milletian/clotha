package com.clotha.ca.transport.model;

import java.util.List;
import java.util.Map;

public interface TransportDAO {

	public List<Map<String,Object>> transportSearchtList(TransportVO transportVO);
}
