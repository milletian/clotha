package com.clotha.ca.employee.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl {
	
	@Autowired
	private EmployeeDAO employeeDao;
	
}
