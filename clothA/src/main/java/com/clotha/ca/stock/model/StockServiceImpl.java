package com.clotha.ca.stock.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockServiceImpl implements StockService{
	@Autowired
	private StockDAO stockDAO;
}
