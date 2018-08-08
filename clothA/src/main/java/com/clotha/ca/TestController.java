package com.clotha.ca;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/manager.do")
	public String test() {
		
		return "manager";
	}
	
	@RequestMapping	("/admin/testbody.do")
	public String testbody() {
		
		return "admin/testbody";
	}

}
