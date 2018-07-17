package com.clotha.ca.accountdetail.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.accountdetail.model.AccountDetailService;
import com.clotha.ca.accountdetail.model.AccountDetailVO;

@Controller
@RequestMapping("/admin/account")
public class AccountDetailController {
	private static final Logger logger = LoggerFactory.getLogger(AccountDetailController.class);

	@Autowired
	private AccountDetailService accDtService;
	
	@RequestMapping(value="/accountDetailList.do", method=RequestMethod.GET)
	public String accountDetailList_get() {
		return "admin/account/accountDetailList";
	}
	
	@RequestMapping(value="/ajaxAccountDetailList.do")
	@ResponseBody
	public List<Map<String,Object>> accountDetailList_post(@ModelAttribute AccountDetailVO accdVO,@RequestParam(required=false) String searchDateRange) {
		if(searchDateRange!=null&&!searchDateRange.isEmpty()) {
			String[] dateRange =searchDateRange.split("~");
			accdVO.setStartDay(dateRange[0]);
			accdVO.setEndDay(dateRange[1]);
		}
		logger.info("{},{}",accdVO.getStartDay(),accdVO.getEndDay());
		List<Map<String,Object>> list = accDtService.selectAccountDetail(accdVO);
		logger.info("{}",list);
		
		for(Map<String,Object> map : list) {
			SimpleDateFormat smf = new SimpleDateFormat("yyyy/MM/dd");
			Date date=(Date) map.get("ACC_DT_REGDATE");
			Date date2=(Date) map.get("ACC_DT_INDATE");
			String str=smf.format(date);
			String str2=smf.format(date);
			map.put("ACC_DT_REGDATE",str);
			map.put("ACC_DT_INDATE",str2);
			logger.info("");
		}
		return list;
		
	}
	
	@RequestMapping(value="/accountDetailWrite.do", method=RequestMethod.GET)
	public String accountDetailWrite_get() {
		return "admin/account/accountDetailWrite";
	}
	
	@RequestMapping(value="/accountDetailWrite.do", method=RequestMethod.POST)
	public void accountDetailWrite_post(@ModelAttribute AccountDetailVO accdVO){
		logger.info("{}",accdVO);
		
		accDtService.addAccountDetail(accdVO);
		
	}
}
