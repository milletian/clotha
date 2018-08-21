package com.clotha.ca.store.model;

import com.clotha.ca.common.SearchVO;

public class StoreVO extends SearchVO {
	private String storeCode;
	private String empNo;
	private String storeName;
	private String storeZipcode;
	private String storeAddress;
	private String storeJoin;
	private String storeImage;
	private String staCode;
	private String storeDel;
	private String storeTel;
	private String storeNo;
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
		return storeImage;
	}
	public void setStoreImage(String storeImage) {
		this.storeImage = storeImage;
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
	
	public String getStoreTel() {
		return storeTel;
	}
	public void setStoreTel(String storeTel) {
		this.storeTel = storeTel;
	}
	public String getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(String storeNo) {
		this.storeNo = storeNo;
	}
	
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	@Override
	public String toString() {
		return "StoreVO [storeCode=" + storeCode + ", empNo=" + empNo + ", storeName=" + storeName + ", storeZipcode="
				+ storeZipcode + ", storeAddress=" + storeAddress + ", storeJoin=" + storeJoin + ", storeImage="
				+ storeImage + ", staCode=" + staCode + ", storeDel=" + storeDel + ", storeTel=" + storeTel
				+ ", storeNo=" + storeNo + "]";
	}

	
	
	
	
}
