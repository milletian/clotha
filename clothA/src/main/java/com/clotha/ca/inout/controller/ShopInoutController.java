package com.clotha.ca.inout.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.inout.model.InoutService;
import com.clotha.ca.inout.model.InoutVO;
import com.clotha.ca.stock.model.StockService;

@Controller
@RequestMapping("/shop/inout")
public class ShopInoutController {
		public static final Logger logger
		= LoggerFactory.getLogger(ShopInoutController.class);
		
		@Autowired
		private InoutService inoutService;
		
		@Autowired
		private StockService stockService;
		
		
		@RequestMapping(value="/inout_outList.do")
		public void inout_outList() {
			
		}
		@RequestMapping(value="/inout_standby.do")
		public void inout_standby() {
			
		}
		
		@RequestMapping(value="/ajaxOutWrite.do",produces = "application/text; charset=utf8")
		public @ResponseBody String ajaxOutWrite(@ModelAttribute InoutVO inoutVO) {
			logger.info("ajaxInoutWrite= vo={}",inoutVO);
			String msg = "등록실패";
			int result = inoutService.insertInout(inoutVO);
			result = inoutService.insertInoutDetail(inoutVO);
			if(result>0) {
				msg="등록성공";
			}
			
			return msg;
			
		}
		
}
