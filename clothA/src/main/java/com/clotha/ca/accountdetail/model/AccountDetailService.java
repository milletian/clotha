package com.clotha.ca.accountdetail.model;

import java.util.List;
import java.util.Map;

public interface AccountDetailService {
	public List<Map<String, Object>> selectAccountDetail(AccountDetailVO accdVO);
	
	public int addAccountDetail(AccountDetailVO accdVO);
}
