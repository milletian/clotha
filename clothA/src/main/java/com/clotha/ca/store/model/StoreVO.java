package com.clotha.ca.store.model;

public class StoreVO {
	private String storeCode;
	private String empNo;
	private String storeZipcode;
	private String storeAddress;
	private String storeJoin;
	private String StoreImage;
	private String staCode;
	private String storeDel;
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getStoreZipcode() {
		return storeZipcode;
	}
	public void setStoreZipcode(String storeZipcode) {
		this.storeZipcode = storeZipcode;
	}
	public String getStoreAddress() {
		return storeAddress;
	}
	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}
	public String getStoreJoin() {
		return storeJoin;
	}
	public void setStoreJoin(String storeJoin) {
		this.storeJoin = storeJoin;
	}
	public String getStoreImage() {
		return StoreImage;
	}
	public void setStoreImage(String storeImage) {
		StoreImage = storeImage;
	}
	public String getStaCode() {
		return staCode;
	}
	public void setStaCode(String staCode) {
		this.staCode = staCode;
	}
	public String getStoreDel() {
		return storeDel;
	}
	public void setStoreDel(String storeDel) {
		this.storeDel = storeDel;
	}
	@Override
	public String toString() {
		return "StoreVO [storeCode=" + storeCode + ", empNo=" + empNo + ", storeZipcode=" + storeZipcode
				+ ", storeAddress=" + storeAddress + ", storeJoin=" + storeJoin + ", StoreImage=" + StoreImage
				+ ", staCode=" + staCode + ", storeDel=" + storeDel + "]";
	}
	
	
	
}
