package com.clotha.ca.transport.model;

public class TransportDetailVO {
	private int tpDetailPk;
	private String tpCode;
	private String pdCode;
	private String quantity;
	public int getTpDetailPk() {
		return tpDetailPk;
	}
	public void setTpDetailPk(int tpDetailPk) {
		this.tpDetailPk = tpDetailPk;
	}
	public String getTpCode() {
		return tpCode;
	}
	public void setTpCode(String tpCode) {
		this.tpCode = tpCode;
	}
	public String getPdCode() {
		return pdCode;
	}
	public void setPdCode(String pdCode) {
		this.pdCode = pdCode;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "TransportDetailVO [tpDetailPk=" + tpDetailPk + ", tpCode=" + tpCode + ", pdCode=" + pdCode
				+ ", quantity=" + quantity + "]";
	}
	
	
}
