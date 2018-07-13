package com.clotha.ca.account.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clotha.ca.common.SearchVO;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountDAO accountDao;
	public List<AccountVO> accountList(AccountVO vo){
		return accountDao.accountList(vo);
	}
}
