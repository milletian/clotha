package com.clotha.ca.warehouse.model;

import com.clotha.ca.common.SearchVO;

public class WarehouseVO extends SearchVO {
	private String whCode;
	private String whName;
	private String whAddress;
	private String whImage;
	private String whRegdate;
	private String staCode;
	private String whZipcode;
	private String whDel;
	public String getWhCode() {
		return whCode;
	}
	public void setWhCode(String whCode) {
		this.whCode = whCode;
	}
	public String getWhName() {
		return whName;
	}
	public void setWhName(String whName) {
		this.whName = whName;
	}
	public String getWhAddress() {
		return whAddress;
	}
	public void setWhAddress(String whAddress) {
		this.whAddress = whAddress;
	}
	public String getWhImage() {
		return whImage;
	}
	public void setWhImage(String whImage) {
		this.whImage = whImage;
	}
	public String getWhRegdate() {
		return whRegdate;
	}
	public void setWhRegdate(String whRegdate) {
		this.whRegdate = whRegdate;
	}
	public String getStaCode() {
		return staCode;
	}
	public void setStaCode(String staCode) {
		this.staCode = staCode;
	}
	public String getWhZipcode() {
		return whZipcode;
	}
	public void setWhZipcode(String whZipcode) {
		this.whZipcode = whZipcode;
	}
	
	public String getWhDel() {
		return whDel;
	}
	public void setWhDel(String whDel) {
		this.whDel = whDel;
	}
	@Override
	public String toString() {
		return "WarehouseVO [whCode=" + whCode + ", whName=" + whName + ", whAddress=" + whAddress + ", whImage="
				+ whImage + ", whRegdate=" + whRegdate + ", staCode=" + staCode + ", whZipcode=" + whZipcode + whDel+"]";
	}
	
	
}
