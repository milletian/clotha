package com.clotha.ca.account.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAOMybatis implements AccountDAO{
	private String namespace="config.mybatis.mapper.oracle.account.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public List<AccountVO> accountList(AccountVO vo) {
		List<AccountVO> list = sqlSession.selectList(namespace+"SearchAccount", vo);
		
		return list;
	}
	@Override
	public int insertAccount(AccountVO vo) {
		return sqlSession.insert(namespace+"insertAccount", vo);
	}
	@Override
	public int updateAccount(AccountVO vo) {
		return sqlSession.update(namespace+"updateAccount", vo);
	}
	@Override
	public AccountVO SearchAccountByCode(String accCode) {
		return sqlSession.selectOne(namespace+"SearchAccountByCode", accCode);
	}
	@Override
	public int deleteAccount(String accCode) {
		return sqlSession.delete(namespace+"deleteAccount", accCode);
	}

}
