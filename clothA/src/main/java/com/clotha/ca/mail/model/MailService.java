package com.clotha.ca.mail.model;

import java.util.List;
import java.util.Map;

public interface MailService {
	public int insertMail(MailVO vo);	//mail
	public List<MailVO> selectGetMail(String empNo);	//getmail
	public MailVO selectDetail(MailVO mailVo);	//mailDetail
	public int deleteMail(MailVO vo);	//mailDelete
	public List<MailVO> selectSender(String empNo);	//sendMail
	public MailVO sendMailDetail(int mailNo);	//sendMailDetail
	public List<MailVO> sendEmpNO(int mailNo);	//sendMailEmpNo
	public int sendDelete(int mailNo);	//sendDelete
	public int sendMulti(Map<String, String[]> map);	//sendMulti
	public int getMulti(Map<String, Object> map);	//getMulti
	public List<MailVO> sendSave(String sender);	//sendSave
	public List<MailVO> getSave(String empNo);	//getSave
	public int getSaveUp(Map<String, Object> map);	//getSaveUp
	public int sendSaveUp(Map<String, Object> map);	//sendSaveUp
	
}
