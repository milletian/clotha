package com.clotha.ca;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminIndexController {

	@RequestMapping("/admin/adminIndex.do")
	public String adminIndex() {
		return "admin/adminIndex";
	}
}
