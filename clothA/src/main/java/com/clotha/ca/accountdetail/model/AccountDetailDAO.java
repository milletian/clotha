package com.clotha.ca.accountdetail.model;

import java.util.List;
import java.util.Map;

public interface AccountDetailDAO {

	public List<Map<String,Object>> selectAccountDetail(AccountDetailVO accdVO);
	
	public int insertAccountDetail(AccountDetailVO accdVO);
	public int updateAccountDetail(AccountDetailVO accdVO);
}
