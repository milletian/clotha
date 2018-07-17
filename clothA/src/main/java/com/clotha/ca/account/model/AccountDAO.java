package com.clotha.ca.account.model;

import java.util.List;

public interface AccountDAO {
	public List<AccountVO> accountList(AccountVO vo);
	public int insertAccount(AccountVO vo);
	public int updateAccount(AccountVO vo);
	public AccountVO SearchAccountByCode(String accCode);
}
