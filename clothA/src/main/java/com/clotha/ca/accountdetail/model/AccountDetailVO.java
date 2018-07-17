package com.clotha.ca.accountdetail.model;

import java.sql.Timestamp;

public class AccountDetailVO {
	private String accDtCode;
	private String accCode;
	private Timestamp accDtRegdate;
	private String pdCode;
	private int accDtQty;
	private Timestamp accDtIndate;
	private String whCode;
	
	public String getAccDtCode() {
		return accDtCode;
	}
	public void setAccDtCode(String accDtCode) {
		this.accDtCode = accDtCode;
	}
	public String getAccCode() {
		return accCode;
	}
	public void setAccCode(String accCode) {
		this.accCode = accCode;
	}
	public Timestamp getAccDtRegdate() {
		return accDtRegdate;
	}
	public void setAccDtRegdate(Timestamp accDtRegdate) {
		this.accDtRegdate = accDtRegdate;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public int getAccDtQty() {
		return accDtQty;
	}
	public void setAccDtQty(int accDtQty) {
		this.accDtQty = accDtQty;
	}
	public Timestamp getAccDtIndate() {
		return accDtIndate;
	}
	public void setAccDtIndate(Timestamp accDtIndate) {
		this.accDtIndate = accDtIndate;
	}
	public String getWhCode() {
		return whCode;
	}
	public void setWhCode(String whCode) {
		this.whCode = whCode;
	}
	@Override
	public String toString() {
		return "AccountDetailVO [accDtCode=" + accDtCode + ", accCode=" + accCode + ", accDtRegdate=" + accDtRegdate
				+ ", pdCode=" + pdCode + ", accDtQty=" + accDtQty + ", accDtIndate=" + accDtIndate + ", whCode="
				+ whCode + "]";
	}
	
	
}
