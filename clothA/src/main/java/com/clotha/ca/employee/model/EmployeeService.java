package com.clotha.ca.employee.model;

import java.util.List;

public interface EmployeeService {
	
	//로그인 처리에서 사용
	int LOGIN_OK=1;  //로그인 성공
	int ID_NONE=2;  //해당 아이디가 없다
	int PWD_DISAGREE=3;  //비밀번호가 일치하지 않는다
	
	public EmployeeVO selectEmployee(String empNo);	//StoreLoginController
	public int loginCheck(String empNo,String pwd);	//StoreLoginController
	public int changePwd(EmployeeVO employeeVo);	//ForgetPasswordController
	public int idcheck(String empNo);	//ForgetPasswordController
	public int pwdCountUp(String empNo);	//StoreLoginController
	
	public int insertEmployee(EmployeeVO employeeVo);
	public List<EmployeeVO> selectAll();
	public List<EmployeeVO> selectEmp(EmployeeVO employeeVo);
	public List<EmployeeVO> selectStore();
}
