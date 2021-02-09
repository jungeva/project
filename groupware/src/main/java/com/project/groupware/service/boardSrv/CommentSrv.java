package com.project.groupware.service.boardSrv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.model.CommentVO;
import com.project.groupware.repository.boardDao.CommentDao;

@Service
public class CommentSrv {
	
	@Autowired
	CommentDao commentDao;
	
	public void setAddComment(CommentVO cvo) {
		commentDao.setAddComment(cvo);
	}
	
	public List<CommentVO> getCommentList(CommentVO cvo) {
		return commentDao.getCommentList(cvo);
	}
	
	public void deleteComment(CommentVO cvo) {
		commentDao.deleteComment(cvo);
	}
	
	public void updateSaveComment(CommentVO cvo) {
		commentDao.updateSaveComment(cvo);
	}
	
	public int commentCount(CommentVO cvo) {
		return commentDao.commentCount(cvo);
	}

}
