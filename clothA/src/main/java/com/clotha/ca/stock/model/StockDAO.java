package com.clotha.ca.stock.model;

import java.util.List;
import java.util.Map;

public interface StockDAO {

	public List<Map<String,Object>> stockList(StockVO stockVO);
	public List<Map<String,Object>> stockSearchList(Map<String, String> map);
	
	public int insertStock(StockVO stockVO);
	public int updateStock(StockVO stockVO);
	public int insertExcelStock(StockVO vo);
	public int selectBystaCodeandpdCode(StockVO vo);
}
