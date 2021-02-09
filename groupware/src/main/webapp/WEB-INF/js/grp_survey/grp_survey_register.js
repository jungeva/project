 $(function(){
        $("#surveyStartDate, #surveyEndDate").datepicker({
            dateFormat : 'yy-mm-dd'
        });
    
        $("#btn").click(function() {
            if( $("#surveyStartDate").val().trim() == '') {
                alert("설문시작일을 입력해주세요.");
                $("#surveyStartDate").focus();
                return false;
            }

            if( $("#surveyEndDate").val().trim() == '') {
                alert("설문종료일을 입력해주세요.");
                $("#surveyEndDate").focus();
                return false;
            }

            if( $("#surveySubject").val().trim() == '') {
                alert("설문제목을 입력해주세요.");
                $("#surveySubject").focus();
                return false;
            }

            if( $("#surveyExample1").val().trim() == '') {
                alert("설문보기를 입력해주세요.");
                $("#surveyExample1").focus();
                return false;
            }
            
            if( $("#surveyExample2").val().trim() == '') {
                alert("설문보기를 입력해주세요.\n보기는 최소 2개이상 입력해야합니다.");
                $("#surveyExample2").focus();
                return false;
            }

            
            $.ajax({
                url		: "/groupware/survey/grp_survey_create",
                type	: "post",
                data	: $("#frm").serialize(),
                success	: function() {
                    alert("설문이 생성되었습니다.");
                    window.location.href="/groupware/survey/grp_survey_list";
                },
                error	: function() {
                    alert("관리자에게 문의하세요.");
                },
                complete : function() {}
            });
        });
    });

    $(function() {
        var count = 2;
        var max = 5;
        $("#example-plus").click(function() {
            if( count < max ) {
            	count++;
            	$("#example-wrap").append('<div class="example"><span style="line-height:35px;">'+count
                    	    	  +'. </span><input type="text" name="surveyExample" id="surveyExample'+count
                    	    	  +'"autocomplete="off" style="width:50%; margin:2px 0;"/></div>');
            }else {
                alert("설문보기는 최대 5개까지만 가능합니다.");
            }
        });

        $("#example-minus").click(function(){
            if( count < 3 ) {
                alert("설문보기는 최소 2개이상 입력해야합니다.");
                return;
            }else {
                $(".example:last").remove();
                count--;
                return;
            }
        });
    });





	