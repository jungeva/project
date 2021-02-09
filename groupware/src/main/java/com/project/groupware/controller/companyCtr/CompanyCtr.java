package com.project.groupware.controller.companyCtr;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.model.CompanyVO;
import com.project.groupware.service.companySrv.CompanySrv;
import com.project.groupware.utils.UploadFileUtils;

@Controller
@RequestMapping("/company")
public class CompanyCtr {
	
	@Autowired
	CompanySrv companySrv;
	
	@Resource(name="uploadPath") 
	private String uploadPath;
	
	@RequestMapping(value="/grp_companySetting", method=RequestMethod.GET)
	public ModelAndView getCompanySetting() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("info", companySrv.getCompanyInfo());
		mav.setViewName("/grp_company/grp_companySetting");
		return mav;
	}
	
	@RequestMapping(value="/grp_companySetting", method=RequestMethod.POST)
	public String setCompanyInfo(CompanyVO cvo,  MultipartFile file) throws IOException, Exception {
		/*파일정보 가져와 UploadFileUtils.java를 통해 폴더를 생성한 후 원본 파일과 썸네일을 저장 */
		String imgUploadPath = uploadPath + File.separator + "imgUpload"+ File.separator +"LogoImg";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		}
			cvo.setComLogo(File.separator + "imgUpload" + File.separator +"LogoImg" + ymdPath + File.separator + fileName);
			companySrv.ComInfoModify(cvo);
			
			return "redirect:/company/grp_companySetting";
			
		/*파일정보 가져와 UploadFileUtils.java를 통해 폴더를 생성한 후 원본 파일과 썸네일을 저장 */
		
	}
	
	@RequestMapping("/grp_company_info")
	@ResponseBody
	public CompanyVO getCompanyInfo() {
		return companySrv.getCompanyInfo();
	}

}
