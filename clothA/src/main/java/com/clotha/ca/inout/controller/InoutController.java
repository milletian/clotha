package com.clotha.ca.inout.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.inout.model.InoutService;
import com.clotha.ca.inout.model.InoutVO;
import com.clotha.ca.product.model.ProductsVO;

@Controller
@RequestMapping("/admin/inout")
public class InoutController {
		public static final Logger logger
		= LoggerFactory.getLogger(InoutController.class);
		
		@Autowired
		private InoutService inoutService;
		
		@RequestMapping(value="/inout_standby.do", method=RequestMethod.GET)
		public void inoutList_get() {
			logger.info("입고 승인대기 페이지 보여주기");
		}
		
		@RequestMapping(value="/ajaxinout_standby.do",  method=RequestMethod.GET)
		@ResponseBody
		public List<Map<String,Object>> productsList_post(@ModelAttribute InoutVO inoutVo,@RequestParam(required=false) String searchDateRange) {
			logger.info("검색 조건 inoutVo={}",inoutVo);
			if(searchDateRange!=null&&!searchDateRange.isEmpty()) {
				String[] dateRange =searchDateRange.split("~");
				inoutVo.setStartDay(dateRange[0]);
				inoutVo.setEndDay(dateRange[1]);
			}
			logger.info("{},{}",inoutVo.getStartDay(),inoutVo.getEndDay());
			List<Map<String,Object>> list = inoutService.inoutSelectAll(inoutVo);
			logger.info("{}",list);
			
			for(Map<String,Object> map : list) {
				SimpleDateFormat smf = new SimpleDateFormat("yyyy/MM/dd");
				Date date=(Date) map.get("INOUT_STARTDATE");
				String str=smf.format(date);

				map.put("INOUT_STARTDATE",str);
				logger.info("INOUT_STARTDATE={}",str);
			}
			return list;
			
		}
		
}
