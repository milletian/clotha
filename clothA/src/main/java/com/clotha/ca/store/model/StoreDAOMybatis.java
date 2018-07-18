package com.clotha.ca.store.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAOMybatis implements StoreDAO {
	
	private String namesapce="config.mybatis.mapper.oracle.store.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
