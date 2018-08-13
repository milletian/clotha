package com.clotha.ca.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class managerInterceptor extends HandlerInterceptorAdapter{
//public class LoginInterceptor implements HandlerInterceptor{
	
	private static final Logger logger = LoggerFactory.getLogger(managerInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("본사 인터셉터!!!!");
		String gradeCode = (String)request.getSession().getAttribute("gradeCode");
		if(Integer.parseInt(gradeCode)>=3) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script type='text/javascript'>");
			out.println("alert('본사페이지로 들어갈수 없습니다.');");
			out.println("history.back();");
			out.print("</script>");
			return false;
		}
		
		return true;
	}
	
}
