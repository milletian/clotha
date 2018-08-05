package com.clotha.ca.employee.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.clotha.ca.employee.model.EmployeeService;
import com.clotha.ca.employee.model.EmployeeVO;
import com.clotha.ca.store.model.StoreVO;

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
	@RequestMapping(value="/ajaxemployeeWrite.do", produces = "application/text; charset=utf8")
	public @ResponseBody String employeeWrite(HttpServletRequest request) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		EmployeeVO employeeVo = new EmployeeVO();
	
		employeeVo.setEmpNo(multi.getParameter("empNo"));
		employeeVo.setDeptNo(multi.getParameter("deptNo"));
		employeeVo.setEmpName(multi.getParameter("empName"));
		employeeVo.setEmpPwd(multi.getParameter("empPwd"));
		employeeVo.setEmpZipcode(multi.getParameter("empZipcode"));
		employeeVo.setEmpAddress(multi.getParameter("empAddress")+"~"+multi.getParameter("addressDetail"));
		employeeVo.setEmpJumin(multi.getParameter("empJumin1")+"-"+multi.getParameter("empJumin2"));
		employeeVo.setEmpTel(multi.getParameter("empTel"));
		employeeVo.setEmpFace(multi.getParameter("empFace"));
		employeeVo.setEmpJob(multi.getParameter("empJob"));
		employeeVo.setGradeCode(multi.getParameter("gradeCode"));
		employeeVo.setStoreCode(multi.getParameter("storeCode"));
		
		if(multi.getParameter("selectEmail").equals("self")) {
			employeeVo.setEmpEmail(multi.getParameter("email1")+"@"+multi.getParameter("email2"));
		}else {
			employeeVo.setEmpEmail(multi.getParameter("email1")+"@"+multi.getParameter("selectEmail"));
		}
		
		logger.info("employeeVo={}", employeeVo);
		
		//파일 업로드
				String oldFileName=multi.getParameter("oldFileName");
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
				String empNo=employeeVo.getEmpNo();
				int cnt = employeeService.insertEmployee(employeeVo);
				
				logger.info("인사등록 결과 cnt={}", cnt);
				
				String msg="";
				if(cnt>0) {
					msg="등록 되었습니다.";
				}else {
					msg="등록 실패하였습니다.";
				}
				
				return msg;
				
			}	// 조회 list ajax
	
	
	@RequestMapping("/employeeList.do")
	public void employeeList_get() {
		logger.info("직원리스트 화면보여주기");
	}
		
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
	@ResponseBody
	public Map<String, Object> employeeDetail(@RequestParam(required=false) String empNo, Model model) {
		 logger.info("인사정보 상세페이지 empNo={}", empNo);
		 
		 Map<String, Object> map = employeeService.selectByEmpNo(empNo);
		 logger.info("수정화면 map={}",map);
		 
		 return map;
	}
	
	/*인사정보 수정*/
	@RequestMapping(value="/ajaxEmployeeEdit.do", produces = "application/text; charset=utf8")
	public @ResponseBody String employeeEdit(HttpServletRequest request) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		EmployeeVO employeeVo = new EmployeeVO();
	
		employeeVo.setEmpNo(multi.getParameter("empNo"));
		employeeVo.setDeptNo(multi.getParameter("deptNo"));
		employeeVo.setEmpName(multi.getParameter("empName"));
		employeeVo.setEmpPwd(multi.getParameter("empPwd"));
		employeeVo.setEmpZipcode(multi.getParameter("empZipcode"));
		employeeVo.setEmpAddress(multi.getParameter("empAddress")+"~"+multi.getParameter("addressDetail"));
		employeeVo.setEmpJumin(multi.getParameter("empJumin1")+"-"+multi.getParameter("empJumin2"));
		employeeVo.setEmpTel(multi.getParameter("empTel"));
		employeeVo.setEmpFace(multi.getParameter("empFace"));
		employeeVo.setEmpJob(multi.getParameter("empJob"));
		employeeVo.setGradeCode(multi.getParameter("gradeCode"));
		employeeVo.setStoreCode(multi.getParameter("storeCode"));
		
		if(multi.getParameter("selectEmail").equals("self")) {
			employeeVo.setEmpEmail(multi.getParameter("email1")+"@"+multi.getParameter("email2"));
		}else {
			employeeVo.setEmpEmail(multi.getParameter("email1")+"@"+multi.getParameter("selectEmail"));
		}
		
		logger.info("employeeVo={}", employeeVo);
		
		//파일 업로드
				String oldFileName=multi.getParameter("oldFileName");
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
				
				//기존에 있던 파일 삭제
				if(fileName!=null && !fileName.isEmpty()) {
					File oldFile
					= new File(fileUploadUtil.getUploadPath(request, fileUploadUtil.PATH_FLAG_IMAGE),oldFileName);
					if(oldFile.exists()) {
						boolean bool = oldFile.delete();
						logger.info("기존 파일 삭제여부:{}",bool);
					}
				}//기존 파일 삭제 if
				
				//db
				/*String empNo=employeeVo.getEmpNo();*/
				int cnt = employeeService.updateEmp(employeeVo);
				logger.info("인사정보 수정 결과 cnt={}", cnt);
				
				String msg="";
				if(cnt>0) {
					msg="수정 되었습니다.";
				}else {
					msg="수정 실패하였습니다.";
				}
				
				return msg;
				
			}

	//퇴사처리 outdate 찍기
	@RequestMapping(value="/ajaxEmployeeDel.do", produces = "application/text; charset=utf8")
	public @ResponseBody String employeeDel(@RequestParam String empNo)  {
	logger.info("퇴사일 찍기 empNo={}", empNo);

	int cnt = employeeService.delConfirm(empNo);
	return "삭제 완료";

}
	
	@RequestMapping("/employeeApprove.do")
	public void empApprove_get() {
		logger.info("등록신청 직원 화면보여주기");
	}
	
	/* 등록신청 list ajax*/
	@RequestMapping("/ajaxEmployeeApprove.do")
	@ResponseBody
	public List<Map<String, Object>> empApprove_post(@ModelAttribute String empDel) {
		logger.info("검색조건 empDel ={}", empDel);
		
		List<Map<String, Object>> list = employeeService.empApprove(empDel);
		
		logger.info("list.size={}", list.size());
		logger.info("list={}", list);
		return list;
	
	}
	
	@RequestMapping("/employeeFinal.do")
	@ResponseBody
	public Map<String, Object> empFinal(@RequestParam(required=false) String empNo) {
		 logger.info("인사정보 상세페이지 empNo={}", empNo);
		 
		 Map<String, Object> map = employeeService.selectByEmpNo(empNo);
		 logger.info("승인신청화면 map={}",map);
		 
		 return map;
	}
	
	//입사일 joindate 찍기
	@RequestMapping(value="/employeeApp.do", produces = "application/text; charset=utf8")
	public @ResponseBody String employeeApp(@RequestParam String empNo) {
	logger.info("입사일 찍기 employeeVo={}", empNo);

	int cnt = employeeService.appConfirm(empNo); 
	return "승인 완료";
		}
	
	@RequestMapping(value="/employeeSearch.do", method=RequestMethod.GET)
	public void employeeSearch_get() {
		logger.info("직원 검색하기");
		}
	@RequestMapping("/ajaxEmployeeSearch.do")
	@ResponseBody
	public List<Map<String, Object>> employeeSearch_post(@ModelAttribute EmployeeVO employeeVo) {
		logger.info("검색조건 employeeVo ={}", employeeVo);
		
		List<Map<String, Object>> list = employeeService.empSearch(employeeVo);
		
		logger.info("list.size={}", list.size());
		logger.info("list={}", list);
		return list;
	}
}
