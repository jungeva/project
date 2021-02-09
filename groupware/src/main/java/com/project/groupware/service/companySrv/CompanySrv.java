package com.project.groupware.service.companySrv;

import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.model.CompanyVO;
import com.project.groupware.repository.companyDao.CompanyDao;

@Service
public class CompanySrv {
	
	@Autowired
	CompanyDao companyDao;
	
	public void ComInfoModify(CompanyVO cvo) {
		companyDao.ComInfoModify(cvo);
	}
	
	public CompanyVO getCompanyInfo() {
		return companyDao.getCompanyInfo();
	}

}
