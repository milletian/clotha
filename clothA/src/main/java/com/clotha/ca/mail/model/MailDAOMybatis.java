package com.clotha.ca.mail.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailDAOMybatis implements MailDAO {
	private String namespace="config.mybatis.mapper.oracle.mail.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
