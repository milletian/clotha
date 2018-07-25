package com.clotha.ca.stock.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockDAOMybatis implements StockDAO{
	private String namesapce="config.mybatis.mapper.oracle.stock.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> stockList(StockVO stockVO) {
		return sqlSession.selectList(namesapce+"selectStock", stockVO);
	}

	@Override
	public int insertStock(StockVO stockVO) {
		return sqlSession.insert(namesapce+"insertStock", stockVO);
	}

	@Override
	public int updateStock(StockVO stockVO) {
		return sqlSession.update(namesapce+"updateStock", stockVO);
	}

	@Override
	public List<Map<String, Object>> stockSearchList(Map<String, String> map) {
		return sqlSession.selectList(namesapce+"selectSerachStock", map);
	}
	
}
