package com.clotha.ca.stock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clotha.ca.stock.model.StockService;

@Controller
@RequestMapping("/shop/stock")
public class ShopStockController {
	private static final Logger logger = LoggerFactory.getLogger(ShopStockController.class);

	@Autowired
	private StockService stockService;
	
	
	
	@RequestMapping("/stockList.do")
	public void stockList() {
		
	}
	
	@RequestMapping("/stockChart.do")
	public void stockChart() {
	}
	
}
