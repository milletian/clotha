package com.clotha.ca.employee.model;

import java.sql.Timestamp;

import com.clotha.ca.common.SearchVO;

public class EmployeeVO extends SearchVO {
	private String empNo;
	private String deptNo;
	private String empName;
	private String empPwd;
	private String empZipcode;
	private String empAddress;
	private String empJumin;
	private String empTel;
	private String empFace;
	private String empJob;
	private Timestamp empJoindate;
	private Timestamp empOutdate;
	private String gradeCode;
	private String empDel;
	private String storeCode;
	private String empEmail;
	private int empCount;
	
	
	
	public int getEmpCount() {
		return empCount;
	}
	public void setEmpCount(int empCount) {
		this.empCount = empCount;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getDeptNo() {
		return deptNo;
	}
	public void setDeptNo(String deptNo) {
		this.deptNo = deptNo;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpPwd() {
		return empPwd;
	}
	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}
	public String getEmpZipcode() {
		return empZipcode;
	}
	public void setEmpZipcode(String empZipcode) {
		this.empZipcode = empZipcode;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public String getEmpJumin() {
		return empJumin;
	}
	public void setEmpJumin(String empJumin) {
		this.empJumin = empJumin;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	public String getEmpFace() {
		return empFace;
	}
	public void setEmpFace(String empFace) {
		this.empFace = empFace;
	}
	public String getEmpJob() {
		return empJob;
	}
	public void setEmpJob(String empJob) {
		this.empJob = empJob;
	}
	public Timestamp getEmpJoindate() {
		return empJoindate;
	}
	public void setEmpJoindate(Timestamp empJoindate) {
		this.empJoindate = empJoindate;
	}
	public Timestamp getEmpOutdate() {
		return empOutdate;
	}
	public void setEmpOutdate(Timestamp empOutdate) {
		this.empOutdate = empOutdate;
	}
	public String getGradeCode() {
		return gradeCode;
	}
	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}
	public String getEmpDel() {
		return empDel;
	}
	public void setEmpDel(String empDel) {
		this.empDel = empDel;
	}
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	@Override
	public String toString() {
		return "EmployeeVO [empNo=" + empNo + ", deptNo=" + deptNo + ", empName=" + empName + ", empPwd=" + empPwd
				+ ", empZipcode=" + empZipcode + ", empAddress=" + empAddress + ", empJumin=" + empJumin + ", empTel="
				+ empTel + ", empFace=" + empFace + ", empJob=" + empJob + ", empJoindate=" + empJoindate
				+ ", empOutdate=" + empOutdate + ", gradeCode=" + gradeCode + ", empDel=" + empDel + ", storeCode="
				+ storeCode + ", empEmail=" + empEmail + ", empCount=" + empCount + ", toString()=" + super.toString()
				+ "]";
	}
	
	
	

	

	
	
}
