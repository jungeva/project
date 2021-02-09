package com.project.groupware.service.surveySrv;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.model.SurveyVO;
import com.project.groupware.repository.surveyDao.SurveyDao;

@Service
public class SurveySrv {
	
	@Autowired
	SurveyDao surveyDao;
	
	public void getSurveyCreate(SurveyVO svo) {
		surveyDao.getSurveyCreate(svo);
	}
	
	public List<SurveyVO> getSurveyOpen(int start, int end) {
		List<SurveyVO> list = surveyDao.getSurveyOpen(start, end);
		
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
	
	public SurveyVO getSurveyOne(int surveyID) {
		SurveyVO svo = surveyDao.getSurveyOne(surveyID);
		
		int sum = 0;
		StringTokenizer token = new StringTokenizer(svo.getSurveyExcnt(), "|");
		while(token.hasMoreTokens()) {
			int num = Integer.parseInt(token.nextToken());
			sum += num;
		}
		svo.setSurveyTotal(sum);
		return svo;
	}
	
	public void doVote(SurveyVO svo) {
		SurveyVO vo = surveyDao.getSurveyOne(svo.getSurveyID());
		
		StringTokenizer token = new StringTokenizer(vo.getSurveyExcnt(), "|");
		String[] arr = new String[token.countTokens()];
		
		int i = 0;
		String str = "";
		while(token.hasMoreTokens()) {
			arr[i] = token.nextToken();
			if(i == Integer.parseInt(svo.getRdo())) {
				int temp = Integer.parseInt(arr[i]);
				arr[i] = String.valueOf(++temp);
			}
			
			str += arr[i] + "|";
			i++;
		}
		
		vo.setSurveyExcnt(str);
		surveyDao.doVote(vo);
	}
	
	public void setStateModify(SurveyVO svo) {
		surveyDao.setStateModify(svo);
	}
	
	public void surveyDelete(int surveyID) {
		surveyDao.surveyDelete(surveyID);
	}
	
	public void setSurveyEnd(int surveyID) {
		surveyDao.setSurveyEnd(surveyID);
	}
	
	public int openCount() {
		return surveyDao.openCount();
	}
		
	public int closeCount() {
		return surveyDao.closeCount();
	}
}
