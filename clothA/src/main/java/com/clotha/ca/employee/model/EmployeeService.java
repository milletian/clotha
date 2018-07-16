package com.clotha.ca.employee.model;

public interface EmployeeService {
	
	//로그인 처리에서 사용
	int LOGIN_OK=1;  //로그인 성공
	int ID_NONE=2;  //해당 아이디가 없다
	int PWD_DISAGREE=3;  //비밀번호가 일치하지 않는다
	
	public EmployeeVO selectEmployee(String empNo);
	public int loginCheck(String empNo,String pwd);
	
}
