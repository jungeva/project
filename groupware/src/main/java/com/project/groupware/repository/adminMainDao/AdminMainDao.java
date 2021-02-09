package com.project.groupware.repository.adminMainDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groupware.model.SurveyVO;

@Repository
public class AdminMainDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public List<SurveyVO> getSurveyInfo() {
		return sqlSession.selectList("main.getSurveyInfo");
	}

}
