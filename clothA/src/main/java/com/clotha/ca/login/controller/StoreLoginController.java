package com.clotha.ca.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.clotha.ca.employee.model.EmployeeService;
import com.clotha.ca.employee.model.EmployeeVO;

@Controller
public class StoreLoginController {
	private static final Logger logger = LoggerFactory.getLogger(StoreLoginController.class);
	
	@Autowired private EmployeeService employeeService;
	
	@RequestMapping(value="storeLogin.do",method=RequestMethod.GET )
	public String Login() {
		//사원 - 로그인 페이지
		logger.info("사원 로그인 페이지보여주기");
		
		return "login/storeLogin";
	}
	
	@RequestMapping(value="storeLogin.do",method=RequestMethod.POST)
	public String Login_post(@ModelAttribute EmployeeVO vo, Model model, HttpServletRequest request, HttpServletResponse response  ) {
		//사원 - 로그인 완료 페이지
		logger.info("로그인 완료 , 파라미터 ={}",vo);
		
		int result = employeeService.loginCheck(vo.getEmpNo(), vo.getEmpPwd());
		logger.info("로그인 결과 ={}",result);
		
		String msg = "", url = "/login/storeLogin.do";
		if(result==employeeService.LOGIN_OK) {
			EmployeeVO employeeVo = employeeService.selectEmployee(vo.getEmpNo());
			request.getSession().setAttribute("empNo", employeeVo.getEmpNo());
			request.getSession().setAttribute("gradeCode", employeeVo.getGradeCode());
			
			Cookie ck = new Cookie("ck_empNo", vo.getEmpNo());
			ck.setPath("/");
			msg=employeeVo.getEmpName()+"님! 로그인 되었습니다.";
			url="/test.do";
			
		}else if(result == employeeService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result == employeeService.ID_NONE) {
			msg="해당 사원코드가 존재하지 않습니다.";
		}else {
			msg="로그인 처리 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
			
		return "common/message";
	}

}






















