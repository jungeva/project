package com.project.groupware.controller.boardCtr;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.model.ArticleVO;
import com.project.groupware.model.BoardVO;
import com.project.groupware.paging.Pager;
import com.project.groupware.service.boardSrv.ArticleSrv;

@Controller
@RequestMapping("/article")
public class ArticleCtr {
	
	@Autowired
	ArticleSrv articleSrv;
	
	@RequestMapping("/grp_article_list")
	public ModelAndView getBoardInfo(@RequestParam String boardCode,
									@RequestParam(defaultValue="1") int curPage, 
									@RequestParam(defaultValue = "writer") String searchOpt, 
									@RequestParam(defaultValue = "" ) String words) {
		ModelAndView mav = new ModelAndView();	
		int count = articleSrv.getArticleCount(boardCode,searchOpt,words);
		
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		List<ArticleVO> list = articleSrv.getArticleList(boardCode, start,end,searchOpt,words);
		
		BoardVO info = articleSrv.getBoardInfo(boardCode);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		
		mav.addObject("boardCode", boardCode);
		mav.addObject("boardColor", info.getBoardColor());
		mav.addObject("boardTitle", info.getBoardTitle());
		mav.addObject("list", list);
		mav.addObject("totalCount", articleSrv.totalArticleCnt(boardCode));
		mav.addObject("searchCount",count);
		mav.setViewName("/grp_board/grp_article_list");
		
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
	
	@RequestMapping(value="/grp_article_insert", method=RequestMethod.GET)
	public ModelAndView setArticleInfo(@RequestParam String boardCode) {
		ModelAndView mav = new ModelAndView();
		BoardVO info = articleSrv.getBoardInfo(boardCode);
		
		mav.addObject("boardCode", boardCode);
		mav.addObject("boardColor", info.getBoardColor());
		mav.addObject("boardTitle", info.getBoardTitle());
		mav.setViewName("/grp_board/grp_article_insert");
		return mav;
	}
	
	@RequestMapping(value="/grp_article_add", method=RequestMethod.POST)
	public String setArticleAdd(@ModelAttribute ArticleVO avo, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		
				if( files.isEmpty()) { //첨부파일 없을경우
					articleSrv.setArticleAdd(avo);
					
				}else { //첨부파일 있는 경우
					
					String fileUrl = "C://upload//article//"; 
					String fileName = files.getOriginalFilename();
					String fileNameEx = FilenameUtils.getExtension(fileName).toLowerCase(); 
					System.out.println(fileName);
					
					File desFile;
					String desFileName;
					
					do {
						desFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameEx;
						desFile = new File(fileUrl + desFileName);
						
					}while(desFile.exists());
						desFile.getParentFile().mkdirs(); //폴더생성
						files.transferTo(desFile);
					
						avo.setFileName(desFileName);
						avo.setFileOriName(fileName);
						avo.setFileUrl(fileUrl);
						
						articleSrv.setArticleAdd(avo);
				}
				
				return "redirect:/article/grp_article_list?boardCode=" + avo.getBoardCode();
	}
	
	@RequestMapping("/grp_article_deleteOne")
	@ResponseBody
	public String ArticleDeleteOne(@ModelAttribute ArticleVO avo) {
		articleSrv.ArticleDeleteOne(avo);
		return "success";
	}
	
	@RequestMapping(value = "/grp_article_modify", method = RequestMethod.GET)
	public ModelAndView getArticleModify(@ModelAttribute ArticleVO avo) {
		
		BoardVO info = articleSrv.getBoardInfo(avo.getBoardCode());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", articleSrv.getArticleInfo(avo));
		mav.addObject("boardCode", avo.getBoardCode());
		mav.addObject("boardColor", info.getBoardColor());
		mav.addObject("boardTitle", info.getBoardTitle());
		mav.setViewName("grp_board/grp_article_modify");
		return mav;
	}
	
	@RequestMapping(value = "/grp_article_view", method = RequestMethod.GET)
	public ModelAndView getArticleView(@ModelAttribute ArticleVO avo,HttpSession session) {
		
		BoardVO info = articleSrv.getBoardInfo(avo.getBoardCode());
		articleSrv.hitUp(avo.getBoardCode(), avo.getAid(),session);
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("list", articleSrv.getArticleInfo(avo));
		mav.addObject("boardCode", avo.getBoardCode());
		mav.addObject("boardColor", info.getBoardColor());
		mav.addObject("boardTitle", info.getBoardTitle());
		mav.setViewName("grp_board/grp_article_view");
		return mav;
	}
	
	@RequestMapping(value = "/grp_article_download", method = RequestMethod.GET)
	public void fileDown(
			@ModelAttribute ArticleVO avo,
			HttpServletRequest request, 
			HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("UTF-8");
		ArticleVO vo = articleSrv.getArticleInfo(avo);

		// 파일 업로드된 경로
		try {
			String fileUrl = vo.getFileUrl();
			fileUrl += "/";
			String savePath = fileUrl;
			String fileName = vo.getFileName();

			// 실제 내보낼 파일명
			String oriFileName = vo.getFileOriName();
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";

			// 파일을 읽어 스트림에 담기
			try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}

			client = request.getHeader("User-Agent");

			// 파일 다운로드 헤더 지정
			response.reset();
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Description", "JSP Generated Data");

			if (!skip) {
				// IE
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
					// IE 11 이상.
				} else if (client.indexOf("Trident") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else {
					// 한글 파일명 처리
					response.setHeader("Content-Disposition",
							"attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
				}
				response.setHeader("Content-Length", "" + file.length());
				os = response.getOutputStream();
				byte b[] = new byte[(int) file.length()];
				int leng = 0;
				while ((leng = in.read(b)) > 0) {
					os.write(b, 0, leng);
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
			}
			in.close();
			os.close();
		} catch (Exception e) {
			System.out.println("ERROR : " + e.getMessage());
		}

	}
	
	@RequestMapping(value = "/grp_article_modify", method = RequestMethod.POST)
	public String setArticleModify(@ModelAttribute ArticleVO avo, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		
		if (files.isEmpty()) { // 업로드할 파일이 없을 시
			articleSrv.setArticleModify(avo);
			
		} else {
			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "c://upload//fileUpload//";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

				destinationFile.getParentFile().mkdirs();
				files.transferTo(destinationFile);
	
				avo.setFileName(destinationFileName);
				avo.setFileOriName(fileName);
				avo.setFileUrl(fileUrl);
			articleSrv.setArticleModify(avo);
		}
		
		return "redirect:/article/grp_article_list?boardCode="+avo.getBoardCode();
	}
	
	@RequestMapping(value="/grp_article_reply", method = RequestMethod.GET)
	public ModelAndView	getArticleReply(@ModelAttribute ArticleVO avo) {
		
		ModelAndView mav = new ModelAndView();
		BoardVO info = articleSrv.getBoardInfo(avo.getBoardCode());
		
		mav.addObject("list", articleSrv.getArticleInfo(avo));
		mav.addObject("boardCode", avo.getBoardCode());
		mav.addObject("boardColor", info.getBoardColor());
		mav.addObject("boardTitle", info.getBoardTitle());
		mav.setViewName("/grp_board/grp_article_reply");
		return mav;
	}
	
	@RequestMapping(value="/grp_article_reply", method = RequestMethod.POST)
	public String setArticleReply(@ModelAttribute ArticleVO avo, @RequestPart MultipartFile files) throws IllegalStateException, IOException {
		//첨부파일 존재여부 (예외처리)
				if( files.isEmpty()) { //첨부파일 없을경우
					articleSrv.setArticleReply(avo);
					
				}else { //첨부파일 있는 경우
					
					String fileUrl = "C://upload//article//"; //첨부파일 저장 위치("\"는 쓰지말고 "/" <- 쓰기)
					String fileName = files.getOriginalFilename(); // 첨부파일 이름
					String fileNameEx = FilenameUtils.getExtension(fileName).toLowerCase(); // 파일 중복 방지
					System.out.println(fileName);
					
					File desFile;
					String desFileName;
					
					do {
						desFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameEx;
						desFile = new File(fileUrl + desFileName);
						
					}while(desFile.exists());
						desFile.getParentFile().mkdirs(); //폴더생성
						files.transferTo(desFile);
					
						avo.setFileName(desFileName);
						avo.setFileOriName(fileName);
						avo.setFileUrl(fileUrl);
						
						articleSrv.setArticleReply(avo);
				}
				
				return "redirect:/article/grp_article_list?boardCode=" + avo.getBoardCode();
				//""안의 값은 고정값이고 뒤는 변하는 값
	}
}
