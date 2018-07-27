package com.clotha.ca.mail.model;

import java.sql.Timestamp;

public class MailVO {
	private int mailNo;
	private String sender;
	private String mailContent;
	private String mailFile;
	private String mailSave;
	private String mailSenderDel;
	private Timestamp mailSdate;
	private String mailName;
	
	
	public String getMailName() {
		return mailName;
	}
	public void setMailName(String mailName) {
		this.mailName = mailName;
	}
	public int getMailNo() {
		return mailNo;
	}
	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	public String getMailFile() {
		return mailFile;
	}
	public void setMailFile(String mailFile) {
		this.mailFile = mailFile;
	}
	public String getMailSave() {
		return mailSave;
	}
	public void setMailSave(String mailSave) {
		this.mailSave = mailSave;
	}
	public String getMailSenderDel() {
		return mailSenderDel;
	}
	public void setMailSenderDel(String mailSenderDel) {
		this.mailSenderDel = mailSenderDel;
	}
	public Timestamp getMailSdate() {
		return mailSdate;
	}
	public void setMailSdate(Timestamp mailSdate) {
		this.mailSdate = mailSdate;
	}
	@Override
	public String toString() {
		return "MailVO [mailNo=" + mailNo + ", sender=" + sender + ", mailContent=" + mailContent + ", mailFile="
				+ mailFile + ", mailSave=" + mailSave + ", mailSenderDel=" + mailSenderDel + ", mailSdate=" + mailSdate
				+ ", mailName=" + mailName + "]";
	}

	
	
}
