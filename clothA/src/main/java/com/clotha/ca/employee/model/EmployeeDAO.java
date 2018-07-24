package com.clotha.ca.employee.model;

import java.util.List;

import com.clotha.ca.log.model.LogVO;

public interface EmployeeDAO {
	public EmployeeVO selectEmployee(String empNo);	//StoreLoginController
	public String selectPwd(String empNo);	//StoreLoginController
	public int changePwd(EmployeeVO employeeVo);	//ForgetPasswordController
	public int idcheck(String empNo);	//ForgetPasswordController
	public int pwdCountUp(String empNo);	//StoreLoginController
	public int countZero(LogVO logVo);	//StoreLoginController	 - logService
		
	public int insertEmployee(EmployeeVO employeeVo);
	public List<EmployeeVO> selectAll();
	public List<EmployeeVO> selectEmp(EmployeeVO employeeVo);
	public List<EmployeeVO> selectStore();
	
}
