package com.project.groupware.controller.boardCtr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.groupware.model.BoardVO;
import com.project.groupware.paging.Pager;
import com.project.groupware.service.boardSrv.BoardSrv;

@Controller
@RequestMapping("/board")
public class BoardCtr {
	
	@Autowired
	BoardSrv boardSrv;
	
	@RequestMapping("/grp_board_main")
	public ModelAndView getBoardMain(
			@RequestParam(defaultValue="1") int curPage, 
			@RequestParam(defaultValue = "boardGrp") String searchOpt, 
			@RequestParam(defaultValue = "" ) String words) {
		
		ModelAndView mav = new ModelAndView();
		int count = boardSrv.getBoardCount(searchOpt, words);
		
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		BoardVO bvo = new BoardVO();
				
		List<BoardVO> list = boardSrv.getBoardList(start, end, searchOpt, words);
		
		mav.addObject("list", list);
		mav.addObject("searchCount", count);
		mav.addObject("searchOpt", searchOpt);
		mav.addObject("words", words);
		mav.addObject("department_name", bvo.getDepartment_name());
		mav.setViewName("/grp_board/grp_board_main");
		
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
	
	@RequestMapping("/grp_board_info")
	@ResponseBody
	public BoardVO  getBoardInfoOne (String boardCode) {
		return boardSrv.getBoardInfoOne(boardCode);
	}
	
	@RequestMapping("/grp_board_insert")
	@ResponseBody
	public void setBoard(@ModelAttribute BoardVO bvo) {
		boardSrv.setBoard(bvo);
		boardSrv.createArticleTbl(bvo.getBoardCode());
		boardSrv.createCommentTbl(bvo.getBoardCode());
	}
	
	@RequestMapping("/grp_board_codeChk")
	@ResponseBody
	public String boardCodeChk(String boardCode) {
		int count = boardSrv.boardCodeChk(boardCode);
		
		String msg;
		if( count > 0 ) msg = "failure";
		else  msg = "success";
		return msg;
	}
	
	@RequestMapping("/grp_board_delete")
	@ResponseBody
	public void boardDelete(String boardCode) {
		boardSrv.dropCommentTbl(boardCode);
		boardSrv.dropArticleTbl(boardCode);
		boardSrv.boardDelete(boardCode);		
	}
	
	@RequestMapping("/grp_board_deleteAll")
	@ResponseBody
	public String boardDeleteAll(@RequestParam (value="chkArray[]") List<String> chkArray) {
		
		for(String boardCode : chkArray) {
			boardSrv.dropCommentTbl(boardCode);
			boardSrv.dropArticleTbl(boardCode);
			boardSrv.boardDeleteAll(boardCode);
		}
		return "success";		
	}
	
	
	
	@RequestMapping("/grp_board_modify")
	@ResponseBody
	public void boardModify(@ModelAttribute BoardVO bvo) {
		boardSrv.setBoardModify(bvo);
	}
	
}
