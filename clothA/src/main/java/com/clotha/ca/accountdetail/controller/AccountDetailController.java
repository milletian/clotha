package com.clotha.ca.accountdetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.clotha.ca.accountdetail.model.AccountDetailService;

@Controller
public class AccountDetailController {

	@Autowired
	private AccountDetailService accDtService;
	
	@RequestMapping(value="/accountDetailList.do", method=RequestMethod.GET)
	public String accountDetailList_get() {
		return "admin/account/accountDetailList";
	}
}
