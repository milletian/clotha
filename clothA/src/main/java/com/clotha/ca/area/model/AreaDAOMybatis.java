package com.clotha.ca.area.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AreaDAOMybatis implements AreaDAO{
private String namesapce="config.mybatis.mapper.oracle.area.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AreaVO> selectArea() {
		return sqlSession.selectList(namesapce+"selectArea");
	}
}
