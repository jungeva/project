package com.project.groupware.controller.adminMainCtr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.service.adminMainSrv.AdminMainSrv;

@Controller
@RequestMapping("/grp_admin_main")
public class AdminMainCtr {
	
	@Autowired
	AdminMainSrv adminSrv;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView getAdminMain() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("survey", adminSrv.getSurveyInfo());
		mav.setViewName("grp_admin_main/grp_admin_main");
		return mav;
	}

}
