package com.clotha.ca.stock.model;

public class StockVO {
	private int stockPk;
	private String staCode;
	private String pdCode;
	private int stockQty;
	
	public int getStockPk() {
		return stockPk;
	}
	public void setStockPk(int stockPk) {
		this.stockPk = stockPk;
	}
	public String getStaCode() {
		return staCode;
	}
	public void setStaCode(String staCode) {
		this.staCode = staCode;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public int getStockQty() {
		return stockQty;
	}
	public void setStockQty(int stockQty) {
		this.stockQty = stockQty;
	}
	@Override
	public String toString() {
		return "StockVO [stockPk=" + stockPk + ", staCode=" + staCode + ", pdCode=" + pdCode + ", stockQty=" + stockQty
				+ "]";
	}
	
	
}
