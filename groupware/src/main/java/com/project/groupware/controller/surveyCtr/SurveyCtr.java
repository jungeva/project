package com.project.groupware.controller.surveyCtr;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.model.SurveyVO;
import com.project.groupware.paging.Pager;
import com.project.groupware.service.surveySrv.SurveySrv;

@Controller
@RequestMapping("/survey")
public class SurveyCtr {
	
	@Autowired
	SurveySrv surveySrv;
	
	//설문진행중 화면 가져오기
	@RequestMapping("/grp_survey_list")
	public ModelAndView getMain(@RequestParam(defaultValue="1") int curPage) throws ParseException {
		ModelAndView mav = new ModelAndView();
		
		int count = surveySrv.openCount() +surveySrv.closeCount();
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		mav.addObject("open", surveySrv.getSurveyOpen(start, end));
		mav.addObject("openCnt", surveySrv.openCount());
		mav.addObject("closeCnt", surveySrv.closeCount());
		mav.addObject("searchCount", count);
		
		//페이지값 넘기기
		mav.addObject("start", start);
		mav.addObject("end", end);
		mav.addObject("blockBegin", pager.getBlockBegin());
		mav.addObject("blockEnd", pager.getBlockEnd());
		mav.addObject("curBlock", pager.getCurBlock());
		mav.addObject("totalBlock", pager.getTotalBlock());
		
		mav.addObject("prevPage", pager.getPrevPage());
		mav.addObject("nextPage", pager.getNextPage());
		mav.addObject("curPage", pager.getCurPage());
		mav.addObject("totalPage", pager.getTotalPage());
		
		mav.addObject("selected", pager.getCurPage());
		mav.setViewName("/grp_survey/grp_survey_list");
		
		//지정된 날짜경과시 
		List<SurveyVO> list = surveySrv.getSurveyOpen(start, end);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		
		for(int i = 0; i < list.size(); i++ ) {
			Date startDate = sdf.parse(list.get(i).getSurveyStartDate());
			Date endDate = sdf.parse(list.get(i).getSurveyEndDate());
			
			Date today = new Date();
			long chkDate = today.getTime() - endDate.getTime() - (1000*60*60*24);
			
			if( chkDate > 0 ) {
				list.get(i).setSurveyState("close");
				surveySrv.setStateModify(list.get(i));
			}else {
				list.get(i).setSurveyState("open");
				surveySrv.setStateModify(list.get(i));
			}
		}
		return mav;
	}
	
	@RequestMapping("/grp_survey_register")
	public String getSurveyRegister() {
		return "/grp_survey/grp_survey_register";
	}
	
	//설문 등록
	@RequestMapping("/grp_survey_create")
	@ResponseBody
	public void getSurveyCreate(@ModelAttribute SurveyVO svo) {
		
		String str="";
		String cnt="";
		for( int i =0; i < svo.getSurveyExample().length; i++ ) {
			str += svo.getSurveyExample()[i] + "|";
			cnt += "0" + "|";
		}
		
		svo.setSurveyEx(str);
		svo.setSurveyExcnt(cnt);
		surveySrv.getSurveyCreate(svo);
	}
	
	//투표폼가져오기
	@RequestMapping("/grp_survey_vote")
	@ResponseBody
	public SurveyVO getSurveyOne(@RequestParam int surveyID) {
		return surveySrv.getSurveyOne(surveyID);
	}
	
	//투표하기
	@RequestMapping("/grp_survey_do_vote")
	@ResponseBody
	public void doVote(@ModelAttribute SurveyVO svo) {
		surveySrv.doVote(svo);
	}
	
	//설문결과보기
	@RequestMapping("/grp_survey_result")
	@ResponseBody
	public SurveyVO getSurveyResult(@RequestParam int surveyID) {
		return surveySrv.getSurveyOne(surveyID);
	}
	
	//설문삭제
	@RequestMapping("/grp_survey_delete")
	@ResponseBody
	public void setSurveyDelete(@RequestParam int surveyID) {
		surveySrv.surveyDelete(surveyID);
	}
	
	//설문마감
	@RequestMapping("/grp_survey_end")
	@ResponseBody
	public void setSurveyEnd(@RequestParam int surveyID) {
		surveySrv.setSurveyEnd(surveyID);
	}

}
