package com.project.groupware.repository.companyDao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groupware.model.CompanyVO;

@Repository
public class CompanyDao {
	
	@Autowired
	SqlSession sql;
	
	public void ComInfoModify(CompanyVO cvo) {
		sql.update("company.ComInfoModify",cvo);
	}
	
	public CompanyVO getCompanyInfo() {
		return sql.selectOne("company.getCompanyInfo");
	}

}
