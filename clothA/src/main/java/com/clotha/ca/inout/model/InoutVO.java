package com.clotha.ca.inout.model;

import com.clotha.ca.common.DateSearchVO;

public class InoutVO extends DateSearchVO{
	private String isIn;
	private String inoutCode;
	private String inoutStartdate;
	private String inoutEnddate;
	private String areaStart;
	private String areaEnd;
	private int inoutDetailQTY;
	private String inoutStatus;
	private String outDetail="";
	private String pdCode;
	public String getIsIn() {
		return isIn;
	}
	public void setIsIn(String isIn) {
		this.isIn = isIn;
	}
	public String getInoutCode() {
		return inoutCode;
	}
	public void setInoutCode(String inoutCode) {
		this.inoutCode = inoutCode;
	}
	public String getInoutStartdate() {
		return inoutStartdate;
	}
	public void setInoutStartdate(String inoutStartdate) {
		this.inoutStartdate = inoutStartdate;
	}
	public String getInoutEnddate() {
		return inoutEnddate;
	}
	public void setInoutEnddate(String inoutEnddate) {
		this.inoutEnddate = inoutEnddate;
	}
	public String getAreaStart() {
		return areaStart;
	}
	public void setAreaStart(String areaStart) {
		this.areaStart = areaStart;
	}
	public String getAreaEnd() {
		return areaEnd;
	}
	public void setAreaEnd(String areaEnd) {
		this.areaEnd = areaEnd;
	}
	public int getInoutDetailQTY() {
		return inoutDetailQTY;
	}
	public void setInoutDetailQTY(int inoutDetailQTY) {
		this.inoutDetailQTY = inoutDetailQTY;
	}
	public String getInoutStatus() {
		return inoutStatus;
	}
	public void setInoutStatus(String inoutStatus) {
		this.inoutStatus = inoutStatus;
	}
	public String getOutDetail() {
		return outDetail;
	}
	public void setOutDetail(String outDetail) {
		this.outDetail = outDetail;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	@Override
	public String toString() {
		return "InoutVO [isIn=" + isIn + ", inoutCode=" + inoutCode + ", inoutStartdate=" + inoutStartdate
				+ ", inoutEnddate=" + inoutEnddate + ", areaStart=" + areaStart + ", areaEnd=" + areaEnd
				+ ", inoutDetailQTY=" + inoutDetailQTY + ", inoutStatus=" + inoutStatus + ", outDetail=" + outDetail
				+ ", pdCode=" + pdCode + "]";
	}
	
	
	
}
