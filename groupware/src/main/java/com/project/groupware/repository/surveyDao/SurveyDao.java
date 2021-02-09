package com.project.groupware.repository.surveyDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groupware.model.SurveyVO;

@Repository
public class SurveyDao {
	
	@Autowired
	SqlSession sql;
	
	public void getSurveyCreate(SurveyVO svo) {
		sql.insert("survey.getSurveyCreate", svo);
	}
	
	public List<SurveyVO> getSurveyOpen(int start, int end) {
		Map<String , Object > map =new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sql.selectList("survey.getSurveyOpen",map);
	}
	
	public SurveyVO getSurveyOne(int surveyID) {
		return sql.selectOne("survey.getSurveyOne", surveyID);
	}
	
	public void doVote(SurveyVO svo) {
		sql.update("survey.doVote", svo);
	}
	
	public void surveyDelete(int surveyID) {
		sql.delete("survey.surveyDelete",surveyID);
	}
	
	public void setSurveyEnd(int surveyID) {
		sql.update("survey.setSurveyEnd", surveyID);
	}
	
	public void setStateModify(SurveyVO svo) {
		sql.update("survey.setStateModify", svo);
	}
	
	public int openCount() {
		return sql.selectOne("survey.openCount");
	}
		
	public int closeCount() {
		return sql.selectOne("survey.closeCount");
	}
}
