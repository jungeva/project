package com.project.groupware.service.boardSrv;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.groupware.model.ArticleVO;
import com.project.groupware.model.BoardVO;
import com.project.groupware.repository.boardDao.ArticleDao;

@Service
public class ArticleSrv {
	
	@Autowired
	ArticleDao articleDao;
	
	public BoardVO getBoardInfo(String boardCode) {
		return articleDao.getBoardInfo(boardCode);
	}
	
	public List<ArticleVO> getArticleList(String boardCode, int start, int end, String searchOpt, String words) {
		return articleDao.getArticleList(boardCode, start,end,searchOpt,words);
	}
	
	public void setArticleAdd(ArticleVO avo) {
		
		String subject = avo.getSubject(); //데이터변환
		subject.replace("<", "&lt;");
		subject.replace(">", "&gt;");
		subject.replace(" ", "&nbsp;"); //불필요한 띄어쓰기
		subject.replace("\n", "<br />");
		avo.setSubject(subject);// 변경된값을 다시 MODEL저장
		
		articleDao.setArticleAdd(avo);
	}
	
	public int getArticleCount(String boardCode, String searchOpt, String words) {
		return articleDao.getArticleCount(boardCode, searchOpt, words);
	}
	
	public int totalArticleCnt(String boardCode) {
		return articleDao.totalArticleCnt(boardCode);
	}
	
	public void ArticleDeleteOne(ArticleVO avo) {
		articleDao.ArticleDeleteOne(avo);
	}
	
	public ArticleVO getArticleInfo(ArticleVO avo) {
		return articleDao.getArticleInfo(avo);
	}
	
	public void setArticleModify(ArticleVO avo) {
		articleDao.setArticleModify(avo);
	}
	
	public void hitUp(String boardCode, int aid, HttpSession session) {
		
		long getSessionTime = 0;
		if (session.getAttribute("getSessionTime_" + aid) != null)
			getSessionTime = (Long) session.getAttribute("getSessionTime_" + aid);

		long getCurrentTime = System.currentTimeMillis();
		if ((getCurrentTime - getSessionTime) > 1000*60*60*24) {
			articleDao.hitUp(boardCode, aid);
			session.setAttribute("getSessionTime_" + aid, getCurrentTime);
		}
		
	}
	
	public void articleReplyOrder(ArticleVO avo) {
		articleDao.articleReplyOrder(avo);
	}
	
	public ArticleVO articleReplyInfo(String boardCode, int aid) {
		return articleDao.articleReplyInfo(boardCode, aid);
	}
	
	public void setArticleReply(ArticleVO avo) {
		ArticleVO vo = articleDao.articleReplyInfo(avo.getBoardCode(),avo.getAid());
		avo.setRef(vo.getRef());
		avo.setRe_step(vo.getRe_step());
		avo.setRe_level(vo.getRe_level());
		
		articleDao.articleReplyOrder(avo);
		articleDao.setArticleReply(avo);
	}
	
}
