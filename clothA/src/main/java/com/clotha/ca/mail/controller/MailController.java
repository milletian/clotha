package com.clotha.ca.mail.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.clotha.ca.common.FileUploadUtil;
import com.clotha.ca.employee.model.EmployeeService;
import com.clotha.ca.employee.model.EmployeeVO;
import com.clotha.ca.mail.model.MailService;
import com.clotha.ca.mail.model.MailVO;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	private static Logger logger = LoggerFactory.getLogger(MailController.class);
	
	@Autowired
	private MailService mailService;
	@Autowired
	private FileUploadUtil fileUploadUtil;
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/mail.do")
	public String mail() {
		logger.info("mail화면 보여주기");
		
		
		return "mail/mail";
	}
	
	@RequestMapping(value="/mailWrite.do",method=RequestMethod.GET)
	public String mailWrite() {
		logger.info("쪽지쓰기 화면");
		
		return "mail/mailWrite";
	}
	
	
	@RequestMapping("/ajaxmailWrite.do")
	@ResponseBody
	public List<EmployeeVO> mailEmpno(@ModelAttribute EmployeeVO employeeVo) {
		logger.info("employeeVo={}",employeeVo);
		List<EmployeeVO> list = employeeService.selectAll(employeeVo);
		logger.info("검색결과 employeevo={}",employeeVo);
		return list;
	}
	
	@RequestMapping(value="/mailWrite.do",method=RequestMethod.POST)
	public String mailWrite_post(@ModelAttribute MailVO vo, Model model, HttpServletRequest request, @RequestParam String empNo) {
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest) request;
		logger.info("쪽지쓰기 처리 파라미터 vo={}, 받는이 empNo={}",vo,empNo);
		String sendEmpNo = (String)request.getSession().getAttribute("empNo");
		vo.setSender(sendEmpNo);
		
		String msg="", url="/mail/mailWrite.do";
		
		String result = "";
		String path = fileUploadUtil.getUploadPath(request, fileUploadUtil.PATH_FLAG_MAILFILES);
		result = fileUploadUtil.multifileup(multi, path);
		logger.info("{}",result);
		vo.setMailFile(result); // 업로드 메서드 결과로 나온 이미지 파일들 이름 을 세팅
		/*String fileName="";
		try {
			List<Map<String, Object>> list
			=fileUploadUtil.fileUpload(request, FileUploadUtil.PATH_FLAG_IMAGE);
			for(Map<String, Object> map:list) {
				fileName =(String) map.get("fileName");				
			}
			vo.setMailFile(fileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		vo.setEmpNo(empNo);
		int cnt = mailService.insertMail(vo);
		
		if(cnt>0) {
			
			msg="쪽지를 보냈습니다.";
		}else {
			msg="쪽지쓰기를 실패하였습니다.\n 다시시도해 주세요";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		
		return "common/message";
	}
	
	@RequestMapping(value="/getMail.do",method=RequestMethod.GET )
	public String getMail_get() {
		logger.info("받은쪽지");
		
		return "mail/getMail";
	}

}








