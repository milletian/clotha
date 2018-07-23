package com.clotha.ca.stock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clotha.ca.stock.model.StockService;

@Controller
@RequestMapping("/admin/stock")
public class StockController {
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);

	@Autowired
	private StockService stockService;
	@RequestMapping("/stockFirstSet.do")
	public String stockFirstSet() {
		return "/admin/stock/stockFirstSet";
	}
	
}
