package com.clotha.ca.account.controller;

import java.util.List;

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

import com.clotha.ca.account.model.AccountService;
import com.clotha.ca.account.model.AccountVO;
import com.clotha.ca.accountdetail.model.AccountDetailService;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private AccountService accountService;
	@Autowired
	private AccountDetailService accountDetailService;
	
	// 구매처 등록화면으로 가게하는 매퍼
	// 파라미터로 구매처 코드가 오게될시 코드로 구매처 정보를 조회한후 화면에 뿌리기 위해 
	@RequestMapping(value="/accountWrite.do", method=RequestMethod.GET)
	public String accountWrite_get(@RequestParam(required=false) String accCode,Model model) {
		if(accCode!=null&&!accCode.isEmpty()) {
			AccountVO accVo = accountService.SearchAccountByCode(accCode);
			model.addAttribute("accVo", accVo);
		}
		return "admin/account/accountWrite";
	}
	
	@RequestMapping(value="/ajaxAccountOne.do")
	@ResponseBody
	public AccountVO ajaxAccountOne(@RequestParam(required=false) String accCode) {
		AccountVO accountVO = accountService.SearchAccountByCode(accCode);
		return accountVO;
	}
	
	@RequestMapping(value="/ajaxAccountWrite.do",produces = "application/text; charset=utf8")
	public @ResponseBody String accountWrite_post(@RequestParam String address,@RequestParam String addressDetail,@ModelAttribute AccountVO accVo) {
		logger.info("vo={},address={}",accVo,address);
		logger.info("detail={}",addressDetail);
		if(accVo.getAccIsdeal()!=null&&!accVo.getAccIsdeal().isEmpty()) {
			accVo.setAccIsdeal("Y");
		}else {
			accVo.setAccIsdeal("N");
		}
		accVo.setAccAddress(address+"~"+addressDetail);
		accountService.insertAccount(accVo);
		
		return "수정완료!";
	}
	
	@RequestMapping(value="/accountList.do", method=RequestMethod.GET)
	public String accountList_get() {
		return "admin/account/accountList";
	}
	
	@RequestMapping(value="/ajaxAccountList.do")
	@ResponseBody
	public List<AccountVO> accountList_post(@ModelAttribute AccountVO vo) {
		logger.info("{}",vo);
		List<AccountVO> list = accountService.accountList(vo);
		logger.info("{}",list.size());
		return list;
	}
	
	@RequestMapping(value="/accountDel.do", produces = "application/text; charset=utf8")
	public @ResponseBody String accountDel(@RequestParam String accCode) {
		int count = accountDetailService.selectCountByAccCode(accCode);
		if(count!=0) {
			return "거래이력이 있는 거래처는 삭제가 불가능 합니다.";
		}else {
			accountService.deleteAccount(accCode);
			return "거래처가 삭제되었습니다.";
		}
	}
}
