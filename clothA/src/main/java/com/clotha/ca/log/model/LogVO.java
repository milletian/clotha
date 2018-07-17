package com.clotha.ca.log.model;

import java.sql.Timestamp;

public class LogVO {
	private int logPk;
	private String empNo;
	private String logIp;
	private Timestamp logIn;
	private Timestamp logOut;
	public int getLogPk() {
		return logPk;
	}
	public void setLogPk(int logPk) {
		this.logPk = logPk;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getLogIp() {
		return logIp;
	}
	public void setLogIp(String logIp) {
		this.logIp = logIp;
	}
	public Timestamp getLogIn() {
		return logIn;
	}
	public void setLogIn(Timestamp logIn) {
		this.logIn = logIn;
	}
	public Timestamp getLogOut() {
		return logOut;
	}
	public void setLogOut(Timestamp logOut) {
		this.logOut = logOut;
	}
	@Override
	public String toString() {
		return "LogVO [logPk=" + logPk + ", empNo=" + empNo + ", logIp=" + logIp + ", logIn=" + logIn + ", logOut="
				+ logOut + "]";
	}
	
}
