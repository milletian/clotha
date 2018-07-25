package com.clotha.ca.employee.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.clotha.ca.common.FileUploadUtil;
import com.clotha.ca.employee.model.EmployeeService;
import com.clotha.ca.employee.model.EmployeeVO;
import com.clotha.ca.product.model.ProductsVO;

@Controller
@RequestMapping("/admin/employee")
public class EmployeeController {
	private static final Logger logger = 
			LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private FileUploadUtil fileUploadUtil;
	
	
	/*인사등록 뷰페이지*/
	@RequestMapping(value="/employeeWrite.do", method=RequestMethod.GET)
	public void employeeWrite() {
		logger.info("직원등록 페이지 보여주기");
		
	}
	
	/*인사등록*/
	@RequestMapping(value="/employeeWrite.do", method=RequestMethod.POST)
	public String employeeWrite(@ModelAttribute EmployeeVO employeeVo, 
			@RequestParam String email1, @RequestParam String selectEmail, @RequestParam(required=false) String email2, 
			@RequestParam String empJumin1, @RequestParam String empJumin2, @RequestParam(required=false) String addressDetail, 
			HttpServletRequest request,Model model ) {
		//주민번호 셋팅
		employeeVo.setEmpJumin(empJumin1+"-"+empJumin2);
		
		//주소 셋팅
		employeeVo.setEmpAddress(employeeVo.getEmpAddress()+"~"+addressDetail);
		
		//이메일 주소 셋팅
		if(selectEmail.equals("self")) {
			employeeVo.setEmpEmail(email1+"@"+email2);
			
		}else {
			employeeVo.setEmpEmail(email1+"@"+selectEmail);
			
		}
				
		
		logger.info("인사등록 처리 파라메타 vo={}," , employeeVo);

		
		//파일 업로드
		String fileName="";
		try {
			List<Map<String, Object>> list
			=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_FLAG_IMAGE);
			for(Map<String, Object> map:list) {
				fileName =(String) map.get("fileName");				
			}
			employeeVo.setEmpFace(fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//db
		int cnt=employeeService.insertEmployee(employeeVo);
		logger.info("인사등록 결과 cnt={}", cnt);
		
		String msg="", url="/admin/employee/register.do";
		if(cnt>0) {
			msg="등록 완료 되었습니다";
		}else {
			msg="등록에 실패 했습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	
		@RequestMapping("/employeeList.do")
		public void employeeList_get() {
			logger.info("직원리스트 화면보여주기");
		}
		
		/* 조회 list ajax*/
		@RequestMapping("/ajaxEmployeeList.do")
		@ResponseBody
		public List<Map<String, Object>> employeeList_post(@ModelAttribute EmployeeVO employeeVo) {
			logger.info("검색조건 employeeVo ={}", employeeVo);
			
			List<Map<String, Object>> list = employeeService.selectEmp(employeeVo);
			
			logger.info("list.size={}", list.size());
			logger.info("list={}", list);
			return list;
		}
		
		@RequestMapping("/employeeDetail.do")
		public String employeeDetail(@RequestParam(required=false) String empNo, Model model) {
			 logger.info("인사정보 상세페이지 empNo={}", empNo);
			 
			 Map<String, Object> map = employeeService.selectByEmpNo(empNo);
			 logger.info("수정화면 map={}",map);
			 
			 model.addAttribute("map",map);
			 
			 return "admin/employee/employeeDetail";
		}
		
}
