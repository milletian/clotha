package com.clotha.ca.transport.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.transport.model.TransportService;
import com.clotha.ca.transport.model.TransportVO;

@Controller
@RequestMapping("/shop/transport")
public class TransportController {
	@Autowired
	private TransportService transportService;
	
	@RequestMapping("/transportList.do")
	public void tansportList() {
		
	}
	
	
	@RequestMapping(value="/ajaxTransportSearchList.do")
	@ResponseBody
	public List<Map<String,Object>> ajaxTransportSearchList(@ModelAttribute TransportVO transportVO,@RequestParam(required=false) String searchDateRange) {
		if(searchDateRange!=null&&!searchDateRange.isEmpty()) {
			String[] dateRange =searchDateRange.split("~");
			transportVO.setStartDay(dateRange[0]);
			transportVO.setEndDay(dateRange[1]);
		}
		
		List<Map<String,Object>> list = transportService.transportSearchtList(transportVO);
		
		
		for(Map<String,Object> map : list) {
			SimpleDateFormat smf = new SimpleDateFormat("yyyy/MM/dd");
			Date date=(Date) map.get("TP_REGDATE");
			String str=smf.format(date);
			map.put("TP_REGDATE",str);
		}
		return list;
		
	}
}
