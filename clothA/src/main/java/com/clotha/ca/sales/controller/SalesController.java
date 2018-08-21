package com.clotha.ca.sales.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.sales.model.SalesService;
import com.clotha.ca.sales.model.SalesVO;

@Controller
@RequestMapping("/sales")
public class SalesController {
	private static Logger logger = LoggerFactory.getLogger(SalesController.class);
	
	@Autowired
	private SalesService salesService;
	
	@RequestMapping("/salesList.do")
	public void sales() {
		logger.info("판매현황 페이지");
		
		return;
	}
	
	@RequestMapping(value="/ajaxSalesList.do")
	@ResponseBody
	public List<SalesVO> ajaxSalesList(@ModelAttribute SalesVO salesVo, HttpServletRequest request,@RequestParam(required=false) String searchDateRange){
		logger.info("판매현황 ajax 리스트조회, 파라미터 salesVo = {}, searchDateRange = {} ", salesVo,searchDateRange);
		List<SalesVO> list = salesService.selectAll(salesVo);
		logger.info("판매현황 list.size = {} ",list.size());
		return list;
	}
	
	
	
	
}























