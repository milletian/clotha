package com.clotha.ca.store.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/store")
public class StoreController {
	private static final Logger logger =
		LoggerFactory.getLogger(StoreController.class);
	
	@RequestMapping(value="/storeWrite.do", method=RequestMethod.GET)
	public void storeWrite() {
		logger.info("매장등록 페이지 보여주기");
		
	}
}
