package com.clotha.ca.product.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.clotha.ca.common.FileUploadUtil;
import com.clotha.ca.product.model.ProductsService;
import com.clotha.ca.product.model.ProductsVO;

@Controller
@RequestMapping("/admin")
public class ProductsController {
	public static final Logger logger
	= LoggerFactory.getLogger(ProductsController.class);
	
	@Autowired
	private ProductsService productsService;
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	@RequestMapping(value="/products/productWrite.do", method=RequestMethod.GET)
	public void ProductsWrite() {
		logger.info("상품등록 페이지 보여주기");
		
	}
	
	@RequestMapping(value="/products/productWrite.do", method=RequestMethod.POST)
	public String productsWrite(@ModelAttribute ProductsVO productsVo,
			HttpServletRequest request,Model model) {
		logger.info("상품등록 처리하기 ProductsVo={}",productsVo);
		
		//파일업로드하기
		String fileName="";
		try {
			List<Map<String, Object>> list
			= fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_FLAG_IMAGE);
			for(Map<String, Object> map : list) {
			fileName =(String)map.get("fileName");
			}
			productsVo.setPdImage(fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//db처리하기
		int cnt = productsService.insertProducts(productsVo);
		String msg = "",url="/admin/products/productWrite.do";
		if(cnt>0) {
			msg="등록이 완료되었습니다.";
		}else {
			msg="등록 실패!";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	/*@RequestMapping("/products/productsList.do")
	public String productsList(@ModelAttribute ProductsVO ProductsVo, Model model) {
		logger.info("상품등록 내역 보여주기");
		
		//db처리
		
		
	}*/
}
