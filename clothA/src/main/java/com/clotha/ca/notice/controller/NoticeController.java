package com.clotha.ca.notice.controller;

import java.util.List;

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

import com.clotha.ca.employee.model.EmployeeService;
import com.clotha.ca.employee.model.EmployeeVO;
import com.clotha.ca.notice.model.NoticeService;
import com.clotha.ca.notice.model.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/notice.do")
	public String notice(Model model) {
		logger.info("공지사항 보여주기");
		
		NoticeVO noticeVO = new NoticeVO();
		List<NoticeVO> list = noticeService.selectNoticeAll(noticeVO);
		
		model.addAttribute("list",list);
		
		return "notice/notice";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public String noticeWrite_get() {
		logger.info("공지사항 작성 페이지 보여주기");
		
		
		return "notice/noticeWrite";
	}
	
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST )
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo, Model model, HttpServletRequest request ) {
		logger.info("공지사항 작성 페이지보여주기 파라미터 noticeVo={}",noticeVo);
		String empNo = (String) request.getSession().getAttribute("empNo");
		noticeVo.setEmpNo(empNo);
		int cnt = noticeService.noticeInsert(noticeVo);
		String msg="", url="/notice/notice.do";
		if(cnt==1) {
			msg="공지사항 등록 완료";
		}else {
			url="/notice/noticeWrite.do";
			msg="공지사항 등록 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/noticeDetail.do")
	public String noticeDetail(@RequestParam int noticeNo , Model model ) {
		logger.info("공지사항 세부정보 파라미터 noticeNo = {} " , noticeNo);
		
		NoticeVO vo = noticeService.selectNotice(noticeNo);
		logger.info("선택한 공지사항 보기 Vo = {}",vo);
		EmployeeVO employeeVo = employeeService.selectEmployee(vo.getEmpNo());
		vo.setEmpName(employeeVo.getEmpName());
		
		model.addAttribute("vo",vo);
		
		return "notice/noticeDetail";
	}
	
	@RequestMapping(value="/noticeDelete.do")
	public String noticeDelete(@RequestParam int noticeNo, Model model) {
		logger.info("공지사항 삭제하기 파라미터 , noticeNo={}",noticeNo);
		
		String msg="", url="/notice/notice.do";
		int cnt = noticeService.deleteNotice(noticeNo);
		if(cnt==1) {
			msg="삭제되었습니다.";
		}else {
			msg="삭제 실패하였습니다.";
			url="/notice/noticeDetail.do?noticeNo="+noticeNo;
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/noticeEdit.do", method=RequestMethod.GET)
	public String noticeEdit_get(@RequestParam int noticeNo, Model model) {
		logger.info("공지사항 수정화면 , 파라미터 noticeNo={}",noticeNo);
		
		NoticeVO vo = noticeService.selectNotice(noticeNo);
		model.addAttribute("vo",vo);
		return "/notice/noticeEdit";
	}
	
	@RequestMapping(value="/noticeEdit.do", method=RequestMethod.POST )
	public String noticeEdit_post(@ModelAttribute NoticeVO vo, Model model ) {
		logger.info("공지사항 수정 처리화면, vo = {} " ,vo);
		
		int cnt = noticeService.noticeEdit(vo);
		String msg="",url="/notice/noticeDetail.do?noticeNo="+vo.getNoticeNo();
		if( cnt == 1 ) {
			msg="수정처리 완료";
		}else {
			msg="수정처리 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
}
















