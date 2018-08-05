package com.clotha.ca.stock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	@RequestMapping("/stockChart.do")
	public void stockChart() {
	}
	
	@RequestMapping("/ajaxStockList.do")
	@ResponseBody
	public List<Map<String,Object>> stockList(@ModelAttribute StockVO stockVO) {
		logger.info("{}",stockVO);
		return stockService.stockList(stockVO);
	}
	
	@RequestMapping("/ajaxSearchStockList.do")
	@ResponseBody
	public List<Map<String,Object>> ajaxStockSearchList(@ModelAttribute StockVO stockVO,@RequestParam(required=false) String accCode,@RequestParam(required=false) String pdDel) {
		logger.info("search!!!!stock = {}, accCode= {}",stockVO,accCode);
		logger.info("search2!!!!,pdDel={}",pdDel);
		Map<String,String> map = new HashMap<>();
		map.put("pdCode",stockVO.getPdCode());
		map.put("staCode",stockVO.getStaCode());
		map.put("accCode",accCode);
		map.put("pdDel",pdDel);
		
		return stockService.stockSearchList(map);
	}
	
	@RequestMapping("/ajaxStockWrite.do")
	@ResponseBody
	public String stockWrite(@ModelAttribute MultiStock stockList) {
		logger.info("/ajaxStockWrite.do - {}",stockList.getStockList());
		int result =stockService.addStock(stockList.getStockList());
		logger.info("{}",result);
		return "test";
	}
	
	@RequestMapping("/ajaxStockExcelUpload.do")
	@ResponseBody
	public List<StockVO> ajaxStockExcelUpload(MultipartHttpServletRequest req) {
		String excelType = req.getParameter("excelType");
		List<StockVO> list = new ArrayList<>();
		logger.info("ajaxStockExcelUpload : excelType={}",excelType);
		if(excelType.equals("xlsx")) {
			return stockService.xlsxExcelReader(req);
		}else if(excelType.equals("xls")) {
			return stockService.xlsExcelReader(req);
		}
		return list;
	}
	
	
	
	
}
