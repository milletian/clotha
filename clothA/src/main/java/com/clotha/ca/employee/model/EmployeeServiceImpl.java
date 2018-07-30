package com.clotha.ca.employee.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDAO employeeDao;

	@Override
	public EmployeeVO selectEmployee(String empNo) {	//StoreLoginController
		return employeeDao.selectEmployee(empNo);
	}

	@Override
	public int loginCheck(String empNo, String pwd) {	//StoreLoginController
		String dbPwd = employeeDao.selectPwd(empNo);
		if(dbPwd==null || dbPwd.isEmpty()) {
			return ID_NONE;
		}else {
			if(pwd.equals(dbPwd)) {
				return LOGIN_OK;
			}else {
				return PWD_DISAGREE; 
			}
		}//if
		
	}

	@Override
	public int insertEmployee(EmployeeVO employeeVo) {
		return employeeDao.insertEmployee(employeeVo);
	}

	@Override
	public int changePwd(EmployeeVO employeeVo) {	//ForgetPasswordController
		return employeeDao.changePwd(employeeVo);
	}

	@Override
	public int idcheck(String empNo) {
		return employeeDao.idcheck(empNo);
	}

	@Override
	public int pwdCountUp(String empNo) {	//StoreLoginController
		return employeeDao.pwdCountUp(empNo);
	}

	@Override
	public List<EmployeeVO> selectAll(EmployeeVO employeeVo) {	//MailController
		return employeeDao.selectAll(employeeVo);
	}

	@Override
	public List<Map<String, Object>> selectEmp(EmployeeVO employeeVo) {
		return employeeDao.selectEmp(employeeVo);
	}


	@Override
	public Map<String, Object> selectByEmpNo(String empNo) {
		return employeeDao.selectByEmpNo(empNo);
	}

	@Override
	public int updateEmp(EmployeeVO employeeVo) {
		return employeeDao.updateEmp(employeeVo);
	}

	@Override
	public int delConfirm(String empNo) {
		return employeeDao.delConfirm(empNo);
	}

	@Override
	public List<Map<String, Object>> empApprove(String empDel) {
		return employeeDao.empApprove(empDel);
	}

	
	
	
}
