package com.project.groupware.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EmployeeVO {
	private int empID;
	private String empDepartmentCode;
	private String empDepartmentName;
	private String empGradeCode;
	private String empGradeName;
	private String empNumber;
	private Date empEnterDate;
	private String empRetired;
	private String empName;
	private String empPwd;
	private Date empRegdate;
	private String empHead;
	private int empAuth;
	private String empConfirm;
	private int ref; //사원번호 중복피하기위한 변수
	private Date empRetiredDate;
	
	
	private int empOid;
	private String empEngName;
	private String empGender;
	private String empBirth;
	private String empTel;
	private String empEmergencyTel;
	private String empCp;
	private String empExtension;
	private String empMarried;
	private String empPostcode;
	private String empDetailAddr;
	private String empExtraAddr;
	private String empAddr;
	private String empEmail;
	private String empRecruit;
	private String empEmployment;
	private String empMilitary;
	private String empSpeciality;
	private String empDisability;
	private String empLicense1;
	private String empLicense2;
	private String empLanguage1;
	private String empLanguage2;
	private String empRewardPunish1;
	private String empRewardPunish2;
	private String empComment;
	private String empPhoto;
	private String empThumPhoto;
	private int empIDFK;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public int getEmpID() {
		return empID;
	}
	public void setEmpID(int empID) {
		this.empID = empID;
	}
	public String getEmpDepartmentCode() {
		return empDepartmentCode;
	}
	public void setEmpDepartmentCode(String empDepartmentCode) {
		this.empDepartmentCode = empDepartmentCode;
	}
	public String getEmpDepartmentName() {
		return empDepartmentName;
	}
	public void setEmpDepartmentName(String empDepartmentName) {
		this.empDepartmentName = empDepartmentName;
	}
	public String getEmpGradeCode() {
		return empGradeCode;
	}
	public void setEmpGradeCode(String empGradeCode) {
		this.empGradeCode = empGradeCode;
	}
	public String getEmpGradeName() {
		return empGradeName;
	}
	public void setEmpGradeName(String empGradeName) {
		this.empGradeName = empGradeName;
	}
	public String getEmpNumber() {
		return empNumber;
	}
	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}
	public String getEmpEnterDate() {
		return sdf.format(empEnterDate);
	}
	public void setEmpEnterDate(Date empEnterDate) {
		this.empEnterDate = empEnterDate;
	}
	public String getEmpRetired() {
		return empRetired;
	}
	public void setEmpRetired(String empRetired) {
		this.empRetired = empRetired;
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
	public Date getRegdate() {
		return empRegdate;
	}
	public void setRegdate(Date regdate) {
		this.empRegdate = regdate;
	}
	public String getEmpHead() {
		return empHead;
	}
	public void setEmpHead(String empHead) {
		this.empHead = empHead;
	}
	public int getEmpAuth() {
		return empAuth;
	}
	public void setEmpAuth(int empAuth) {
		this.empAuth = empAuth;
	}
	public String getEmpConfirm() {
		return empConfirm;
	}
	public void setEmpConfirm(String empConfirm) {
		this.empConfirm = empConfirm;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public Date getEmpRegdate() {
		return empRegdate;
	}
	public void setEmpRegdate(Date empRegdate) {
		this.empRegdate = empRegdate;
	}
	public int getEmpOid() {
		return empOid;
	}
	public void setEmpOid(int empOid) {
		this.empOid = empOid;
	}
	
	public String getEmpEngName() {
		return empEngName;
	}
	public void setEmpEngName(String empEngName) {
		this.empEngName = empEngName;
	}
	public String getEmpGender() {
		return empGender;
	}
	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}
	public String getEmpBirth() {
		return empBirth;
	}
	public void setEmpBirth(String empBirth) {
		this.empBirth = empBirth;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	public String getEmpEmergencyTel() {
		return empEmergencyTel;
	}
	public void setEmpEmergencyTel(String empEmergencyTel) {
		this.empEmergencyTel = empEmergencyTel;
	}
	public String getEmpCp() {
		return empCp;
	}
	public void setEmpCp(String empCp) {
		this.empCp = empCp;
	}
	public String getEmpExtension() {
		return empExtension;
	}
	public void setEmpExtension(String empExtension) {
		this.empExtension = empExtension;
	}
	public String getEmpMarried() {
		return empMarried;
	}
	public void setEmpMarried(String empMarried) {
		this.empMarried = empMarried;
	}
	public String getEmpAddr() {
		return empAddr;
	}
	public void setEmpAddr(String empAddr) {
		this.empAddr = empAddr;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpRecruit() {
		return empRecruit;
	}
	public void setEmpRecruit(String empRecruit) {
		this.empRecruit = empRecruit;
	}
	public String getEmpEmployment() {
		return empEmployment;
	}
	public void setEmpEmployment(String empEmployment) {
		this.empEmployment = empEmployment;
	}
	public String getEmpMilitary() {
		return empMilitary;
	}
	public void setEmpMilitary(String empMilitary) {
		this.empMilitary = empMilitary;
	}
	public String getEmpSpeciality() {
		return empSpeciality;
	}
	public void setEmpSpeciality(String empSpeciality) {
		this.empSpeciality = empSpeciality;
	}
	public String getEmpDisability() {
		return empDisability;
	}
	public void setEmpDisability(String empDisability) {
		this.empDisability = empDisability;
	}
	public String getEmpLicense1() {
		return empLicense1;
	}
	public void setEmpLicense1(String empLicense1) {
		this.empLicense1 = empLicense1;
	}
	public String getEmpLicense2() {
		return empLicense2;
	}
	public void setEmpLicense2(String empLicense2) {
		this.empLicense2 = empLicense2;
	}
	public String getEmpLanguage1() {
		return empLanguage1;
	}
	public void setEmpLanguage1(String empLanguage1) {
		this.empLanguage1 = empLanguage1;
	}
	public String getEmpLanguage2() {
		return empLanguage2;
	}
	public void setEmpLanguage2(String empLanguage2) {
		this.empLanguage2 = empLanguage2;
	}
	public String getEmpRewardPunish1() {
		return empRewardPunish1;
	}
	public void setEmpRewardPunish1(String empRewardPunish1) {
		this.empRewardPunish1 = empRewardPunish1;
	}
	public String getEmpRewardPunish2() {
		return empRewardPunish2;
	}
	public void setEmpRewardPunish2(String empRewardPunish2) {
		this.empRewardPunish2 = empRewardPunish2;
	}
	public String getEmpComment() {
		return empComment;
	}
	public void setEmpComment(String empComment) {
		this.empComment = empComment;
	}
	
	public String getEmpRetiredDate() {
		return sdf.format(empRetiredDate);
	}
	public void setEmpRetiredDate(Date empRetiredDate) {
		this.empRetiredDate = empRetiredDate;
	}
	public SimpleDateFormat getSdf() {
		return sdf;
	}
	public void setSdf(SimpleDateFormat sdf) {
		this.sdf = sdf;
	}
	public String getEmpPhoto() {
		return empPhoto;
	}
	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}
	
	public String getEmpThumPhoto() {
		return empThumPhoto;
	}
	public void setEmpThumPhoto(String empThumPhoto) {
		this.empThumPhoto = empThumPhoto;
	}
	
	public int getEmpIDFK() {
		return empIDFK;
	}
	public void setEmpIDFK(int empIDFK) {
		this.empIDFK = empIDFK;
	}
	public String getEmpPostcode() {
		return empPostcode;
	}
	public void setEmpPostcode(String empPostcode) {
		this.empPostcode = empPostcode;
	}
	public String getEmpDetailAddr() {
		return empDetailAddr;
	}
	public void setEmpDetailAddr(String empDetailAddr) {
		this.empDetailAddr = empDetailAddr;
	}
	public String getEmpExtraAddr() {
		return empExtraAddr;
	}
	public void setEmpExtraAddr(String empExtraAddr) {
		this.empExtraAddr = empExtraAddr;
	}
	
}
