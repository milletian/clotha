package com.clotha.ca.sales.model;

public class SalesVO {
	private String salesCode;
	private String storeCode;
	private String pdCode;
	private int salesQty;
	private int salesTotal;
	private String salesDate;
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

	public String getSalesDate() {
		return salesDate;
	}
	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}
	@Override
	public String toString() {
		return "SalesVO [salesCode=" + salesCode + ", storeCode=" + storeCode + ", pdCode=" + pdCode + ", salesQty="
				+ salesQty + ", salesTotal=" + salesTotal + ", salesDate=" + salesDate + ", storeName=" + storeName
				+ "]";
	}

	
}
