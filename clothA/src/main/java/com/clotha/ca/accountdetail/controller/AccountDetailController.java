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
import com.clotha.ca.stock.model.StockService;
import com.clotha.ca.stock.model.StockVO;

@Controller
@RequestMapping("/admin/account")
public class AccountDetailController {
	private static final Logger logger = LoggerFactory.getLogger(AccountDetailController.class);

	@Autowired
	private AccountDetailService accDtService;
	
	@Autowired
	private StockService stockService;
	
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
	
	@RequestMapping(value="/ajaxAccountDetailWrite.do")
	@ResponseBody
	public String accountDetailWrite_post(@ModelAttribute AccountDetailVO accdVO,@ModelAttribute StockVO stockVO){
		logger.info("accountDetailWrite_post{}",accdVO);
		logger.info("accountDetailWrite_post{}",stockVO);
		stockVO.setStockQty(accdVO.getAccDtQty());
		accDtService.addAccountDetail(accdVO);
		int result = stockService.selectBystaCodeandpdCode(stockVO);
		logger.info("result = {}",result);
		if(result==0) {
			//인서트
			stockService.insertStock(stockVO);
		}else {
			//업데이트
			stockService.updateStockQty(stockVO);
		}
		
		return "성공";
		
	}
	
	@RequestMapping(value="/accountDetailDel.do",produces = "application/text; charset=utf8")
	public @ResponseBody String accountDetailDelete(@RequestParam String accDtCode){
		if(accDtCode!=null&&!accDtCode.isEmpty()) {
			accDtService.deleteAccountDetail(accDtCode);
			return "삭제되었습니다.";
		}else {
			return "선택하셔야합니다.";
		}
	}
}
