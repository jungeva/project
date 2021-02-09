<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/include/HEADER.jsp" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@900&family=Mulish:wght@500&display=swap" rel="stylesheet">
<style>
	.logo {
		float:left;
		padding:30px;
	}
	
	.logo img {
		width:150px;
		height:75px;
	}
	.login-box {
        width:500px;
        padding:70px 40px;
	    background-color: #fff;
	    border-radius: 6px;
    }
    .login-name {
	    font-family: 'Merriweather', serif;
	    font-size: 30px;
	    line-height: normal;
	    font-weight: 900;
	    color: #4a4a4a;
	    text-align: center;
	    margin-bottom: 30px;
    }
    
    input, select {
	    height:50px;
	    margin-bottom:20px;
	    padding:10px 20px;
	    font-size:16px;
	    color:#000;
	    border:1px solid #cdcdcd; 
	     /*border-radius:2px;*/
    }
     .title{
     	width:150px;
     	height:50px;
	    margin-bottom:20px;
	    padding:10px 20px;
	    font-size:16px;
	    color:#000;
	    border:1px solid #cdcdcd; 
	    /*border-radius:2px;*/
	    background-color:#fff;
	    border-right-color:transparent;
     }
     
     
	.btn-off {
	    display:inline-block;
	    width:100%;
	    height:50px;
	    border-radius:2px;
	    border:1px solid #cdcdcd; 
	    color:#333;
	    font-size: 18px;
	    font-weight: 700;
	    background-color:#fff;
	}
	
	.photo img {
		position: absolute;
	    top:78%;
	    left:30%;
	    transform:translate(-50%, -50%);
		width:150px;
		height:150px;
	}
	
	.photo2 img {
		position: absolute;
	    top:72%;
	    left:70%;
	    transform:translate(-50%, -50%);
		width:150px;
		height:250px;
	}
</style>
<body>
    <div class="logo-wrap">
        <h1 class="logo"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/${logo}"/></a></h1>
    </div>
    <div class="login-wrap">
    	<div class="photo">
    		<img src="${pageContext.request.contextPath}/images/dog.png">
    	</div>
        <div class="login-box">
        	<div class="login-name">Sign Up</div>
            <form id="frm" method="post" autocomplete="off">
                <div class="title-wrap">
                    <div class="title">부서선택</div>
                    <select name="empDepartmentCode" id="empDepartmentCode"></select>
                </div>
                <div class="title-wrap">
                    <div class="title">직책선택</div>
                    <select name="empGradeCode"  id="empGradeCode"></select>
                </div>
                <div class="title-wrap">
                    <div class="title">입사년월</div>
                    <input type="date" max="2021-12-31" min="1950-01-01" name="empEnterDate" id="empEnterDate" placeholder="입사년월일을 입력하세요." style="width:68%;" required >
                </div>
                <div class="title-wrap">
                    <div class="title">사원성명</div>
                    <input type="text" name="empName" id="empName" placeholder="사원명를 입력하세요." style="width:68%;" required>
                </div>
                <div class="title-wrap">
                    <div class="title">비밀번호</div>
                    <input type="password" name="empPwd" id="empPwd" placeholder="비밀번호를 입력하세요."style="width:68%;" required>
                </div>
                <div class="title-wrap">
                    <div class="title">비밀번호확인</div>
                    <input type="password" name="rePwd" id="rePwd" placeholder="비밀번호를 입력하세요." style="width:68%;" required>
                </div>  
                <div class="button-wrap">
                    <div class="" style="width:49.5%;">
                        <button type="submit" id="btn" class="btn-on cursor" >Sign Up</button>
                    </div>
                    <div class="cancel" style="width:49.5%;">
                        <button type="button" class="btn-off cursor" onclick="location.href='${pageContext.request.contextPath}/grp_login'">LogIn</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="photo2">
    		<img src="${pageContext.request.contextPath}/images/girl.png">
    	</div>
    </div>
    
</body>

<script>
	function loadDepartment() {
		$.ajax({
			url		: "${pageContext.request.contextPath}/grp_get_department",
			type	: "POST",
			data	: "",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(resData) {
				$.each(resData, function(key, value){
					$("#empDepartmentCode").append("<option value="+value.department_id+">"+ value.department_name +"</option>");
				});
			},
			error	: function() {
				alert("시스템 에러");
			},
			complete : function() {}
		});
	}
	
	function loadGrade() {
		$.ajax({
			url		: "${pageContext.request.contextPath}/grp_get_grade",
			type	: "POST",
			data	: "",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			dataType : "json",
			success : function(resData) {
				$.each(resData, function(key, value){
					$("#empGradeCode").append("<option value="+value.grade_id+">"+ value.grade_name +"</option>");
				});
			},
			error	: function() {
				alert("시스템 에러");
			},
			complete : function() {}
		});
	}
	
	function saveEmployee() {
		$.ajax({
			url 	: "${pageContext.request.contextPath}/grp_register",
			type 	: "POST",
			data 	: $("#frm").serialize(),
			success : function(resData){
				if( resData == "success") {
					alert("사원가입이 완료되었습니다.");
					window.location.href="${pageContext.request.contextPath}/grp_login";
				}
			},
			error 	: function() {
				alert("시스템 에러");
			}
		});
	}
	function checkPwd() {
		var a = $("#empPwd");
		var b = $("#rePwd");
	
		if( a.val().length > 15 || a.val().length < 10 ) {
			alert("비밀번호는 10자리 이상 15자리 이하로 입력하셔야합니다.");
			a.val("");
			a.focus();
			return false;
		}
		if( b.val().length > 15 || b.val().length <10) {
			alert("비밀번호확인은 10자리 이상 15자리 이하로 입력하셔야합니다.");
			b.val("");
			b.focus();
			return false;
		}
	
		if ( a.val() != b.val() ) {
			alert("비밀번호가 다릅니다. 확인하세요.");
			a.val("");
			b.val("");
			a.focus();
			return false;
			
		} 
	}
	
	
	$(function(){
		loadDepartment();
		loadGrade();
	
		$("#btn").click(function(e){
			e.preventDefault();
	
	
			if( $("#empEnterDate").val() == '') {
				alert("입사년월일을  입력하세요.");
				$("#empEnterDate").focus();
				return false;
			}
	
			if( $("#empName").val() == '') {
				alert("사원명을  입력하세요.");
				$("#empName").focus();
				return false;
			}
	
			if( $("#empPwd").val() == '') {
				alert("비밀번호를  입력하세요.");
				$("#empPwd").focus();
				return false;
			}
	
			if( $("#rePwd").val() == '') {
				alert("재확인 비밀번호를  입력하세요.");
				$("#rePwd").focus();
				return false;
			}
			saveEmployee();
		});
	});
</script>
</html>