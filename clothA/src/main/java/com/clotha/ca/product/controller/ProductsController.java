package com.clotha.ca.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.clotha.ca.account.model.AccountVO;
import com.clotha.ca.accountdetail.model.AccountDetailVO;
import com.clotha.ca.common.FileUploadUtil;
import com.clotha.ca.common.Utility;
import com.clotha.ca.employee.model.EmployeeVO;
import com.clotha.ca.product.model.ProductsService;
import com.clotha.ca.product.model.ProductsVO;
import com.clotha.ca.stock.model.StockVO;

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
	
	@RequestMapping(value="/products/ajaxproductWrite.do", produces = "application/text; charset=utf8")
	public @ResponseBody String productsWrite(HttpServletRequest request) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		ProductsVO productsVo = new ProductsVO();
		
		productsVo.setPdName(multi.getParameter("pdName"));
		productsVo.setPdOriginalPrice(Integer.parseInt(multi.getParameter("pdOriginalPrice")));
		productsVo.setPdSellPrice(Integer.parseInt(multi.getParameter("pdSellPrice")));
		productsVo.setStyleCode(multi.getParameter("styleCode"));
		productsVo.setColorCode(multi.getParameter("colorCode"));
		productsVo.setSeasonCode(multi.getParameter("seasonCode"));
		productsVo.setSizeCode(multi.getParameter("sizeCode"));
		productsVo.setAccCode(multi.getParameter("accCode"));
		productsVo.setGenderCode(multi.getParameter("genderCode"));
		productsVo.setPdDel(multi.getParameter("pdDel"));
		productsVo.setPdWarning(multi.getParameter("pdWarning"));
		productsVo.setPdExplanation(multi.getParameter("pdExplanation"));
		
		
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
		String msg = "";
		if(cnt>0) {
			msg="등록이 완료되었습니다.";
		}else {
			msg="등록 실패!";
		}
		
		return msg;
	}
	
	@RequestMapping("/products/productsList.do")
	public void productsList() {
		logger.info("상품목록 화면");
		
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
	
	//검색
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
	
	
	//수정화면
	@RequestMapping(value="/products/productsDetil.do")
	@ResponseBody
	public ProductsVO productsDetil(@RequestParam(required=false) String pdCode) {
		logger.info("수정화면 보여주기 String pdCode={}",pdCode);
		
		ProductsVO productsVo = productsService.selectByPdCode(pdCode);
		logger.info("수정화면 productsVo={}",productsVo);
		
		return productsVo;
	}
	
	//수정처리
	@RequestMapping(value="/products/productsEdit.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String productsEdit(HttpServletRequest request) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		ProductsVO productsVo = new ProductsVO();
		
		productsVo.setPdCode(multi.getParameter("pdCode"));
		productsVo.setPdName(multi.getParameter("pdName"));
		productsVo.setPdImage(multi.getParameter("changeFile"));
		productsVo.setPdOriginalPrice(Integer.parseInt(multi.getParameter("pdOriginalPrice")));
		productsVo.setPdSellPrice(Integer.parseInt(multi.getParameter("pdSellPrice")));
		productsVo.setPdDel(multi.getParameter("pdDel"));
		productsVo.setPdWarning(multi.getParameter("pdWarning"));
		productsVo.setPdExplanation(multi.getParameter("pdExplanation"));
		
		logger.info("productsVo={}",productsVo);
		
		//파일 업로드처리
		String oldFileName=multi.getParameter("oldFileName");
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
		
		
		//기존에 있던 파일 삭제
		if(fileName!=null && !fileName.isEmpty()) {
			File oldFile
			= new File(fileUploadUtil.getUploadPath(request, fileUploadUtil.PATH_FLAG_IMAGE),oldFileName);
			if(oldFile.exists()) {
				boolean bool = oldFile.delete();
				logger.info("기존 파일 삭제여부:{}",bool);
			}
		}//기존 파일 삭제 if
		
		int cnt = productsService.updatePdDetail(productsVo);
		String msg="";
		if(cnt>0) {
			msg="수정에 성공하셨습니다.";
		}else {
			msg="수정에 실패하셨습니다!!";
		}
		
		return msg;
	}
	
	
	@RequestMapping(value="/products/productsDelete.do", produces = "application/text; charset=utf8")
	public @ResponseBody String productsDelete(@RequestParam String pdCode, HttpServletRequest request) {
		logger.info("삭제 pdCode={}", pdCode);
		/*MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		
		String oldFileName=multi.getParameter("oldFileName");
		String fileName="";
		if(fileName!=null && !fileName.isEmpty()) {
			File oldFile
			= new File(fileUploadUtil.getUploadPath(request, fileUploadUtil.PATH_FLAG_IMAGE),oldFileName);
			if(oldFile.exists()) {
				boolean bool = oldFile.delete();
				logger.info("기존 파일 삭제여부:{}",bool);
			}
		}//기존 파일 삭제 if
		*/
		int result = productsService.deleteProducts(pdCode);
		if(result>0) {
			return "상품삭제 성공";
		}else {
			return "상품삭제 실패";			
		}
	}
	
	//상품검색창 화면 
	
	@RequestMapping(value="/products/productsSearch.do", method=RequestMethod.GET)
	public void productSearch() {
		logger.info("검색화면 보여주기");
	}
	
	@RequestMapping("/products/ajaxProductsExcelUpload.do")
	@ResponseBody
	public List<ProductsVO> ajaxProductsExcelUpload(MultipartHttpServletRequest req) {
		String excelType = req.getParameter("excelType");
		List<ProductsVO> list = new ArrayList<>();
		logger.info("ajaxStockExcelUpload : excelType={}",excelType);
		if(excelType.equals("xlsx")) {
			return productsService.xlsxExcelReader(req);
		}else if(excelType.equals("xls")) {
			return productsService.xlsExcelReader(req);
		}
		return list;
	}
}
