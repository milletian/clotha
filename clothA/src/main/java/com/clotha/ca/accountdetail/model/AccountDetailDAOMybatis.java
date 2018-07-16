package com.clotha.ca.accountdetail.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDetailDAOMybatis implements AccountDetailDAO {
	private String namespace="config.mybatis.mapper.oracle.accountdetail.";

	@Autowired
	private SqlSessionTemplate sqlSession;
}
