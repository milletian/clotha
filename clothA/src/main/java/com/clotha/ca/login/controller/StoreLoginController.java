package com.clotha.ca.login.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

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
import com.clotha.ca.log.model.LogService;
import com.clotha.ca.log.model.LogVO;

@Controller
public class StoreLoginController {
	private static final Logger logger = LoggerFactory.getLogger(StoreLoginController.class);
	
	@Autowired private EmployeeService employeeService;
	@Autowired private LogService logService;
	
	
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
		
		String msg = "", url = "/storeLogin.do";
		if(result==employeeService.LOGIN_OK) {
			
			EmployeeVO employeeVo = employeeService.selectEmployee(vo.getEmpNo());
			if(employeeVo.getEmpDel().equals("N")) {
				msg="퇴사 또는 입사승인 대기중인 사원코드입니다.";
			}else {
				request.getSession().setAttribute("empNo", employeeVo.getEmpNo());
				request.getSession().setAttribute("gradeCode", employeeVo.getGradeCode());
				
				InetAddress local;
				try {
					local = InetAddress.getLocalHost();
					String ip = local.getHostAddress();
					LogVO logVo = new LogVO();
					logVo.setEmpNo(vo.getEmpNo());
					logVo.setLogIp(ip);
					int cnt = logService.loginInsert(logVo);
					logger.info("로그찍기 결과 cnt = {} ,ip={}",cnt,ip);
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}
				
				Cookie ck = new Cookie("ck_empNo", vo.getEmpNo());
				ck.setPath("/");
				msg=employeeVo.getEmpName()+"님! 로그인 되었습니다.";
				int grade = Integer.parseInt(employeeVo.getGradeCode());
				if(grade <= 2) {
					url="/test.do";	//본사 로그인
				}else {
					url="/admin/account/accountWrite.do";	//매장 로그인
				}
			}
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

