package com.clotha.ca.employee.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAOMybatis {
	private String namespace="config.mybatis.mapper.oracle.employee.";
	
	@Autowired private SqlSessionTemplate sqlSession;

}
