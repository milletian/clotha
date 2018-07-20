package com.clotha.ca.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clotha.ca.log.model.LogService;

@Controller
public class LogoutController {
	private Logger logger = LoggerFactory.getLogger(LogoutController.class);
	
	@Autowired private LogService logService;
	
	@RequestMapping(value="/logout.do")
	public String logout_get(HttpServletRequest request, HttpServletResponse response) {
		//로그아웃 페이지
		String empNo = (String) request.getSession().getAttribute("empNo");
		int logPk = (int) request.getSession().getAttribute("logPk");
		logger.info("로그아웃 페이지, 파라미터 empNo={}, logPk={}",empNo,logPk);
		
		if(empNo!=null && !empNo.isEmpty()) {
			int cnt = logService.logoutUpdate(logPk);
			logger.info("로그아웃 날짜 찍기결과 cnt={}",cnt);
			
			request.getSession().removeAttribute(empNo);
			request.getSession().removeAttribute("logPk");
			request.getSession().removeAttribute("gradeCode");
			
		}else {
			logger.info("로그아웃 세션 날리기 실패");
		}
		
		
		
		return "redirect:/storeLogin.do";
	}
	
}
