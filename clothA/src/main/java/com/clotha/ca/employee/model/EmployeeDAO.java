package com.clotha.ca.employee.model;

public interface EmployeeDAO {
	public EmployeeVO selectEmployee(String empNo);
	public String selectPwd(String empNo);

}
