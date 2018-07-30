package com.clotha.ca.inout.model;

import com.clotha.ca.common.DateSearchVO;

public class InoutVO extends DateSearchVO{
	private String isIn;
	private String inoutCode;
	private String inoutStartdate;
	private String inoutEnddate;
	private String whName;
	private String whCode;
	private String storeName;
	private String storeCode;
	private String accCode;
	private String accName;
	private String pdCode;
	private String pdName;
	private String colorCode;
	private String colorName;
	private String inoutDetailQTY;
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
	public String getWhName() {
		return whName;
	}
	public void setWhName(String whName) {
		this.whName = whName;
	}
	public String getWhCode() {
		return whCode;
	}
	public void setWhCode(String whCode) {
		this.whCode = whCode;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getAccCode() {
		return accCode;
	}
	public void setAccCode(String accCode) {
		this.accCode = accCode;
	}
	public String getAccName() {
		return accName;
	}
	public void setAccName(String accName) {
		this.accName = accName;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getColorCode() {
		return colorCode;
	}
	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	public String getColorName() {
		return colorName;
	}
	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
	public String getInoutDetailQTY() {
		return inoutDetailQTY;
	}
	public void setInoutDetailQTY(String inoutDetailQTY) {
		this.inoutDetailQTY = inoutDetailQTY;
	}
	@Override
	public String toString() {
		return "InoutVO [isIn=" + isIn + ", inoutCode=" + inoutCode + ", inoutStartdate=" + inoutStartdate
				+ ", inoutEnddate=" + inoutEnddate + ", whName=" + whName + ", whCode=" + whCode + ", storeName="
				+ storeName + ", storeCode=" + storeCode + ", accCode=" + accCode + ", accName=" + accName + ", pdCode="
				+ pdCode + ", pdName=" + pdName + ", colorCode=" + colorCode + ", colorName=" + colorName
				+ ", inoutDetailQTY=" + inoutDetailQTY + "]";
	}
	
	
	
}
