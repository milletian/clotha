package com.clotha.ca.stock.model;

import java.util.List;
import java.util.Map;

public interface StockService {
	public List<Map<String, Object>> stockList(StockVO stockVO);
	
	public int addStock(List<StockVO> list);
}
