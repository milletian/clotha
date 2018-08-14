package com.clotha.ca.transport.model;

import com.clotha.ca.common.DateSearchVO;

public class TransportVO extends DateSearchVO {
	private String tpCode; 
	private String storeCode; // 요청받은 스토어 코드
	private String userStoreCode; // 로그인한 스토어 코드 
	private String tpRegdate; // 신청일
	private String tpIsagree; // 승낙여부 
	private String storeCode2; // 요청한 스토어 코드
	public String getTpCode() {
		return tpCode;
	}
	public void setTpCode(String tpCode) {
		this.tpCode = tpCode;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getTpRegdate() {
		return tpRegdate;
	}
	public void setTpRegdate(String tpRegdate) {
		this.tpRegdate = tpRegdate;
	}
	public String getTpIsagree() {
		return tpIsagree;
	}
	public void setTpIsagree(String tpIsagree) {
		this.tpIsagree = tpIsagree;
	}
	public String getStoreCode2() {
		return storeCode2;
	}
	public void setStoreCode2(String storeCode2) {
		this.storeCode2 = storeCode2;
	}
	
	public String getUserStoreCode() {
		return userStoreCode;
	}
	public void setUserStoreCode(String userStoreCode) {
		this.userStoreCode = userStoreCode;
	}
	@Override
	public String toString() {
		return "TransportVO [user = "+userStoreCode+"tpCode=" + tpCode + ", storeCode=" + storeCode + ", tpRegdate=" + tpRegdate
				+ ", tpIsagree=" + tpIsagree + ", storeCode2=" + storeCode2 + ", getTpCode()=" + getTpCode()
				+ ", getStoreCode()=" + getStoreCode() + ", getTpRegdate()=" + getTpRegdate() + ", getTpIsagree()="
				+ getTpIsagree() + ", getStoreCode2()=" + getStoreCode2() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
