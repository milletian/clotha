package com.clotha.ca.stock.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockDAOMybatis implements StockDAO{
	private String namesapce="config.mybatis.mapper.oracle.stock.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
