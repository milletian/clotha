package com.clotha.ca.employee.model;

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
	
}
