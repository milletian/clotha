package com.clotha.ca.employee.model;

public interface EmployeeDAO {
	public EmployeeVO selectEmployee(String empNo);	//StoreLoginController
	public String selectPwd(String empNo);	//StoreLoginController
	public int changePwd(EmployeeVO employeeVo);	//ForgetPasswordController
	public int idcheck(String empNo);	//ForgetPasswordController
	public int pwdCountUp(String empNo);	//StoreLoginController
	
	public int insertEmployee(EmployeeVO employeeVo);
	
	
}
