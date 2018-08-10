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

	@Override
	public int insertInout(InoutVO inoutVO) {
		return sqlsession.insert(namespace+"insertInout", inoutVO);
	}

	@Override
	public int insertInoutDetail(InoutVO inoutVO) {
		return sqlsession.insert(namespace+"insertInoutDetail", inoutVO);
	}

	@Override
	public int agreeInOut(String inoutCode) {
		return sqlsession.update(namespace+"agreeInOut", inoutCode);
	}

}
