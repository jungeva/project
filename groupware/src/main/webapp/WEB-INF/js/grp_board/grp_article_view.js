function addComment(){
		if($("#comment").val() == '') {
			alert("내용을 입력해주세요.");
			$("#comment").focus();
			return false;
		}

		$.ajax({
			url		: "/groupware/comment/grp_comment_add",
			type	: "POST",
			data	: $("#frm").serialize(),
			success	: function(resData) {
				alert("댓글이 등록되었습니다.");
				commentList();
				$("#comment").val('');
			},
			error	: function() {
				alert("관리자에게 문의하세요.");
			},
			complete : function(){}
		});
	}

	function commentList() {
		$.ajax({
			url		: "/groupware/comment/grp_comment_list",
			type	: "POST",
			data	: $("#frm").serialize(),
			success	: function(resData) {

				var a ='';
				$.each(resData.list, function(key, value) {
					a += '<div>';
	                	a += '<div class="flex flex-justify">';
	                    	a += '<div style="width:4%;">';
	                    		a += '<span style="width:60px;height:60px;background-color:#29558a;display: inline-block;line-height: 70px;text-align: center;border-radius:50%;">';
	                    			a += '<i class="fas fa-user white" style="font-size: 25px;"></i>';
	                    		a += '</span>';
	                    	a += '</div>';
	                    	a += '<div style="width:96%;">';
                    			a += '<div class="flex">';
		                    		a += '<div style="font-size:14px;">'+ value.who +'</div>';
		                    		a += '<div style="color:#777;margin-left:10px;font-size:14px;">'+ value.regdate +'</div>';
		                    	a += '</div>';
		                    	a += '<div class="commentContent'+value.cid+'">';
			                    	a += '<div class="font14" style="width:100%;height:100px;padding-top:10px;padding-left:10px;">'+ value.comment +'</div>';
			                    	a += '<div style="text-align:right;">';	                    		
			                    		a += '<button class="m-btn-on" style="margin-right:5px;" onClick="updateComment('+value.cid+', \''+value.comment+'\');">수정</button>';
			                    		a += '<button class="m-btn-off" onClick="deleteComment('+value.cid+');">삭제</button>';
			                    	a += '</div>';
	                    	a += '</div>';
	                    	a += '</div>';
	                    a += '</div>';
                a += '</div>';

				});

				var b ='';
				b += '<div class="font16" style="margin-bottom:20px;">댓글 '+ resData.count +'개</div>';
				
				$("#commentList").html(b+a);
			},
			error	: function() {
				alert("관리자에게 문의하세요.");
			},
			complete : function(){}
		});
	}
	$(function(){ 
		commentList();
	});

	function deleteComment(cid) {
		var msg = "선택하신 댓글을 삭제하시겠습닉까?";

		if( confirm(msg) ) {
			var formData = {
					cid : cid,
					boardCode : $("#boardCode").val()
			}

			$.ajax({
				url		: "/groupware/comment/grp_comment_delete",
				type	: "POST",
				data	: formData,
				success	: function(resData) {
					alert("댓글이 삭제되었습니다.");
					commentList();
				},
				error	: function() {
					alert("관리자에게 문의하세요.");
				},
				complete : function(){}
			});
		}
	}

	function updateComment(cid,comment) {
		a = '';
		a += "<div>";
			a += '<textarea name="comment_'+cid+'" class="p10 font14" style="border:1px solid #e7e7e7;width:100%;height:100px;margin-top:10px;">'+comment+'</textarea>';
		a += "</div>";
		a += '<div style="text-align:right;margin-top:10px;">';	                    		
			a += '<button class="m-btn-on" style="margin-right:5px;margin-bottom:5px;" onClick="saveComment('+cid+')">저장</button>';
		a += '</div>';

		$(".commentContent" + cid).html(a);
	}

	function saveComment(cid) {

		var formData = {
				cid : cid,
				boardCode : $("#boardCode").val(),
				comment : $("[name = comment_"+ cid +"]").val()
		}
		
		$.ajax({
			url		: "/groupware/comment/grp_comment_updateSave",
			type	: "POST",
			data	: formData,
			success	: function(resData) {
				alert("댓글이 수정되었습니다.");
				commentList();
			},
			error	: function() {
				alert("관리자에게 문의하세요.");
			},
			complete : function(){}
		});
	}
function deleteOne(boardCode,aid) {
	var msg = "삭제 후 복원 불가합니다.\n게시물을 삭제하시겠습니까?";

	if(confirm(msg)) {
		$.ajax({
			url		: "/groupware/article/grp_article_deleteOne",
			type	: "POST",
			data	: {	
				aid 	  : aid,
				boardCode : boardCode
			},
			success	: function(resData) {
				alert("게시물이 삭제되었습니다.");
				location.href='/groupware/article/grp_article_list?boardCode='+boardCode;
			},
			error	: function() {
				alert("관리자에게 문의하세요.");
			},
			complete : function() {}
		});
	}
}
	