package com.clotha.ca.store.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAOMybatis implements StoreDAO {
	
	private String namesapce="config.mybatis.mapper.oracle.store.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<StoreVO> SearchStore(StoreVO storeVO) {
		return sqlSession.selectList(namesapce+"SearchStore", storeVO);
	}

	@Override
	public StoreVO SearchStoreByCode(String storeCode) {
		return sqlSession.selectOne(namesapce+"SearchStoreByCode", storeCode);
	}
}
