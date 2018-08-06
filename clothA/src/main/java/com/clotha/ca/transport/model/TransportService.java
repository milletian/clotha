package com.clotha.ca.transport.model;

import java.util.List;
import java.util.Map;

public interface TransportService {
	public List<Map<String, Object>> transportSearchtList(TransportVO transportVO);
}
