package com.clotha.ca.product.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class ProductsController {
	public static final Logger logger
	= LoggerFactory.getLogger(ProductsController.class);
	
	@RequestMapping("/products/productWrite.do")
	public void ProductsWrite() {
		logger.info("상품등록 페이지 보여주기");
		
	}
}
