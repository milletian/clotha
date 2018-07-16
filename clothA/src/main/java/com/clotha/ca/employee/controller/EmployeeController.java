package com.clotha.ca.employee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clotha.ca.employee.model.EmployeeService;

@Controller
@RequestMapping("/admin/employee")
public class EmployeeController {
	private static final Logger logger = 
			LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("register.do")
	public String register() {
		logger.info("직원등록 페이지 보여주기");
		
		return "admin/employee/register";
		
	}
}
