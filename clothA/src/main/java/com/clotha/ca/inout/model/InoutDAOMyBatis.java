package com.clotha.ca.inout.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InoutDAOMyBatis implements InoutDAO{
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private String namespace="config.mybatis.mapper.oracle.inout.";
	
	@Override
	public List<Map<String, Object>> inoutSelectAll(InoutVO inoutVo) {
		return sqlsession.selectList(namespace+"inoutSelectAll", inoutVo);
	}

}
