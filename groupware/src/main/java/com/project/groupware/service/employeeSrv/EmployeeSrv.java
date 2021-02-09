package com.project.groupware.service.employeeSrv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.model.EmployeeVO;
import com.project.groupware.repository.employeeDao.EmployeeDao;

@Service
public class EmployeeSrv {
	
	@Autowired
	EmployeeDao employeeDao;
	
	public List<EmployeeVO> getEmployeeList(int start, int end, String searchOpt, String words) {
		return employeeDao.getEmployeeList(start, end, searchOpt, words);
	}
	
	public List<EmployeeVO> getEmployeeRetiredList(int start, int end, String searchOpt, String words) {
		return employeeDao.getEmployeeRetiredList(start, end, searchOpt, words);
	}
	
	public int EmployeeCountAfter(String searchOpt, String words) {
		return employeeDao.EmployeeCountAfter(searchOpt, words);
	}
	
	public int retiredEmployeeCount(String searchOpt, String words) {
		return employeeDao.retiredEmployeeCount(searchOpt, words);
	}
	
	public int getEmployeeCount() {
		return employeeDao.getEmployeeCount();
	}
	
	public void setEmployeeHeadChange(String empHead, int empID) {
		employeeDao.setEmployeeHeadChange(empHead, empID);
	}
	
	public void setEmployeeConfirmChange(String empConfirm, int empID) {
		employeeDao.setEmployeeConfirmChange(empConfirm, empID);
	}
	
	public void setEmployeeAuthChange(String empAuth, int empID) {
		employeeDao.setEmployeeAuthChange(empAuth, empID);
	}
	
	public EmployeeVO getEmloyeeOne(int empID) {
		return employeeDao.getEmloyeeOne(empID);
	}
	
	public void setEmpInfoOthers(EmployeeVO evo) {
		employeeDao.setEmpInfoOthers(evo);
	}
	
	public void getEmployeeRetired(int empID) {
		employeeDao.getEmployeeRetired(empID);
	}	
	
	public void setEmpRetiredAll(int empID) {
		employeeDao.setEmpRetiredAll(empID);
	}
	
	public void setEmpDelete(int empID) {
		employeeDao.setEmpDelete(empID);
	}
	
	public void setEmpDeleteAll(int empID) {
		employeeDao.setEmpDeleteAll(empID);
	}
	
	public void setEmployeeComback(int empID) {
		employeeDao.setEmployeeComback(empID);
	}
	
	public EmployeeVO getDetailInfo(int empID) {
		return employeeDao.getDetailInfo(empID);
	}
	public int registerChk(int empID) {
		return employeeDao.registerChk(empID);
	}
	
	public void registerModeify(EmployeeVO evo) {
		employeeDao.registerModeify(evo);
	}
	
	public EmployeeVO getEmployeeOthers(int empID) {
		return employeeDao.getEmployeeOthers(empID);
	} 

}
