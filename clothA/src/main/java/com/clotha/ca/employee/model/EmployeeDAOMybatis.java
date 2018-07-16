package com.clotha.ca.employee.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDAOMybatis implements EmployeeDAO {
	private String namespace="config.mybatis.mapper.oracle.employee.";
	
	@Autowired private SqlSessionTemplate sqlSession;

	@Override
	public EmployeeVO selectEmployee(String empNo) {
		return sqlSession.selectOne(namespace+"selectEmployee",empNo);
	}

	@Override
	public String selectPwd(String empNo) {
		return sqlSession.selectOne(namespace+"selectPwd",empNo);
	}

}
