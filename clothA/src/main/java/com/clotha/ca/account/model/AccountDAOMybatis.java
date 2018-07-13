package com.clotha.ca.account.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.clotha.ca.common.SearchVO;

@Repository
public class AccountDAOMybatis implements AccountDAO{
	private String namespace="config.mybatis.mapper.oracle.account.";

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public List<AccountVO> accountList(AccountVO vo) {
		System.out.println(vo);
		List<AccountVO> list = sqlSession.selectList(namespace+"SearchAccount", vo);
		System.out.println(list.size());
		
		return list;
	}

}
