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
	@Override
	public int insertAccount(AccountVO vo) {
		if(vo.getAccCode()==null||vo.getAccCode().isEmpty()) {
			return accountDao.insertAccount(vo);
		}else {
			return accountDao.updateAccount(vo);
		}
	}
	@Override
	public AccountVO SearchAccountByCode(String accCode) {
		return accountDao.SearchAccountByCode(accCode);
	}
	@Override
	public int deleteAccount(String accCode) {
		return accountDao.deleteAccount(accCode);
	}
}
