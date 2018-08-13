package com.clotha.ca.sales.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.sales.model.SalesVO;

@Controller
@RequestMapping("/sales")
public class SalesController {
	private static Logger logger = LoggerFactory.getLogger(SalesController.class);
	
	@RequestMapping("/salesList.do")
	public void sales() {
		logger.info("판매현황 페이지");
		
		return;
	}
	
	@RequestMapping(value="/ajaxSalesList.do")
	@ResponseBody
	public List<SalesVO> ajaxSalesList(){
		logger.info("판매현황 ajax 리스트조회");
		List<SalesVO> list = new ArrayList<>();
		
		return list;
	}
	
	
	
	
}























