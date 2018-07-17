package com.clotha.ca.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.clotha.ca.employee.model.EmployeeVO;

@Controller
@RequestMapping("/login")
public class ForgetPasswordController {
	
	private static Logger logger = LoggerFactory.getLogger(ForgetPasswordController.class);
	
	@RequestMapping(value="/forgetPassword.do" , method=RequestMethod.GET )
	public String forget_get() {
		//비밀번호 찾기
		logger.info("비밀번호 찾기 get");
		
		return "login/forgetPassword";
	}
	
	@RequestMapping(value="/forgetPassword.do", method=RequestMethod.POST)
	public String forget_post(@ModelAttribute EmployeeVO vo, Model model ) {
		// 사원번호랑 이메일이 일치하면 이메일로 임시 비밀번호를 보내주기
		logger.info("비밀번호 찾기 post, 파라미터 vo={}",vo);
		
		
		return "common/message";
	}
	

}
