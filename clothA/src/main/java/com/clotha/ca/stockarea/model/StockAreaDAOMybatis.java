package com.clotha.ca.stockarea.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockAreaDAOMybatis implements StockAreaDAO{
	private String namesapce="config.mybatis.mapper.oracle.stockarea.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertStockArea(String areaCode) {
		return sqlSession.insert(namesapce+"insertStockArea", areaCode);
	}

}
