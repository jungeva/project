package com.project.groupware.controller.employeeCtr;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.model.EmployeeVO;
import com.project.groupware.paging.Pager;
import com.project.groupware.service.employeeSrv.EmployeeSrv;
import com.project.groupware.utils.UploadFileUtils;

@Controller
@RequestMapping("/grp_employee")
public class EmployeeCtr {
	
	@Autowired
	EmployeeSrv employeeSrv;
	
	@Resource(name="uploadPath") 
	private String uploadPath;
	
	@RequestMapping("/grp_employee_map")
	public String getEmployeeMap() {
		return "/grp_employee/grp_employee_map";
	}
	
	@RequestMapping("/grp_employee_print")
	public ModelAndView getEmployeePrint(int empID) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("empOne", employeeSrv.getEmloyeeOne(empID));
		mav.addObject("others",employeeSrv.getEmployeeOthers(empID));
		mav.setViewName("/grp_employee/grp_employee_print");
		return mav;
	}
	
	@RequestMapping("/grp_employee_list")
	public ModelAndView getEmployeeList(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue = "emp_name") String searchOpt, 
			@RequestParam(defaultValue = "" ) String words) {
		
		ModelAndView mav = new ModelAndView();
		int count = employeeSrv.EmployeeCountAfter(searchOpt, words);
		
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<EmployeeVO> list = employeeSrv.getEmployeeList(start, end, searchOpt, words);
		
		mav.addObject("list", list);
		mav.addObject("searchCount", count);
		mav.addObject("totalCount", employeeSrv.getEmployeeCount());
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.setViewName("grp_employee/grp_employee_list");
		
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
		return mav;
	}
	
	@RequestMapping("/grp_employee_retired_list")
	public ModelAndView getEmployeeRetiredList(
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue = "emp_name") String searchOpt, 
			@RequestParam(defaultValue = "" ) String words) {
		
		ModelAndView mav = new ModelAndView();
		int count = employeeSrv.retiredEmployeeCount(searchOpt, words);
		
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<EmployeeVO> retiredList = employeeSrv.getEmployeeRetiredList(start, end, searchOpt, words);		
		
		mav.addObject("retiredList", retiredList);
		mav.addObject("count", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.setViewName("grp_employee/grp_employee_retired_list");
		
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
		
		return mav;
	}
	
	@RequestMapping(value="/grp_employee_register", method = RequestMethod.GET)
	public ModelAndView setEmployeeRegister(int empID, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("empOne", employeeSrv.getEmloyeeOne(empID));
		mav.addObject("others",employeeSrv.getEmployeeOthers(empID));
		mav.setViewName("/grp_employee/grp_employee_register");
		return mav;
	}
	

	@RequestMapping(value="/grp_employee_register", method = RequestMethod.POST)
	public String setEmpInfoOthess(EmployeeVO evo, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		String fileURL = "/images/no.jpg";

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		}
		if(employeeSrv.registerChk(evo.getEmpID()) > 0) {
			if(fileName == null) {
				evo.setEmpPhoto(fileURL);
				evo.setEmpThumPhoto(fileURL);
				employeeSrv.registerModeify(evo);
			}else {
				evo.setEmpPhoto(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				evo.setEmpThumPhoto(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
				employeeSrv.registerModeify(evo);
			}
		}else {
			if(fileName == null) {
				evo.setEmpPhoto(fileURL);
				evo.setEmpThumPhoto(fileURL);
				employeeSrv.setEmpInfoOthers(evo);
			}else {
				evo.setEmpPhoto(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				evo.setEmpThumPhoto(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
				employeeSrv.setEmpInfoOthers(evo);
			}
		}
		return  "redirect:/grp_employee/grp_employee_list";
	}
	
	@RequestMapping(value="/grp_employee_head_change", method = RequestMethod.POST)
	@ResponseBody
	public String setEmployeeHeadChange(@RequestParam String empHead,@RequestParam int empID) {
		employeeSrv.setEmployeeHeadChange(empHead, empID);
		return "success";
	}
	
	@RequestMapping(value="/grp_employee_confirm_change", method = RequestMethod.POST)
	@ResponseBody
	public String setEmployeeConfirmChange(@RequestParam String empConfirm,@RequestParam int empID) {
		employeeSrv.setEmployeeConfirmChange(empConfirm, empID);
		return "success";
	}
	
	@RequestMapping(value="/grp_employee_auth_change", method = RequestMethod.POST)
	@ResponseBody
	public String setEmployeeAuthChange(@RequestParam String empAuth, @RequestParam int empID) {
		employeeSrv.setEmployeeAuthChange(empAuth, empID);
		return "success";
	}
	

	@RequestMapping(value="/grp_employee_retired", method = RequestMethod.POST)
	@ResponseBody
	public String getEmployeeRetired(int empID) {
		employeeSrv.getEmployeeRetired(empID);
		return "success";
	}
	
	@RequestMapping(value="/grp_employee_retiredAll", method = RequestMethod.POST)
	@ResponseBody
	public String setEmpRetiredAll(@RequestParam (value="chkArray[]") List<String> chkArray) {
		
		int eid;
		for(String list : chkArray) {
			eid = Integer.parseInt(list);
			employeeSrv.setEmpRetiredAll(eid);
		}
		return "success";
	}
	
	@RequestMapping("/grp_employee_delete")
	@ResponseBody
	public String setEmpDelete(int empID) {
		employeeSrv.setEmpDelete(empID);
		return "success";
	}
	
	@RequestMapping(value="/grp_employee_deleteAll")
	@ResponseBody
	public String setEmpDeleteAll(@RequestParam (value="chkArray[]") List<String> chkArray) {
		
		int eid;
		for(String list : chkArray) {
			eid = Integer.parseInt(list);
			employeeSrv.setEmpDeleteAll(eid);
		}
		
		return "success";
	}
	
	@RequestMapping("/grp_employee_comback")
	@ResponseBody
	public String setEmployeeComback(int empID) {
		employeeSrv.setEmployeeComback(empID);
		return "success";
	}
	
	//모달창 정보 전달
	@RequestMapping("/grp_employee_detail")
	@ResponseBody
	public EmployeeVO getDetailInfo(int empID) {
		return employeeSrv.getDetailInfo(empID);
	}
	
}


