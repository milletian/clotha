package com.clotha.ca.sales.model;

import java.sql.Timestamp;

public class SalesVO {
	private String salesCode;
	private String storeCode;
	private String pdCode;
	private int salesQty;
	private int salesTotal;
	private Timestamp salesDate;
	private String storeName;
	
	
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getSalesCode() {
		return salesCode;
	}
	public void setSalesCode(String salesCode) {
		this.salesCode = salesCode;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public int getSalesQty() {
		return salesQty;
	}
	public void setSalesQty(int salesQty) {
		this.salesQty = salesQty;
	}
	public int getSalesTotal() {
		return salesTotal;
	}
	public void setSalesTotal(int salesTotal) {
		this.salesTotal = salesTotal;
	}
	public Timestamp getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(Timestamp salesDate) {
		this.salesDate = salesDate;
	}
	@Override
	public String toString() {
		return "SalesVO [salesCode=" + salesCode + ", storeCode=" + storeCode + ", pdCode=" + pdCode + ", salesQty="
				+ salesQty + ", salesTotal=" + salesTotal + ", salesDate=" + salesDate + ", storeName=" + storeName
				+ "]";
	}

	
}
