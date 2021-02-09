package com.project.groupware.controller.IDnRegCtr;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.model.CompanyVO;
import com.project.groupware.model.DepartmentVO;
import com.project.groupware.model.EmployeeVO;
import com.project.groupware.model.GradeVO;
import com.project.groupware.service.IDnRegSrv.IDnRegSrv;
import com.project.groupware.service.companySrv.CompanySrv;

@Controller
public class IDnRegCtr {
	
	@Autowired
	IDnRegSrv idNregSrv;
	
	@Autowired
	CompanySrv companySrv;
	
	@RequestMapping("")
	public ModelAndView Main() {
		ModelAndView mav = new ModelAndView();
		CompanyVO cvo = companySrv.getCompanyInfo();
		
		mav.addObject("mainMenu", cvo.getComMainMenu());
		mav.addObject("logo", cvo.getComLogo());
		mav.addObject("copy",cvo.getComCopy());
		mav.addObject("address", cvo.getComAddr());
		mav.addObject("tel",cvo.getComTel());
		mav.addObject("name", cvo.getComName());
		mav.addObject("fax", cvo.getComFax());
		mav.addObject("title", cvo.getComTitle());
		mav.addObject("subtitle", cvo.getComSubTitle());
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value="/grp_login", method=RequestMethod.GET)
	public ModelAndView getGrpLogin() {
		ModelAndView mav = new ModelAndView();
		CompanyVO cvo = companySrv.getCompanyInfo();
		
		mav.addObject("logo", cvo.getComLogo());
		mav.setViewName("/grp_login");
		return mav;
	}
	
	
	@RequestMapping(value="/grp_login", method=RequestMethod.POST)
	public ModelAndView setGrpLogin(@ModelAttribute EmployeeVO evo, HttpSession session) {
		
		int result = idNregSrv.empLoginCheck(evo);
		ModelAndView mav = new ModelAndView();
		CompanyVO cvo = companySrv.getCompanyInfo();
		
		String msg;
		if( result > 0 ) {
			EmployeeVO vo = idNregSrv.getEmpInfo(evo);
			//관리자로그인시
			if( vo.getEmpAuth() > 4 && vo.getEmpConfirm().equals("Y")) {
				idNregSrv.setSession(evo, session);
				mav.addObject("logo", cvo.getComLogo());
				mav.setViewName("redirect:/grp_admin_main");
			
			//적절한 권한이 아닐시,
			}else if(vo.getEmpAuth() >1 && vo.getEmpConfirm().equals("Y")) {
				idNregSrv.setSession(evo, session);
				mav.addObject("logo", cvo.getComLogo());
				mav.setViewName("redirect:/");
				
			}else {
				msg="접속권한이 없습니다.\n관리자에게 문의하세요.";
				mav.addObject("logo", cvo.getComLogo());
				mav.addObject("msg", msg);
				mav.setViewName("/grp_login");
			}
		//로그인 오류시,	
		}else {
			msg ="사원번호나 비밀번호가 일치하지않습니다.";
			mav.addObject("logo", cvo.getComLogo());
			mav.addObject("msg", msg);
			mav.setViewName("grp_login");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/grp_logout", method=RequestMethod.GET)
	public String setLogout(HttpSession session) {
		idNregSrv.setLogout(session);
		return "/grp_login";
	}
	
	@RequestMapping(value="/grp_register", method=RequestMethod.GET)
	public ModelAndView grpRegister() {
		ModelAndView mav = new ModelAndView();
		CompanyVO cvo = companySrv.getCompanyInfo();
		
		mav.addObject("logo", cvo.getComLogo());
		mav.setViewName("/grp_register");
		return mav;
	}
	
	@RequestMapping(value="/grp_register", method=RequestMethod.POST)
	@ResponseBody
	public String setEmpRegister(@ModelAttribute EmployeeVO evo) {
		int enterYear = Integer.parseInt(evo.getEmpEnterDate().substring(0, 4));
		String departCode = evo.getEmpDepartmentCode();
		String gradeCode = evo.getEmpGradeCode();
		
		String empNum = enterYear + departCode + gradeCode;
		evo.setEmpNumber(empNum);
		
		idNregSrv.setEmpRegister(evo);
		return "success";
	}
	
	@RequestMapping(value="/grp_get_department", method=RequestMethod.POST)
	@ResponseBody
	public List<DepartmentVO> getDepartment() {
		return idNregSrv.getDepartmentList();
	}
	
	@RequestMapping(value="/grp_get_grade", method=RequestMethod.POST)
	@ResponseBody
	public List<GradeVO> getGrade() {
		return idNregSrv.getGradeList();
	}
	

}
