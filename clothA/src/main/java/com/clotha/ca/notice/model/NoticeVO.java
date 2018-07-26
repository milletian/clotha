package com.clotha.ca.notice.model;

public class NoticeVO {
	
	private int noticeNo;
	private String noticeTitle;
	private String empNo;
	private String noticeContent;
	private int noticeRead;
	private String empName;
	
	
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public int getNoticeRead() {
		return noticeRead;
	}
	public void setNoticeRead(int noticeRead) {
		this.noticeRead = noticeRead;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", empNo=" + empNo
				+ ", noticeContent=" + noticeContent + ", noticeRead=" + noticeRead + ", empName=" + empName + "]";
	}

	
	
}
