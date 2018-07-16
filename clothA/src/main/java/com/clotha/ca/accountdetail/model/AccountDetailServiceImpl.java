package com.clotha.ca.accountdetail.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountDetailServiceImpl implements AccountDetailService{

	@Autowired
	private AccountDetailDAO accountDetailDAO;
	
}
