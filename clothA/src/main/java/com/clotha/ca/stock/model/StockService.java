package com.clotha.ca.stock.model;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface StockService {
	public List<Map<String, Object>> stockList(StockVO stockVO);
	public List<Map<String, Object>> stockSearchList(Map<String, String> map);
	public int addStock(List<StockVO> list);
	
	public List<StockVO> xlsExcelReader(MultipartHttpServletRequest req);

}
