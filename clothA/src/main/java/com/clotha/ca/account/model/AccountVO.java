package com.clotha.ca.account.model;

import com.clotha.ca.common.SearchVO;

public class AccountVO extends SearchVO{

	private String accCode;
	private String accName;
	private String accAddress;
	private String accTel;
	private String accCeo;
	private String accNo;
	private String accIsdeal;
	private String accUnique;
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
	public String getAccAddress() {
		return accAddress;
	}
	public void setAccAddress(String accAddress) {
		this.accAddress = accAddress;
	}
	public String getAccTel() {
		return accTel;
	}
	public void setAccTel(String accTel) {
		this.accTel = accTel;
	}
	public String getAccCeo() {
		return accCeo;
	}
	public void setAccCeo(String accCeo) {
		this.accCeo = accCeo;
	}
	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public String getAccIsdeal() {
		return accIsdeal;
	}
	public void setAccIsdeal(String accIsdeal) {
		this.accIsdeal = accIsdeal;
	}
	public String getAccUnique() {
		return accUnique;
	}
	public void setAccUnique(String accUnique) {
		this.accUnique = accUnique;
	}
	@Override
	public String toString() {
		return "AccountVO [accCode=" + accCode + ", accName=" + accName + ", accAddress=" + accAddress + ", accTel="
				+ accTel + ", accCeo=" + accCeo + ", accNo=" + accNo + ", accIsdeal=" + accIsdeal + ", accUnique="
				+ accUnique + super.toString()+"]";
	}
	
	
}
