package com.project.groupware.service.scheduleSrv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.model.ScheduleVO;
import com.project.groupware.repository.scheduleDao.ScheduleDao;

@Service
public class ScheduleSrv {
	
	@Autowired
	ScheduleDao sDao;
	
	public void setScheduleAdd(ScheduleVO svo) {
		sDao.setScheduleAdd(svo);
	}
	
	public List<ScheduleVO> getScheduleList() {
		return sDao.getScheduleList();
	}
	
}
