package com.clotha.ca.stockarea.model;

public class StockAreaVO {
	private String staCode;
	private String areaCode;
	public String getStaCode() {
		return staCode;
	}
	public void setStaCode(String staCode) {
		this.staCode = staCode;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	@Override
	public String toString() {
		return "StockAreaVO [staCode=" + staCode + ", areaCode=" + areaCode + "]";
	}
	
	
	
	
	
}
