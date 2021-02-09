package com.project.groupware.service.adminMainSrv;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.model.SurveyVO;
import com.project.groupware.repository.adminMainDao.AdminMainDao;

@Service
public class AdminMainSrv {
	
	@Autowired
	AdminMainDao adminDao;
	
	public List<SurveyVO> getSurveyInfo() {
		List<SurveyVO> list = adminDao.getSurveyInfo();
		
		for( int i = 0; i < list.size(); i++ ) {
			String str = list.get(i).getSurveyExcnt();
			
			int sum=0;
			StringTokenizer token = new StringTokenizer(str,"|");
			while(token.hasMoreTokens()) {
				int num = Integer.parseInt(token.nextToken());
				sum += num;
		}
			
			list.get(i).setSurveyTotal(sum);
		}
		return list;
	}

}
