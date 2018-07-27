package com.clotha.ca.account.model;

import java.util.List;

public interface AccountService {

	public List<AccountVO> accountList(AccountVO vo);
	public int insertAccount(AccountVO vo);
	public int deleteAccount(String accCode);
	public AccountVO SearchAccountByCode(String accCode);

}
