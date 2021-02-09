package com.project.groupware.service.IDnRegSrv;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.model.DepartmentVO;
import com.project.groupware.model.EmployeeVO;
import com.project.groupware.model.GradeVO;
import com.project.groupware.repository.IDnRegDao.IDnRegDao;

@Service
public class IDnRegSrv {

	@Autowired
	IDnRegDao idNrdgDao;
	
	public List<DepartmentVO> getDepartmentList() {
		return idNrdgDao.getDepartmentList();
	}
	
	public List<GradeVO> getGradeList() {
		return idNrdgDao.getGradeList();
	}
	
	public void setEmpRegister(EmployeeVO evo) {
		idNrdgDao.setEmpRegister(evo);
	}
	
	public int empLoginCheck(EmployeeVO evo) {
		return idNrdgDao.empLoginCheck(evo);
	}
	
	public EmployeeVO getEmpInfo(EmployeeVO evo) {
		return idNrdgDao.getEmpInfo(evo);
	}
	
	public void setSession(EmployeeVO evo, HttpSession session) {
		EmployeeVO vo = idNrdgDao.getEmpInfo(evo);
		
		if( vo != null) {
			session.setAttribute("empID", vo.getEmpID());
			session.setAttribute("empNumber", vo.getEmpNumber());
			session.setAttribute("empName", vo.getEmpName());
			session.setAttribute("empAuth", vo.getEmpAuth());
			session.setAttribute("empConfirm", vo.getEmpConfirm());
			session.setAttribute("empDepartmentName", vo.getEmpDepartmentName());
			session.setAttribute("empGradeName", vo.getEmpGradeName());
			session.setAttribute("empEnterDate", vo.getEmpEnterDate());
		}
		
	}
	
	public void setLogout(HttpSession session) {
		session.invalidate();
	}
}
