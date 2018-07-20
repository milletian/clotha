package com.clotha.ca.area.model;

public class AreaVO {
	private String areaCode;
	private String areaName;
	private String empNo;
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "AreaVO [areaCode=" + areaCode + ", areaName=" + areaName + ", empNo=" + empNo + "]";
	}
	
	
}
