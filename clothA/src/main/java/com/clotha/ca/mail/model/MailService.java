package com.clotha.ca.mail.model;

import java.util.List;

public interface MailService {
	public int insertMail(MailVO vo);	//mail
	public List<MailVO> selectGetMail(String empNo);	//getmail
	public MailVO selectDetail(MailVO mailVo);	//mailDetail
	
}
