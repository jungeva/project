package com.project.groupware.repository.scheduleDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groupware.model.ScheduleVO;

@Repository
public class ScheduleDao {
	
	@Autowired
	SqlSession sql;
	
	public void setScheduleAdd(ScheduleVO svo) {
		sql.insert("schedule.setScheduleAdd",svo);
	}
	
	public List<ScheduleVO> getScheduleList() {
		return sql.selectList("schedule.getScheduleList");
	}
	
}
