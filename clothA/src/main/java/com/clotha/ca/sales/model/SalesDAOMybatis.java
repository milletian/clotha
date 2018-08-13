package com.clotha.ca.sales.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDAOMybatis implements SalesDAO {
	private String namespace="config.mybatis.mapper.oracle.sales.";
	
	@Autowired private SqlSessionTemplate sqlSession;

	@Override
	public List<SalesVO> selectAll(SalesVO salesVo) {
		return sqlSession.selectList(namespace+"selectAll",salesVo);
	}
	
}
