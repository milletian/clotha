package com.clotha.ca.accountdetail.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDetailDAOMybatis implements AccountDetailDAO {
	private String namespace="config.mybatis.mapper.oracle.accountdetail.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> selectAccountDetail(AccountDetailVO accdVO) {
		return sqlSession.selectList(namespace+"selectAccountDetail", accdVO);
	}

	@Override
	public int insertAccountDetail(AccountDetailVO accdVO) {
		return sqlSession.insert(namespace+"insertAccountDetail", accdVO);
	}

	@Override
	public int updateAccountDetail(AccountDetailVO accdVO) {
		return sqlSession.update(namespace+"updateAccountDetail", accdVO);
	}
}
