package com.project.groupware.repository.boardDao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.groupware.model.ArticleVO;
import com.project.groupware.model.BoardVO;

@Repository
public class ArticleDao {
	
	@Autowired
	SqlSession sqlSession;
	
	public BoardVO getBoardInfo(String boardCode) {
		return sqlSession.selectOne("article.getBoardInfo",boardCode);
	}
	
	public List<ArticleVO> getArticleList(String boardCode, int start, int end, String searchOpt, String words) {
		Map<String , Object> map =new HashMap<String, Object>();

		map.put("boardCode", boardCode);
		map.put("start", start);
		map.put("end", end);
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		return sqlSession.selectList("article.getArticleList",map);
	}
	
	public void setArticleAdd(ArticleVO avo) {
		sqlSession.insert("article.setArticleAdd",avo);
	}
	
	public int getArticleCount(String boardCode, String searchOpt, String words) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCode", boardCode);
		map.put("searchOpt", searchOpt);
		map.put("words", words);
		return sqlSession.selectOne("article.getArticleCount",map);
	}
	
	public int totalArticleCnt(String boardCode) {
		return sqlSession.selectOne("article.totalArticleCnt",boardCode);
	}
	
	public void ArticleDeleteOne(ArticleVO avo) {
		sqlSession.delete("article.ArticleDeleteOne",avo);
	}
	
	public ArticleVO getArticleInfo(ArticleVO avo) {
		return sqlSession.selectOne("article.getArticleInfo",avo);
	}
	
	public void setArticleModify(ArticleVO avo) {
		sqlSession.update("article.setArticleModify",avo);
	}
	
	public void hitUp(String boardCode, int aid) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("boardCode", boardCode);
		map.put("aid", aid);
		sqlSession.update("article.hitUp",map);
	}
	
	public void setArticleReply(ArticleVO avo) {
		sqlSession.insert("article.setArticleReply",avo);
	}
	
	public void articleReplyOrder(ArticleVO avo) {
		sqlSession.update("article.articleReplyOrder",avo);
	}
	
	public ArticleVO articleReplyInfo(String boardCode, int aid) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("boardCode", boardCode);
		map.put("aid", aid);
		return sqlSession.selectOne("article.articleReplyInfo",map);
	}


	

}
