<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/include/HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
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
    
    input, .title, select {
	    width:100%;
	    height:50px;
	    margin-bottom:20px;
	    padding:10px;
	    font-size:16px;
	    color:#000;
	    border:1px solid #cdcdcd; 
	    border-radius:2px; 
    }
    input::placeholder {
	  color: #c0c4cc;
	}
    .btn-on {
	    display:inline-block;
	    width:100%;
	    height:50px;
	    background-color:#6B8BB5;
	    border-radius:5px;
	    color:#fff;
	    font-size: 18px;
	    font-weight: 700;
	}


	.sign-up {
		margin-top: 30px;
	    font-size: 16px;
	    color: #938d8d;
	    text-align: center;
	}
	
	.photo img {
		position: absolute;
	    top: 62%;
	    left:30%;
	    transform:translate(-50%, -50%);
		width:150px;
		height:250px;
	}
	
	.photo2 img {
		position: absolute;
	    top: 62%;
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
    		<img src="${pageContext.request.contextPath}/images/woman.png">
    	</div>
        <div class="login-box">
        	<div class="login-name">Login</div>
        	<div style="text-align:center;margin-bottom:10px;color:tomato;">${msg}</div>
            <form method="post" action="${pageContext.request.contextPath}/grp_login" autocomplete="off">
                <input type="text" name="empNumber" id="empNumber" placeholder="사원번호를 입력하세요." required  autofocus>
                <input type="password" name="empPwd" id="empPwd" placeholder="비밀번호를 입력하세요."  required>
                <div class="">
                    <button type="submit" class="btn-on" id="btn" style="font-size:18px;font-family: 'Mulish', sans-serif;cursor:pointer">LOGIN</button>
                </div>
                <div class="register-wrap">
                    <div class="sign-up" style="display:flex;justify-content:center;">
                    	<p style="font-size:16px;margin-right:5px;">아직 계정이 없으신가요?</p>
                        <a style="font-size:16px; color:#6B8BB5;font-weight:700;" href="${pageContext.request.contextPath}/grp_register">Sign Up</a>
                    </div>                   
                </div>
            </form>
        </div>
        <div class="photo2">
    		<img src="${pageContext.request.contextPath}/images/man.png">
    	</div>
    </div>
</body>
</html>