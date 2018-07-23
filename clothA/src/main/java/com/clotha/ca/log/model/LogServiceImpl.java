package com.clotha.ca.log.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.clotha.ca.employee.model.EmployeeDAO;

@Service
public class LogServiceImpl implements LogService {
	
	@Autowired
	private LogDAO logDao;
	@Autowired
	private EmployeeDAO employeeDao;
	
	@Override
	public int loginInsert(LogVO logVo) {	//StoreLoginController
		employeeDao.countZero(logVo);
		return logDao.loginInsert(logVo);
	}

	@Override
	public int logoutUpdate(int logPk) {	//LogoutController
		return logDao.logoutUpdate(logPk);
	}
	
}
