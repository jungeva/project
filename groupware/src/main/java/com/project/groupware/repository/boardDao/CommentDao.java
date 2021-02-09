package com.project.groupware.repository.boardDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groupware.model.CommentVO;

@Repository
public class CommentDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public void setAddComment(CommentVO cvo) {
		sqlSession.insert("comment.setAddComment",cvo);
	}
	
	public List<CommentVO> getCommentList(CommentVO cvo) {
		return sqlSession.selectList("comment.getCommentList", cvo);
	}
	
	public void deleteComment(CommentVO cvo) {
		sqlSession.delete("comment.deleteComment", cvo);
	}
	
	public void updateSaveComment(CommentVO cvo) {
		sqlSession.update("comment.updateSaveComment", cvo);
	}
	
	public int commentCount(CommentVO cvo) {
		return sqlSession.selectOne("comment.commentCount",cvo);
	}

}
