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
	private String empNo;
	private int getMailPk;
	private String getMailSave;
	private String getMailDel;
	private String getMailRead;
	private String empName;
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public int getGetMailPk() {
		return getMailPk;
	}
	public void setGetMailPk(int getMailPk) {
		this.getMailPk = getMailPk;
	}
	public String getGetMailSave() {
		return getMailSave;
	}
	public void setGetMailSave(String getMailSave) {
		this.getMailSave = getMailSave;
	}
	public String getGetMailDel() {
		return getMailDel;
	}
	public void setGetMailDel(String getMailDel) {
		this.getMailDel = getMailDel;
	}
	public String getGetMailRead() {
		return getMailRead;
	}
	public void setGetMailRead(String getMailRead) {
		this.getMailRead = getMailRead;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
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
				+ ", mailName=" + mailName + ", empNo=" + empNo + ", getMailPk=" + getMailPk + ", getMailSave="
				+ getMailSave + ", getMailDel=" + getMailDel + ", getMailRead=" + getMailRead + ", empName=" + empName
				+ "]";
	}
	
}
