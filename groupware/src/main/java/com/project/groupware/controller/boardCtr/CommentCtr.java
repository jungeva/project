package com.project.groupware.controller.boardCtr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.groupware.model.CommentVO;
import com.project.groupware.service.boardSrv.CommentSrv;

@Controller
@RequestMapping("/comment")
public class CommentCtr {
	
	@Autowired
	CommentSrv commentSrv;
	
	@RequestMapping("/grp_comment_add")
	@ResponseBody
	public String setAddComment(CommentVO cvo) {
		commentSrv.setAddComment(cvo);
		return "success";
	}
	
	@RequestMapping("/grp_comment_list")
	@ResponseBody
	public Map<String,Object> getCommentList(CommentVO cvo) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		List<CommentVO> list = commentSrv.getCommentList(cvo);
		int count = commentSrv.commentCount(cvo);
		map.put("list", list);
		map.put("count", count);
		return map;
	}
	
	@RequestMapping("/grp_comment_delete")
	@ResponseBody
	public void deleteComment(CommentVO cvo) {
		commentSrv.deleteComment(cvo);
	}
	
	@RequestMapping("/grp_comment_updateSave")
	@ResponseBody
	public void updateSaveComment(CommentVO cvo) {
		commentSrv.updateSaveComment(cvo);
	}

}
