package com.project.groupware.repository.IDnRegDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groupware.model.DepartmentVO;
import com.project.groupware.model.EmployeeVO;
import com.project.groupware.model.GradeVO;

@Repository
public class IDnRegDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<DepartmentVO> getDepartmentList() {
		return sqlSession.selectList("register.getDepartmentList");
	}
	
	public List<GradeVO> getGradeList() {
		return sqlSession.selectList("register.getGradeList");
	}
	
	public void setEmpRegister(EmployeeVO evo) {
		sqlSession.insert("register.setEmpRegister", evo);
	}
	
	public int empLoginCheck(EmployeeVO evo) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("empNumber", evo.getEmpNumber());
		map.put("empPwd", evo.getEmpPwd());
		
		return sqlSession.selectOne("register.empLoginCheck",map);
	}
	
	public EmployeeVO getEmpInfo(EmployeeVO evo) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("empNumber", evo.getEmpNumber());
		map.put("empPwd", evo.getEmpPwd());
		
		return sqlSession.selectOne("register.getEmpInfo",map);
	}

}
