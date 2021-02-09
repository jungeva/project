	//address
	function popup(boardCode) {
        $('.layerpop').css("position", "absolute");
        //레이어 화면에 배치하기 위한 좌표값
        $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 3) + $(window).scrollTop());
        $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
        $('#layerbox').css("display", "block");

        $.ajax({
            url		: "/groupware/board/grp_board_info",
            type	: "POST",
            data	: {
                boardCode : boardCode
            },
            success : function(resData) {
            	$("#pop_boardGrp").val(resData.boardGrp);
            	$("#pop_boardCode").val(resData.boardCode);
            	$("#pop_boardColor").val(resData.boardColor);
            	$("#pop_boardMaker").val(resData.boardMaker);
            	$("#pop_boardTitle").val(resData.boardTitle);
            	$("#pop_boardType").val(resData.boardType);
            	$("#pop_boardRead").val(resData.boardRead);
            	$("#pop_boardWrite").val(resData.boardWrite);
            	$("#pop_boardReply").val(resData.boardReply);
            	$("#pop_boardDownload").val(resData.boardDownload);
            },
            error	: function() {
                alert("시스템 오류");
            },
            complete : function() {}
        });
    }

    function popup_close() {
        $('#layerbox').css("display", "none");
    }
    
    //한글이 못들어가게 하기
	$(function() {
		$("#boardCode").keyup(function() { //키보드 입력 이벤트
			//영어만 가능한 정규식(정규표현식)
			$(this).val( $(this).val().replace(/[0-9]|[^\!-z]/gi,"") );//영어만 가능하고 그외 아닌것은 지운다
		}); 
	}); 
			
	/*부서 select*/
    function loadDepartment() {
    	$.ajax({
    		url		: "/groupware/grp_get_department",
    		type	: "POST",
    		data	: "",
    		contentType : "application/x-www-form-urlencoded; charset=utf-8",
    		dataType : "json",
    		success : function(resData) {
    			$.each(resData, function(key, value){
    				$(".boardGrp").append("<option value="+value.department_id+">"+ value.department_name +"</option>");
    			});
    		},
    		error	: function() {
    			alert("시스템 에러");
    		},
    		complete : function() {}
    	});
    }
    $(function(){
    	loadDepartment();
    });

    //board 색상변경
    $(function() {
        $("#boardColor").change(function(){
            $("#rowColor").css({
                backgroundColor : this.value
            });
        });

        $("#pop_boardColor").change(function(){
            $(".pop_rowColer").css({
                backgroundColor : this.value
            });
        });
    });

    //데이터저장
    $(function(){
        $("#btn").click(function(){
            var a = $("#boardCode").val();
            var b = $("#boardTitle").val();

            if( a == '') {
                alert("게시판코드를 입력하세요.");
                $("#boardCode").focus();
                return false;
            }

            if( b == '') {
                alert("게시판제목을 입력하세요.");
                $("#boardTitle").focus();
                return false;
            }

            $.ajax({
                url		: "/groupware/board/grp_board_insert",
                type	: "POST",
                data	: $("#frm").serialize(),
                success : function(resData) {
                    alert(a + "게시판 및 댓글게시판이 생성되었습니다.");
                    window.location.reload();
                },
                error	: function() {
                    alert("시스템 오류");
                },
                complete : function() {}
            });
        });
    });

    function boardCodeChk() {
    	$.ajax({
            url		: "/groupware/board/grp_board_codeChk",
            type	: "POST",
            data	: {
                boardCode : $("#boardCode").val()
            },
            success : function(resData) {
                if( resData == "failure") {
                    alert("사용할 수 없는 코드입니다.");
                    $("#boardCode").val('');
                    $("#boardCode").focus();
                }
            },
            error	: function() {
                alert("시스템 오류");
            },
            complete : function() {}
        });
    }

	//개별삭제
    function boardDelete(boardCode) {       
    	var msg ="삭제 후 복구는 불가능합니다.\n선택하신 게시판 및 게시판댓글을 삭제하시겠습니까?";

    	if( confirm(msg)) {

    		$.ajax({
                url		: "/groupware/board/grp_board_delete",
                type	: "POST",
                data	: {
                    boardCode : boardCode
                },
                success : function(resData) {
                	alert("선택하신 게시판 & 댓글이 삭제되었습니다.");
    				window.location.reload();
                },
                error	: function() {
                    alert("시스템 오류");
                },
                complete : function() {}
            });
        }
    }

    function deleteAll() {
        var msg = "삭제 후 복구는 불가능합니다.\n선택하신 게시판 및 게시판댓글을 삭제하시겠습니까?"
        if( confirm(msg) ) {
            var chkArray = new Array();
            $(".chk:checked").each(function(){
                chkArray.push( $(this).attr("data-uid"));
            });
        }

        $.ajax({
            url		: "/groupware/board/grp_board_deleteAll",
            type	: "POST",
            data	: { chkArray : chkArray},
            success	: function(resData) {
                alert("선택하신 게시판 & 댓글이 삭제되었습니다.");
                window.location.reload();
            },
            error	: function() {
                alert("관리자에게 문의하세요.");
            },
            complete : function() {}
        });
    }

    function boardModify() {
    	$.ajax({
            url		: "/groupware/board/grp_board_modify",
            type	: "POST",
            data	: $("#pop_frm").serialize(),
            success : function(resData) {
                alert("게시판 및 댓글게시판이 수정되었습니다.");
                window.location.reload();
            },
            error	: function() {
                alert("시스템 오류");
            },
            complete : function() {}
        });
    }
    
    //클릭시 다 체크되는 자바스크립트
	var flag = false;
	function chkAll() {

		var chk = document.getElementsByName("chk"); //화면에서 name="chk"인 요소를 가져와라
		if (flag == false) { //선택x
			flag = true;
			for( var i =0; i < chk.length; i++) {
				chk[i].checked = true;
			}
		}else {
			flag = false;
			for( var i =0; i < chk.length; i++) {
				chk[i].checked = false;
			}
		}
		
	}