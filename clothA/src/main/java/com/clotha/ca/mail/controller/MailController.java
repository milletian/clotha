package com.clotha.ca.mail.controller;

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
	public String getMail_get(HttpServletRequest request, Model model) {
		logger.info("받은쪽지");
		String empNo = (String) request.getSession().getAttribute("empNo");
		
		List<MailVO> list = mailService.selectGetMail(empNo);
		logger.info("list.size={}",list.size());
		for(MailVO vo : list) {
			System.out.println(vo);
		}
		
		model.addAttribute("list",list);
		
		return "mail/getMail";
	}
	
	@RequestMapping(value="/mailDetail.do")
	public String mailDetail(@RequestParam int mailNo,Model model,HttpServletRequest request) {
		logger.info("쪽지 상세보기 , mailNo = {}",mailNo);
		String empNo= (String) request.getSession().getAttribute("empNo");
		MailVO vo = new MailVO();
		vo.setMailNo(mailNo);
		vo.setEmpNo(empNo);
		vo  = mailService.selectDetail(vo);
		logger.info("상세보기 vo={}",vo);
		
		model.addAttribute("vo",vo);
		
		return "mail/mailDetail";
	}
	
	@RequestMapping("/mailDelete.do")
	public String mailDelete(@RequestParam int mailNo, HttpServletRequest request, Model model ) {
		logger.info("쪽지 삭제 화면 , mailNo={}",mailNo);
		String empNo = (String) request.getSession().getAttribute("empNo");
		MailVO vo = new MailVO();
		vo.setEmpNo(empNo);
		vo.setMailNo(mailNo);
		
		int cnt = mailService.deleteMail(vo); 
		String msg = "삭제 실패하였습니다." , url = "/mail/mailDetail.do?mailNo="+mailNo;
		if(cnt >0 ) {
			url="/mail/getMail.do?empNo="+empNo;
			msg="";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/sendMail.do")
	public String sendMail( HttpServletRequest request, Model model ) {
		logger.info("보낸 쪽지");
		String empNo = (String) request.getSession().getAttribute("empNo");
		
		List<MailVO> list = mailService.selectSender(empNo);
		logger.info("selectSender 결과 list.size = {}" , list.size());
		
		model.addAttribute("list",list);
		
		return "mail/sendMail";
	}
	
	@RequestMapping("/sendDetail.do")
	public String sendDetail(@RequestParam int mailNo,Model model) {
		logger.info("보낸쪽지 상세보기 mailNo={} ",mailNo);
		
		MailVO vo = mailService.sendMailDetail(mailNo);
		logger.info("보낸쪽지 vo ={}",vo);
		List<MailVO> list = mailService.sendEmpNO(mailNo);
		logger.info("보낸쪽지 list . size = {} ", list.size());
		
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		
		return "mail/sendDetail";
	}
	
	@RequestMapping("sendDelete.do")
	public String sendDelete(@RequestParam int mailNo, Model model, HttpServletRequest request) {
		logger.info("보낸쪽지 삭제하기 mailNo = {}",mailNo);
		String empNo = (String) request.getSession().getAttribute("empNo");
		
		int cnt = mailService.sendDelete(mailNo);
		String msg="삭제 실패하였습니다.",url="/mail/sendDetail.do?mailNo="+mailNo;
		
		if(cnt>0) {
			msg="";
			url="/mail/sendMail.do?empNo="+empNo;
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		
		return "common/message";
		
	}
	
	@RequestMapping("/sendMulti.do")
	public String sendMulti(@RequestParam String[] chk, Model model) {
		logger.info("보낸 쪽지 다중삭제 chk = {} ", chk);
		
		if(chk!=null) {
			int i=0;
			for(String no : chk) {
				logger.info("{} : 파라미터 => {}", i++, no);
			}
		}//if
		
		Map<String, String[]> map = new HashMap<>();
		map.put("nos", chk);
		int cnt = mailService.sendMulti(map);
		logger.info("보낸쪽지 다중삭제 결과 cnt = {} ",cnt);
		String msg="삭제 실패하였습니다.", url ="/mail/sendMail.do";
		if(cnt>0) {
			msg="삭제되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/getMulti.do")
	public String getMulti(@RequestParam String[] chk, Model model,HttpServletRequest request) {
		logger.info("받은 쪽지 다중삭제 chk = {} ",chk);
		String empNo = (String) request.getSession().getAttribute("empNo");
		if(chk!=null) {
			int i=0;
			for(String no : chk) {
				logger.info("{} : 파라미터 => {}", i++, no);
			}
		}//if
		
		Map<String, Object> map = new HashMap<>();
		map.put("nos", chk);
		map.put("empNo", empNo);
		
		int cnt = mailService.getMulti(map);
		logger.info("받은쪽지 삭제 결과 cnt = {} ",cnt);
		
		String msg = "삭제에 실패 하였습니다." , url = "/mail/getMail.do";
		if(cnt > 0 ) {
			msg="받은쪽지가 삭제 되었습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return"common/message";
	}
	
	

}




















