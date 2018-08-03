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
				String empNo=employeeVo.getEmpNo();
				int cnt = 0;
				if(empNo!=null&&!empNo.isEmpty()) {
					cnt=employeeService.updateEmp(employeeVo);
				}else {
					cnt=employeeService.insertEmployee(employeeVo);
				}
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
		//날짜 yyyy-MM-dd 찍어주기
		/*for(Map<String,Object> map : list) {
			String str=Utility.convertDate(map.get("EMP_OUTDATE"));
			map.put("EMP_OUTDATE",str);
		
			String str2=Utility.convertDate(map.get("EMP_JOINDATE"));
			map.put("EMP_JOINDATE",str2);
			
			logger.info("map={}",map);
		}*/
	}
	
	@RequestMapping("/employeeDetail.do")
	@ResponseBody
	public Map<String, Object> employeeDetail(@RequestParam(required=false) String empNo, Model model) {
		 logger.info("인사정보 상세페이지 empNo={}", empNo);
		 
		 Map<String, Object> map = employeeService.selectByEmpNo(empNo);
		 logger.info("수정화면 map={}",map);
		 
		 return map;
	}
	
	/*@RequestMapping("/employeeEdit.do")
	public String employeeEdit(@ModelAttribute EmployeeVO employeeVo, Model model,
			HttpServletRequest request, @RequestParam String oldFileName,
			@RequestParam String email1, @RequestParam String selectEmail, @RequestParam(required=false) String email2, 
			@RequestParam String empJumin1, @RequestParam String empJumin2, @RequestParam(required=false) String addressDetail) {
		logger.info("인사정보 수정 employeeVo={}, 파일정보", employeeVo);
		logger.info("empNo={}",employeeVo.getEmpNo());
		
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
		
		
		
		//파일 업로드처리
		String fileName="";
		try {
			List<Map<String, Object>> list = fileUploadUtil.fileUpload(request,FileUploadUtil.PATH_FLAG_IMAGE);
			
			for(Map<String, Object> map : list) {
			fileName =(String)map.get("fileName");
			}
		//파일정보 셋팅
			employeeVo.setEmpFace(fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int cnt = employeeService.updateEmp(employeeVo);
		String msg="", url="/admin/employee/employeeEdit";
		if(cnt>0) {
			msg="수정에 성공하셨습니다.";
			url="/admin/employee/employeeDetail.do?empNo="+employeeVo.getEmpNo();
		}else {
			msg="수정에 실패하셨습니다!!";
		}
		
		
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}*/

	//퇴사처리 outdate 찍기
	@RequestMapping("/employeeDel.do")
	public void employeeDel(@RequestParam String empNo, Model model, HttpServletResponse response) throws IOException {
	logger.info("퇴사일 찍기 empNo={}", empNo);

	int cnt = employeeService.delConfirm(empNo);
	if(cnt>0) {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('삭제완료.');");
		out.print("self.close();");
		out.print("</script>");
		
		return ;
	}else {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('삭제 실패.');");
		out.print("history.back();");
		out.print("</script>");
		
		return ;
	}

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
	public @ResponseBody String employeeApp(@ModelAttribute EmployeeVO employeeVo) {
	logger.info("입사일 찍기 employeeVo={}", employeeVo);

	int cnt = employeeService.appConfirm(employeeVo); 
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
