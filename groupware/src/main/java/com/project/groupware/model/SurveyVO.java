package com.project.groupware.model;

public class SurveyVO {
	private int surveyID;
	private String surveyState;
	private String surveyResult;
	private String surveySubject;
	private String surveyStartDate;
	private String surveyEndDate;
	private String surveyWriter;
	private String[] surveyExample; 
	private String surveyExcnt; // 0 | 1 | 2
	private String surveyRegdate;
	
	private String surveyEx; // surveyExample 변환값받는 변수//그렇다|아니다|모르겠다
	private int surveyTotal; // surveyExcnt 개별 더한값 넣는곳
	
	private String rdo; // 라디오버튼 받기
	
	
	public int getSurveyID() {
		return surveyID;
	}
	public void setSurveyID(int surveyID) {
		this.surveyID = surveyID;
	}
	public String getSurveyState() {
		return surveyState;
	}
	public void setSurveyState(String surveyState) {
		this.surveyState = surveyState;
	}
	public String getSurveyResult() {
		return surveyResult;
	}
	public void setSurveyResult(String surveyResult) {
		this.surveyResult = surveyResult;
	}
	public String getSurveySubject() {
		return surveySubject;
	}
	public void setSurveySubject(String surveySubject) {
		this.surveySubject = surveySubject;
	}
	public String getSurveyStartDate() {
		return surveyStartDate;
	}
	public void setSurveyStartDate(String surveyStartDate) {
		this.surveyStartDate = surveyStartDate;
	}
	public String getSurveyEndDate() {
		return surveyEndDate;
	}
	public void setSurveyEndDate(String surveyEndDate) {
		this.surveyEndDate = surveyEndDate;
	}
	public String getSurveyWriter() {
		return surveyWriter;
	}
	public void setSurveyWriter(String surveyWriter) {
		this.surveyWriter = surveyWriter;
	}
	
	public String[] getSurveyExample() {
		return surveyExample;
	}
	public void setSurveyExample(String[] surveyExample) {
		this.surveyExample = surveyExample;
	}
	public String getSurveyExcnt() {
		return surveyExcnt;
	}
	public void setSurveyExcnt(String surveyExcnt) {
		this.surveyExcnt = surveyExcnt;
	}
	public String getSurveyRegdate() {
		return surveyRegdate;
	}
	public void setSurveyRegdate(String surveyRegdate) {
		this.surveyRegdate = surveyRegdate;
	}
	public String getSurveyEx() {
		return surveyEx;
	}
	public void setSurveyEx(String surveyEx) {
		this.surveyEx = surveyEx;
	}
	public int getSurveyTotal() {
		return surveyTotal;
	}
	public void setSurveyTotal(int surveyTotal) {
		this.surveyTotal = surveyTotal;
	}
	public String getRdo() {
		return rdo;
	}
	public void setRdo(String rdo) {
		this.rdo = rdo;
	}
	
	
}
