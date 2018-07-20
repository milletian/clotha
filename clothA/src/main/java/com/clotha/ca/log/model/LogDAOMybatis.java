package com.clotha.ca.log.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LogDAOMybatis implements LogDAO {
	private String namespace="config.mybatis.mapper.oracle.log.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int loginInsert(LogVO logVo) {	//StoreLoginController
		return sqlSession.insert(namespace+"loginInsert",logVo);	
	}

	@Override
	public int logoutUpdate(int logPk) {	//LogoutController
		return sqlSession.update(namespace+"logoutUpdate",logPk);
	}
	
	
}
