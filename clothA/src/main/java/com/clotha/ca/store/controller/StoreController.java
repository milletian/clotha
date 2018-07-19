package com.clotha.ca.store.controller;

import java.util.List;

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

import com.clotha.ca.account.model.AccountVO;
import com.clotha.ca.store.model.StoreService;
import com.clotha.ca.store.model.StoreVO;

@Controller
@RequestMapping("/admin/store")
public class StoreController {
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	@Autowired
	private StoreService storeService;
	
	@RequestMapping(value="/storeWrite.do", method=RequestMethod.GET)
	public String storeWrite_get(@RequestParam(required=false) String storeCode,Model model) {
		if(storeCode!=null&&!storeCode.isEmpty()) {
			StoreVO storeVo = storeService.SearchStoreByCode(storeCode);
			model.addAttribute("accVo", storeVo);
		}
		return "admin/store/storeWrite";
	}
	
	@RequestMapping(value="/accountWrite.do", method=RequestMethod.POST)
	public String accountWrite_post() {
		
		return "수정완료!";
	}
	
	@RequestMapping(value="/storeList.do", method=RequestMethod.GET)
	public void storeList() {
		
	}
	
	@RequestMapping(value="/ajaxStoreList.do")
	@ResponseBody
	public List<StoreVO> ajaxStoreList(@ModelAttribute StoreVO storeVO) {
		logger.info("{}",storeVO);
		List<StoreVO> list = storeService.SearchStore(storeVO);
		logger.info("{}",list.size());
		return list;
	}
}
