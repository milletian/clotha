package com.clotha.ca.account.model;

import java.util.List;

import com.clotha.ca.common.SearchVO;

public interface AccountService {

	public List<AccountVO> accountList(AccountVO vo);
}
