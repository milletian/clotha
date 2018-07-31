package com.clotha.ca.employee.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

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
	public List<EmployeeVO> selectAll(EmployeeVO employeeVo) {
		if(employeeVo.getEmpNo()!=null && !employeeVo.getEmpNo().isEmpty()) {
			return sqlSession.selectList(namespace+"selectAll",employeeVo);
		}else {
			return sqlSession.selectList(namespace+"selectAll");
		}
	}

	@Override
	public List<Map<String, Object>> selectEmp(EmployeeVO employeeVo) {
		return sqlSession.selectList(namespace+"selectEmp", employeeVo);
	}


	@Override
	public Map<String, Object> selectByEmpNo(String empNo) {
		return sqlSession.selectOne(namespace+"selectByEmpNo", empNo);
		
	}

	@Override
	public int updateEmp(EmployeeVO employeeVo) {
		return sqlSession.update(namespace+"updateEmp", employeeVo);
	}

	@Override
	public int delConfirm(String empNo) {
		return sqlSession.update(namespace+"delConfirm", empNo);
	}

	@Override
	public List<Map<String, Object>> empApprove(String empDel) {
		return sqlSession.selectList(namespace+"empApprove", empDel);
	}

	@Override
	public int appConfirm(EmployeeVO employeeVo) {
		return sqlSession.update(namespace+"appConfirm", employeeVo);
	}

	@Override
	public List<Map<String, Object>> empSearch(EmployeeVO employeeVo) {
		return sqlSession.selectList(namespace+"empSearch", employeeVo);
	}

	

}
