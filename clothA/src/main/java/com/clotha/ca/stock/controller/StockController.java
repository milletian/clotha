package com.clotha.ca.stock.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.stock.model.MultiStock;
import com.clotha.ca.stock.model.StockService;
import com.clotha.ca.stock.model.StockVO;

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
	
	@RequestMapping("/stockList.do")
	public String stockList() {
		return "/admin/stock/stockList";
	}
	
	@RequestMapping("/ajaxStockList.do")
	@ResponseBody
	public List<Map<String,Object>> stockList(@ModelAttribute StockVO stockVO) {
		logger.info("{}",stockVO);
		return stockService.stockList(stockVO);
	}
	
	@RequestMapping("/ajaxStockWrite.do")
	@ResponseBody
	public String stockWrite(@ModelAttribute MultiStock stockList) {
		logger.info("/ajaxStockWrite.do - {}",stockList.getStockList());
		//int result =stockService.addStock(stockList.getStockList());
		//logger.info("{}",result);
		return "test";
	}
	
	
	
}
