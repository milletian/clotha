package com.clotha.ca.mail.model;

import java.util.List;

public interface MailDAO {
	public int insertMail(MailVO vo);	//mail
	public int insertGet(MailVO mailvo);	//mail
	public List<MailVO> selectGetMail(String empNo);	//getmail
	public MailVO selectDetail(MailVO mailVo);	//mailDetail
	public int mailRead(MailVO vo);	//mailUpdateRead

}
