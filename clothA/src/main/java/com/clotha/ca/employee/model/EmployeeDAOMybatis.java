package com.clotha.ca.employee.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.clotha.ca.log.model.LogVO;

@Repository
public class EmployeeDAOMybatis implements EmployeeDAO {
	private String namespace="config.mybatis.mapper.oracle.employee.";
	
	@Autowired private SqlSessionTemplate sqlSession;

	@Override
	public EmployeeVO selectEmployee(String empNo) {	//StoreLoginController
		return sqlSession.selectOne(namespace+"selectEmployee",empNo);
	}

	@Override
	public String selectPwd(String empNo) {	//StoreLoginController
		return sqlSession.selectOne(namespace+"selectPwd",empNo);
	}

	@Override
	public int insertEmployee(EmployeeVO employeeVo) {
		return sqlSession.insert(namespace+"insertEmployee",employeeVo);
	}

	@Override
	public int changePwd(EmployeeVO employeeVo) {	//ForgetPasswordController
		return sqlSession.update(namespace+"changePwd",employeeVo);
	}

	@Override
	public int idcheck(String empNo) {
		return sqlSession.selectOne(namespace+"idcheck",empNo);
	}

	@Override
	public int pwdCountUp(String empNo) {	//StroeLoginController
		return sqlSession.update(namespace+"pwdCountUp",empNo);
	}

	@Override
	public int countZero(LogVO logVo) {	//StoreLoginController - logService
		return sqlSession.update(namespace+"countZero",logVo);
	}

	@Override
	public List<EmployeeVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public List<EmployeeVO> selectEmp(EmployeeVO employeeVo) {
		return sqlSession.selectList(namespace+"selectEmp", employeeVo);
	}

	@Override
	public List<EmployeeVO> selectStore() {
		return sqlSession.selectList(namespace+"selectStore");
	}

}
