package com.clotha.ca.stockarea.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockAreaServiceImpl implements StockAreaService{
	@Autowired
	private StockAreaDAO stockAreaDAO;

	@Override
	public int insertStockArea(String areaCode) {
		return stockAreaDAO.insertStockArea(areaCode);
	}

}
