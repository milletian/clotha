package com.clotha.ca.accountdetail.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountDetailServiceImpl implements AccountDetailService{

	@Autowired
	private AccountDetailDAO accountDetailDAO;

	@Override
	public List<Map<String, Object>> selectAccountDetail(AccountDetailVO accdVO) {
		return accountDetailDAO.selectAccountDetail(accdVO);
	}

	@Override
	public int addAccountDetail(AccountDetailVO accdVO) {
		if(accdVO.getAccDtCode()!=null&&!accdVO.getAccDtCode().isEmpty()) {
			return accountDetailDAO.updateAccountDetail(accdVO);
		}else {
			return accountDetailDAO.insertAccountDetail(accdVO);
		}
	}

	@Override
	public int selectCountByAccCode(String accCode) {
		return accountDetailDAO.selectCountByAccCode(accCode);
	}

	@Override
	public int deleteAccountDetail(String accDtCode) {
		return accountDetailDAO.deleteAccountDetail(accDtCode);
	}
}
