package com.clotha.ca.transport.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TransportDAOMybatis implements TransportDAO{
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	private String namespace="config.mybatis.mapper.oracle.transport.";

	@Override
	public List<Map<String, Object>> transportSearchtList(TransportVO transportVO) {
		return sqlsession.selectList(namespace+"transportSearchtList", transportVO);
	}
}
