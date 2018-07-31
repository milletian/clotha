package com.clotha.ca.store.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.clotha.ca.common.FileUploadUtil;
import com.clotha.ca.stockarea.model.StockAreaService;
import com.clotha.ca.store.model.StoreService;
import com.clotha.ca.store.model.StoreVO;

@Controller
@RequestMapping("/admin/store")
public class StoreController {
	private static final Logger logger = LoggerFactory.getLogger(StoreController.class);
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private StockAreaService stockAreaService;
	
	@Autowired
	private FileUploadUtil fileupload;
	
	@RequestMapping(value="/storeWrite.do", method=RequestMethod.GET)
	public String storeWrite_get(@RequestParam(required=false) String storeCode,Model model) {
		if(storeCode!=null&&!storeCode.isEmpty()) {
			StoreVO storeVo = storeService.SearchStoreByCode(storeCode);
			model.addAttribute("storeVo", storeVo);
		}
		return "admin/store/storeWrite";
	}
	
	@RequestMapping(value="/ajaxStoreWrite.do",produces = "application/text; charset=utf8")
	public @ResponseBody String storeWrite_post(HttpServletRequest request){
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request; 
		StoreVO storeVO = new StoreVO();
		String oldfile = multi.getParameter("oldfile");
		String[] oldFileList = null;
		if(oldfile!=null&&!oldfile.isEmpty()) {
			oldFileList = oldfile.split(",");			
		}
		String areaCode = multi.getParameter("areaCode");
		
		storeVO.setStoreCode(multi.getParameter("storeCode"));
		storeVO.setEmpNo(multi.getParameter("empNo"));
		storeVO.setStoreName(multi.getParameter("storeName"));
		storeVO.setStoreZipcode(multi.getParameter("storeZipcode"));
		storeVO.setStoreAddress(multi.getParameter("address")+"~"+multi.getParameter("addressDetail"));
		storeVO.setStaCode(multi.getParameter("staCode"));
		storeVO.setStoreTel(multi.getParameter("storeTel"));
		storeVO.setStoreNo(multi.getParameter("storeNo"));
		logger.info("storeWrite={}",storeVO);
		String result = "";
		String path = fileupload.getUploadPath(request, fileupload.PATH_FLAG_STOREIMAGE);
		result = fileupload.multifileup(multi, path);
		storeVO.setStoreImage(result); // 업로드 메서드 결과로 나온 이미지 파일들 이름 을 세팅
		if(oldfile!=null&&!oldfile.isEmpty()&&result!=null&&!result.isEmpty()) {
			for(String oldfilename : oldFileList) {				
				 File file = new File(path+"\\"+oldfilename);
			     if(file.exists() ){
			         if(file.delete()){
			             System.out.println("파일삭제 성공");
			         }else{
			             System.out.println("파일삭제 실패");
			         }
			     }else{
			         System.out.println("파일이 존재하지 않습니다.");
			     }
			}
		}
		if(storeVO.getStoreCode()==null||storeVO.getStoreCode().isEmpty()) {
			stockAreaService.insertStockArea(areaCode);
			storeService.insertStore(storeVO);
		}else {
			storeService.updateStore(storeVO);
		}
		return "등록 성공!";
	}
	
	@RequestMapping(value="/storeList.do", method=RequestMethod.GET)
	public void storeList() {
		
	}
	
	@RequestMapping(value="/ajaxStoreList.do")
	@ResponseBody
	public List<StoreVO> ajaxStoreList(@ModelAttribute StoreVO storeVO) {
		logger.info("{}",storeVO);
		List<StoreVO> list = storeService.SearchStore(storeVO);
		logger.info("{}",list.size());
		return list;
	}
	
	@RequestMapping(value="/ajaxStoreOne.do")
	@ResponseBody
	public StoreVO ajaxStoreOne(@RequestParam String storeCode) {
		StoreVO storeVO = storeService.SearchStoreByCode(storeCode);
		return storeVO;
	}
	
	@RequestMapping(value="/ajaxStoreDel.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String ajaxStoreDel(@RequestParam String storeCode) {
		logger.info("{}",storeCode);
		int result = storeService.storeDel(storeCode);
		if(result==0) {
			return "영업정지 처분 실패";
		}else {
			return "영업정지 처분 성공";			
		}
	}
}
