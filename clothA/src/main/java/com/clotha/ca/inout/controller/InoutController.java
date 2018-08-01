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
import com.clotha.ca.stock.model.StockService;
import com.clotha.ca.stock.model.StockVO;

@Controller
@RequestMapping("/admin/inout")
public class InoutController {
		public static final Logger logger
		= LoggerFactory.getLogger(InoutController.class);
		
		@Autowired
		private InoutService inoutService;
		
		@Autowired
		private StockService stockService;
		
		@RequestMapping(value="/inout_standby.do", method=RequestMethod.GET)
		public void inoutList_get() {
			logger.info("입고 승인대기 페이지 보여주기");
		}
		
		@RequestMapping(value="/ajaxInOutWrite.do",produces = "application/text; charset=utf8")
		public @ResponseBody String ajaxInOutWrite(@ModelAttribute InoutVO inoutVO) {
			logger.info("ajaxInoutWrite= vo={}",inoutVO);
			String msg = "등록실패";
			int result = inoutService.insertInout(inoutVO);
			result = inoutService.insertInoutDetail(inoutVO);
			StockVO start = new StockVO(); // 출발지
			StockVO end = new StockVO(); // 도착지
			start.setStaCode(inoutVO.getAreaStart());
			start.setPdCode(inoutVO.getPdCode());
			start.setStockQty(-inoutVO.getInoutDetailQTY());
			end.setStaCode(inoutVO.getAreaEnd());
			end.setPdCode(inoutVO.getPdCode());
			end.setStockQty(inoutVO.getInoutDetailQTY());
			int endStock = stockService.selectBystaCodeandpdCode(end);
			logger.info("result = {}",result);
			if(endStock==0) {
				//인서트
				stockService.insertStock(end);
			}else {
				//업데이트
				stockService.updateStockQty(end);
				stockService.updateStockQty(start);
			}
			
			if(result>0) {
				msg="등록성공";
			}
			
			return msg;
		}
		
		@RequestMapping("/ajaxinout_standby.do")
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
				Date date2 = (Date) map.get("INOUT_ENDDATE");
				String str=smf.format(date);
				String str2=smf.format(date2);

				map.put("INOUT_STARTDATE",str);
				map.put("INOUT_ENDDATE", str2);
				logger.info("INOUT_STARTDATE={},INOUT_ENDDATE={}",str,str2);
			}
			return list;
			
		}
		
}
