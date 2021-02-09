package com.project.groupware.controller.scheduleCtr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.groupware.model.ScheduleVO;
import com.project.groupware.service.scheduleSrv.ScheduleSrv;

@Controller
@RequestMapping("/schedule")
public class ScheduleCtr {
	
	@Autowired
	ScheduleSrv sSrv;
	
	@RequestMapping("/grp_schedule")
	public String getMain() {
		return "/grp_schedule/grp_schedule";
	}
	
	@RequestMapping("/grp_schedule_add")
	@ResponseBody
	public void setScheduleAdd(@ModelAttribute ScheduleVO svo) {
		sSrv.setScheduleAdd(svo);
	}
	
	@RequestMapping("/grp_schedule_list")
	@ResponseBody
	public List<ScheduleVO> getScheduleList() {
		List<ScheduleVO> list = sSrv.getScheduleList();
		return list;
	}
	
	
}
