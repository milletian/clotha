package com.clotha.ca.account.controller;

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

import com.clotha.ca.account.model.AccountService;
import com.clotha.ca.account.model.AccountVO;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/accountWrite.do", method=RequestMethod.GET)
	public String accountWrite_get(@RequestParam(required=false) String accCode,Model model) {
		if(accCode!=null&&!accCode.isEmpty()) {
			AccountVO accVo = accountService.SearchAccountByCode(accCode);
			model.addAttribute("accVo", accVo);
		}
		return "admin/account/accountWrite";
	}
	
	@RequestMapping(value="/accountWrite.do", method=RequestMethod.POST)
	public String accountWrite_post(@RequestParam String address,@RequestParam String addressDetail,@ModelAttribute AccountVO accVo) {
		logger.info("vo={},address={}",accVo,address);
		logger.info("detail={}",addressDetail);
		accVo.setAccAddress(address+addressDetail);
		accountService.insertAccount(accVo);
		
		return "수정성공!";
	}
	
	@RequestMapping(value="/accountList.do", method=RequestMethod.GET)
	public String accountList_get() {
		return "admin/account/accountList";
	}
	
	@RequestMapping(value="/accountList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<AccountVO> accountList_post(@ModelAttribute AccountVO vo) {
		logger.info("{}",vo);
		List<AccountVO> list = accountService.accountList(vo);
		logger.info("{}",list.size());
		return list;
	}
}
