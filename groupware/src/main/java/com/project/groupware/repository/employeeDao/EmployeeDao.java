package com.project.groupware.repository.employeeDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groupware.model.EmployeeVO;

@Repository
public class EmployeeDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<EmployeeVO> getEmployeeList(int start, int end, String searchOpt, String words) {
		Map<String , Object > map =new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		return sqlSession.selectList("employee.getEmployeeList", map);
	}
	
	public List<EmployeeVO> getEmployeeRetiredList(int start, int end, String searchOpt, String words) {
		Map<String , Object > map =new HashMap<String, Object>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		return sqlSession.selectList("employee.getEmployeeRetiredList", map);
	}
	
	public int EmployeeCountAfter(String searchOpt, String words) {
		Map<String , String > map =new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		return sqlSession.selectOne("employee.EmployeeCountAfter", map);
	}
	
	public int retiredEmployeeCount(String searchOpt, String words) {
		Map<String , String > map =new HashMap<String, String>();
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		return sqlSession.selectOne("employee.retiredEmployeeCount", map);
	}
	
	public int getEmployeeCount() {
		return sqlSession.selectOne("employee.getEmployeeCount");
	}
	
	public void setEmployeeHeadChange(String empHead, int empID) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("empHead", empHead);
		map.put("empID", empID);
		sqlSession.update("employee.setEmployeeHeadChange", map);
	}
	
	public void setEmployeeConfirmChange(String empConfirm, int empID) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("empConfirm", empConfirm);
		map.put("empID", empID);
		sqlSession.update("employee.setEmployeeConfirmChange", map);
	}
	
	public void setEmployeeAuthChange(String empAuth, int empID) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("empAuth", empAuth);
		map.put("empID", empID);
		sqlSession.update("employee.setEmployeeAuthChange", map);
	}
	
	public EmployeeVO getEmloyeeOne(int empID) {
		return sqlSession.selectOne("employee.getEmloyeeOne",empID );
	}
	
	public void setEmpInfoOthers(EmployeeVO evo) {
		sqlSession.insert("employee.setEmpInfoOthers", evo);
	}
	
	public void getEmployeeRetired(int empID) {
		sqlSession.update("employee.getEmployeeRetired", empID);
	}	
	
	public void setEmpRetiredAll(int empID) {
		sqlSession.update("employee.setEmpRetiredAll", empID);
	}
	
	public void setEmpDelete(int empID) {
		sqlSession.delete("employee.setEmpDelete",empID);
	}
	
	public void setEmpDeleteAll(int empID) {
		sqlSession.delete("employee.setEmpDeleteAll",empID);
	}
	
	public void setEmployeeComback(int empID) {
		sqlSession.update("employee.setEmployeeComback", empID);
	}
	
	public EmployeeVO getDetailInfo(int empID) {
		return sqlSession.selectOne("employee.getDetailInfo",empID);
	}
	
	public int registerChk(int empID) {
		return sqlSession.selectOne("employee.registerChk",empID);
	}
	
	public void registerModeify(EmployeeVO evo) {
		sqlSession.update("employee.registerModeify",evo);
	}
	
	public EmployeeVO getEmployeeOthers(int empID) {
		return sqlSession.selectOne("employee.getEmployeeOthers",empID);
	} 
	

}
