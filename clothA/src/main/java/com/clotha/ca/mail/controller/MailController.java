package com.clotha.ca.mail.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.employee.model.EmployeeService;
import com.clotha.ca.employee.model.EmployeeVO;
import com.clotha.ca.mail.model.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	private static Logger logger = LoggerFactory.getLogger(MailController.class);
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/mail.do")
	public String mail() {
		logger.info("mail화면 보여주기");
		
		
		return "mail/mail";
	}
	
	@RequestMapping(value="/mailWrite.do",method=RequestMethod.GET)
	public String mailWrite() {
		logger.info("쪽지쓰기 화면");
		
		return "mail/mailWrite";
	}
	
	@RequestMapping("/ajaxmailWrite.do")
	@ResponseBody
	public List<EmployeeVO> mailEmpno(@ModelAttribute EmployeeVO employeeVo) {
		logger.info("employeeVo={}",employeeVo);
		List<EmployeeVO> list = employeeService.selectAll(employeeVo);
		logger.info("검색결과 employeevo={}",employeeVo);
		return list;
	}
	
	@RequestMapping(value="/mailWrite.do",method=RequestMethod.POST)
	public String mailWrite_post() {
		logger.info("쪽지쓰기 처리");
		
		
		
		return "mail/mailWrite";
	}
	
	@RequestMapping(value="/getMail.do",method=RequestMethod.GET )
	public String getMail_get() {
		
		
		return "mail/getMail";
	}

}








