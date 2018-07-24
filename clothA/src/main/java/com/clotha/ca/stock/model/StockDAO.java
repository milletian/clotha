package com.clotha.ca.stock.model;

import java.util.List;
import java.util.Map;

public interface StockDAO {

	public List<Map<String,Object>> stockList(StockVO stockVO);
	
	public int insertStock(StockVO stockVO);
	public int updateStock(StockVO stockVO);
}
