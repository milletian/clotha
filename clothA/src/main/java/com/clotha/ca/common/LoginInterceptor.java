package com.clotha.ca.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{
//public class LoginInterceptor implements HandlerInterceptor{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("인터셉터!!!!!!!!");
		String empNo = (String)request.getSession().getAttribute("empNo");
		if(empNo==null || empNo.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.println("alert('로그인이 되어야 합니다.');");
			out.println("location.href='"+request.getContextPath()+"/storeLogin.do';");
			out.print("</script>");
			return false;	
		}
		
		return true;
	}
	
}
