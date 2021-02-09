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
				window.location.reload();
			},
			error	: function() {
				alert("관리자에게 문의하세요.");
			},
			complete : function() {}
		});
	}
    
}