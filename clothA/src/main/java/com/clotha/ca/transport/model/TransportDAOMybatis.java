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

	@Override
	public int insertTP(TransportVO transportVO) {
		return sqlsession.insert(namespace+"insertTP", transportVO);
	}

	@Override
	public int insertTPDetail(TransportDetailVO transportDetailVO) {
		return sqlsession.insert(namespace+"insertTPDetail", transportDetailVO);
	}

	@Override
	public int deleteTP(String tpCode) {
		return sqlsession.delete(namespace+"deleteTP", tpCode);
	}

	@Override
	public int deleteTPDetail(String tpCode) {
		return sqlsession.delete(namespace+"deleteTPDetail", tpCode);
	}

	@Override
	public Map<String, Object> transportSearchOne(String tpCode) {
		return sqlsession.selectOne(namespace+"transportSearchOne", tpCode);
	}

	@Override
	public int agreeTP(String tpCode) {
		return sqlsession.update(namespace+"agreeTP", tpCode);
	}
}
