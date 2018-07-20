package com.clotha.ca.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.mail.MessagingException;
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

import com.clotha.ca.email.EmailSender;
import com.clotha.ca.employee.model.EmployeeService;
import com.clotha.ca.employee.model.EmployeeVO;

@Controller
@RequestMapping("/login")
public class ForgetPasswordController {
	
	private static Logger logger = LoggerFactory.getLogger(ForgetPasswordController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value="/forgetPassword.do" , method=RequestMethod.GET )
	public String forget_get() {
		//비밀번호 찾기
		logger.info("비밀번호 찾기 get");
		
		return "login/forgetPassword";
	}
	
	@RequestMapping(value="/forgetPassword.do", method=RequestMethod.POST)
	public void forget_post(@ModelAttribute EmployeeVO vo, Model model, HttpServletRequest request, HttpServletResponse response ) throws IOException {
		// 사원번호랑 이메일이 일치하면 이메일로 임시 비밀번호를 보내주기
		logger.info("비밀번호 찾기 post, 파라미터 vo={}",vo);
		int cnt = employeeService.idcheck(vo.getEmpNo());
		
		if(cnt==1) {
			EmployeeVO employeeVo = employeeService.selectEmployee(vo.getEmpNo());
			if(employeeVo.getEmpEmail().equals(vo.getEmpEmail())) {
				
				int start=(int) (Math.random()*27);
				String change = UUID.randomUUID().toString().replace("-","").substring(start, start+6);
				vo.setEmpPwd(change);
				int result = employeeService.changePwd(vo);
				logger.info("임시비밀번호 결과 result ={} changepwd={} ",result,change);
				if(result==1) {
					
					String subject = "ClothA 임시비밀번호 발송";
					String content = "임시 비밀번호 : "+change+" 입니다. 비밀번호 변경해주시기 바랍니다.";
					String to = employeeVo.getEmpEmail();
					String from = "ClothA@clothacompany.com";
					
					try {
						emailSender.sendEmail(subject, content, to, from);
						logger.info("발송 성공");
					} catch (MessagingException e) {
						logger.info("발송 실패");
						e.printStackTrace();
					}
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'>");
					out.println("alert('임시비밀번호를 메일로 발송하였습니다.');");
					out.print("self.close();");
					out.print("</script>");
					
					return ;
					
				}else {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'>");
					out.println("alert('비밀번호 변경 실패하였습니다. 다시 시도해주세요.');");
					out.print("history.back();");
					out.print("</script>");
					
					return;
				}
				
			}else {
				
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('사원코드 또는 email주소가 일치하지 않습니다.');");
				out.print("history.back();");
				out.print("</script>");
				
				return ;
				
			}
		}else{
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('등록되지 않은 사원입니다.');");
			out.print("history.back();");
			out.print("</script>");
			
			return ;
			
		}//if
		
	}
	

}
