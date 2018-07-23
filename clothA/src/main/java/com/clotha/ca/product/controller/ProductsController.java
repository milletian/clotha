package com.clotha.ca.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

import com.clotha.ca.account.model.AccountVO;
import com.clotha.ca.accountdetail.model.AccountDetailVO;
import com.clotha.ca.common.FileUploadUtil;
import com.clotha.ca.common.Utility;
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
	
	@RequestMapping("/products/productsList.do")
	public String productsList(@ModelAttribute ProductsVO productsVo, Model model) {
		logger.info("상품목록 파라미터 productsVo={}",productsVo);
		
		return "/admin/products/productsList";
		
	}
	
	//상품명 ajax
	@RequestMapping(value="/products/ajaxProductsName.do")
	@ResponseBody
	public List<ProductsVO> ProductsName_post() {
		logger.info("상품 이름 ajax");
		//db처리
		List<ProductsVO> list =	productsService.selectAll();
		
		return list;
	}

	@RequestMapping(value="/products/ajaxProductsList.do")
	@ResponseBody
	public List<Map<String,Object>> productsList_post(@ModelAttribute ProductsVO productsVo,@RequestParam(required=false) String searchDateRange) {
		logger.info("검색 조건 productsVo={}",productsVo);
		if(searchDateRange!=null&&!searchDateRange.isEmpty()) {
			String[] dateRange =searchDateRange.split("~");
			productsVo.setStartDay(dateRange[0]);
			productsVo.setEndDay(dateRange[1]);
		}
		logger.info("{},{}",productsVo.getStartDay(),productsVo.getEndDay());
		List<Map<String,Object>> list = productsService.selectProduct(productsVo);
		logger.info("{}",list);
		
		for(Map<String,Object> map : list) {
			SimpleDateFormat smf = new SimpleDateFormat("yyyy/MM/dd");
			Date date=(Date) map.get("PD_REGDATE");
			String str=smf.format(date);

			map.put("PD_REGDATE",str);
			logger.info("pdRegdate={}",str);
		}
		return list;
		
	}
	
	@RequestMapping(value="/products/productsDetail.do", method=RequestMethod.GET)
	public String productsDetail(@RequestParam String pdCode, Model model) {
		logger.info("상품 세부사항 조회 화면 파라미터 pdCode={}",pdCode);
		
		ProductsVO vo =	productsService.selectByPdCode(pdCode);
		logger.info("해당 pdCode에 상세정보 vo = {}", vo);
		String regdate = vo.getPdRegdate();
		String pdYear = regdate.substring(0, 4);
		logger.info("생산년도",pdYear);
		
		model.addAttribute("vo",vo);
		model.addAttribute("pdYear",pdYear);
		
		return "/admin/products/productsDetail";
		
	}
	
	@RequestMapping(value="/products/productsEdit.do", method=RequestMethod.GET)
	public String productsEdit_get(@RequestParam String pdCode, Model model) {
		logger.info("수정화면 보여주기 String pdCode={}",pdCode);
		
		ProductsVO vo = productsService.selectByPdCode(pdCode);
		logger.info("수정화면 vo={}",vo);
		
		model.addAttribute("vo",vo);
		return "/admin/products/productsEdit";
	}
	
	@RequestMapping(value="/products/productsEdit.do",method=RequestMethod.POST)
	public String productsEdit_post(@ModelAttribute ProductsVO productsVo,HttpServletRequest request,
			@RequestParam String oldFileName ,Model model) {
		logger.info("수정처리하기");
		
		//파일 업로드처리
		String fileName="";
		try {
			List<Map<String, Object>> list = fileUploadUtil.fileUpload(request,FileUploadUtil.PATH_FLAG_IMAGE);
			
			for(Map<String, Object> map : list) {
			fileName =(String)map.get("fileName");
			}
		//파일정보 셋팅
			productsVo.setPdImage(fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int cnt = productsService.updatePdDetail(productsVo);
		String msg="", url="/admin/products/productsEdit";
		if(cnt>0) {
			msg="수정에 성공하셨습니다.";
			url="/admin/products/productsDetail.do?pdCode="+productsVo.getPdCode();
		}else {
			msg="수정에 실패하셨습니다!!";
		}
		
		//기존에 있던 파일 삭제
		if(fileName!=null && !fileName.isEmpty()) {
			File oldFile
			= new File(fileUploadUtil.getUploadPath(request, fileUploadUtil.PATH_FLAG_IMAGE),oldFileName);
			if(oldFile.exists()) {
				boolean bool = oldFile.delete();
				logger.info("기존 파일 삭제여부:{}",bool);
			}
		}//기존 파일 삭제 if
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}
