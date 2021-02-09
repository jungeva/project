package com.project.groupware.service.boardSrv;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.project.groupware.model.BoardVO;
import com.project.groupware.repository.boardDao.BoardDao;

@Service
public class BoardSrv {
	
	@Autowired
	BoardDao boardDao;
	
	public void setBoard(BoardVO bvo) {
		boardDao.setBoard(bvo);
	}
	
	public void createArticleTbl(String boardCode) {
		boardDao.createArticleTbl(boardCode);
	}
	
	public void createCommentTbl(String boardCode) {
		boardDao.createCommentTbl(boardCode);
	}
	
	public List<BoardVO> getBoardList(int start, int end, String searchOpt, String words) {
		return boardDao.getBoardList(start,end,searchOpt,words);
	}
	
	public int boardCodeChk(String boardCode) {
		return boardDao.boardCodeChk(boardCode);
	}
	
	public void boardDelete(String boardCode) {
		boardDao.boardDelete(boardCode);
	}
	
	public void boardDeleteAll(String boardCode) {
		boardDao.boardDeleteAll(boardCode);
	}
	
	public void dropArticleTbl(String boardCode) {
		boardDao.dropArticleTbl(boardCode);	
	}
	
	public void dropCommentTbl(String boardCode) {
		boardDao.dropCommentTbl(boardCode);
	}
	
	public BoardVO getBoardInfoOne(String boardCode) {
		return boardDao.getBoardInfoOne(boardCode);
	}
	
	public void setBoardModify(BoardVO bvo) {
		boardDao.setBoardModify(bvo);
	}
	
	public int getBoardCount(String searchOpt, String words) {
		return boardDao.getBoardCount(searchOpt,words);
	}

}
