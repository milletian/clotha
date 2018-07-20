package com.clotha.ca.product.model;

import com.clotha.ca.common.DateSearchVO;

public class ProductsVO extends DateSearchVO{
	private String accName;
	private String pdCode;
	private String pdName;
	private int pdOriginalPrice;
	private int pdSellPrice;
	private String pdRegdate;
	private String pdExplanation;
	private String pdWarning;
	private String pdImage;
	private String styleCode;
	private String colorCode;
	private String seasonCode;
	private String sizeCode;
	private String accCode;
	private String genderCode;
	
	
	
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
	public int getPdOriginalPrice() {
		return pdOriginalPrice;
	}
	public void setPdOriginalPrice(int pdOriginalPrice) {
		this.pdOriginalPrice = pdOriginalPrice;
	}
	public int getPdSellPrice() {
		return pdSellPrice;
	}
	public void setPdSellPrice(int pdSellPrice) {
		this.pdSellPrice = pdSellPrice;
	}
	public String getPdRegdate() {
		return pdRegdate;
	}
	public void setPdRegdate(String pdRegdate) {
		this.pdRegdate = pdRegdate;
	}
	public String getPdExplanation() {
		return pdExplanation;
	}
	public void setPdExplanation(String pdExplanation) {
		this.pdExplanation = pdExplanation;
	}
	public String getPdWarning() {
		return pdWarning;
	}
	public void setPdWarning(String pdWarning) {
		this.pdWarning = pdWarning;
	}
	public String getPdImage() {
		return pdImage;
	}
	public void setPdImage(String pdImage) {
		this.pdImage = pdImage;
	}
	public String getStyleCode() {
		return styleCode;
	}
	public void setStyleCode(String styleCode) {
		this.styleCode = styleCode;
	}
	public String getColorCode() {
		return colorCode;
	}
	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	public String getSeasonCode() {
		return seasonCode;
	}
	public void setSeasonCode(String seasonCode) {
		this.seasonCode = seasonCode;
	}
	public String getSizeCode() {
		return sizeCode;
	}
	public void setSizeCode(String sizeCode) {
		this.sizeCode = sizeCode;
	}
	public String getAccCode() {
		return accCode;
	}
	public void setAccCode(String accCode) {
		this.accCode = accCode;
	}
	public String getGenderCode() {
		return genderCode;
	}
	public void setGenderCode(String genderCode) {
		this.genderCode = genderCode;
	}
	
	@Override
	public String toString() {
		return "ProductsVO [accName=" + accName + ", pdCode=" + pdCode + ", pdName=" + pdName + ", pdOriginalPrice="
				+ pdOriginalPrice + ", pdSellPrice=" + pdSellPrice + ", pdRegdate=" + pdRegdate + ", pdExplanation="
				+ pdExplanation + ", pdWarning=" + pdWarning + ", pdImage=" + pdImage + ", styleCode=" + styleCode
				+ ", colorCode=" + colorCode + ", seasonCode=" + seasonCode + ", sizeCode=" + sizeCode + ", accCode="
				+ accCode + ", genderCode=" + genderCode + "]";
	}
	
	
}
