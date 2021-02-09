<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groupware</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link href="https://fonts.googleapis.com/css2?family=Megrim&display=swap" rel="stylesheet">


    <script src="https://kit.fontawesome.com/beac665ab2.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<style>
	body {
		width:100%;
		height:100vh;
	}
    .headline {
        width:100%;       
        height:70px;
        line-height: 70px;
        background-color:#fff;
    }

    .bg {
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        width:100%;
        height:450px;
    }
    
    .darkblue {
		color:#4C84B7;
	}

    .firstPage-content {
        text-align:center;
        padding:150px;
        color:#fff;
    }

    .firstPage-content h2 {
        font-size: 25px;
        margin-bottom:20px;  
    }

    .firstPage-content h3 {
        font-size: 70px;      
    }

    .vision-one{
        width:24.5%;
        height:200px;
        padding:20px;
    }

    .number {
        color:#4C84B7;
        font-size: 40px;
        font-weight: 700;
    }

    .footer-menu {
        height: 50px; 
        background-color: rgb(59,59,59); 
        line-height: 50px;
        border-top:1px solid #5454;
        border-bottom:1px solid #434343;
        padding-left: 40px;
    }

    .footer-menu a {
        color:#fff;
        margin:0 10px;
        cursor: pointer;
    }

    .footer-content {
        background-color: #333;
        height:cal(100vh-600px);
        padding-top:30px;
        padding-bottom:30px;
        padding-left: 50px;
    }

</style>
<body>
    <div class="login p5 m-lr10 right" style="border-bottom:1px solid #ccc;">
        <c:if test="${sessionScope.empName == null}">
        	<a href="${pageContext.request.contextPath}/grp_login" class="font14 m-lr10">그룹웨어로 접속</a>
    	</c:if>
    	<c:if test="${sessionScope.empName != null}">
    		<a href="${pageContext.request.contextPath}/grp_admin_main" class="font14 m-lr10">그룹웨어로 접속</a>
        	<a href="${pageContext.request.contextPath}/grp_logout" class="font14 m-lr10">Logout</a>
    	</c:if>
    	
    </div>
    <div class="headline p-lr20">
        <div class="head-left flex flex-justify p-lr20">
            <div class="logo flex weight700" style="padding-top: 18px">                
                <img src="${pageContext.request.contextPath}/${logo}" style="width:100px;height:40px;"/>
            </div>
            <div class="navbar ">
                <ul class="flex flex-justify">
                	<c:forTokens items="${mainMenu}" delims="," var="menu">
                    	<li class="font18 weight700" style="margin:0 30px;">${menu}</li>
                	</c:forTokens>
                </ul>
            </div>
            <div class=""></div>
        </div>        
    </div>
    <div id="page">
        <div class="">
            <div class="bg" style="background-image: url(images/main2.jpg);">
                <div class="firstpage-wrap">
                    <div class="firstPage-content m-tb10">
                        <h3 class="">${title}</h3>
                        <p class="" style="font-size:20px;letter-spacing:2px;">${subtitle}</p>
                    </div>
                </div>
            </div>
            <div class="vision-wrap p20 m-t20">
                <div class="vision-title center p20 m-b20" style="line-height: 1.5;">
                    <h2 style="font-size:40px;color:#4C84B7;">Creative & Business</h2>
                    <p class="font16">새로운 성장과 혁신으로 대한민국 대표기업으로 성장하는 SMART GLOBAL이 되겠습니다.</p>
                </div>
                <div class="vision flex flex-justify" style="margin-bottom:30px;">
                    <div class="vision-one" style="border-right:1px solid #cdcdcd;">
                        <div class="vision-title center">
                            <span class="number">01</span>
                        </div>
                        <div class="vision-content center"  style="line-height:1.7;">
                            <h4 class="font20 weight700 darkblue">정직(Integruty)</h4>
                            <p class="font14">언제나 바르게 생각하고 바르게<br/> 행동하며 서로에게 솔직하게 행동</p>
                        </div>
                    </div>
                    <div class="vision-one"  style="border-right:1px solid #cdcdcd;">
                        <div class="vision-title center">
                            <span class="number">02</span>
                        </div>
                        <div class="vision-content center"  style="line-height:1.7;">
                            <h4 class="font20 weight700 darkblue">안전(Safty)</h4>
                            <p class="font14">인간존중을 바탕으로<br/> 안전을 최우선으로 생각하고 행동</p>
                        </div>
                    </div>
                    <div class="vision-one"  style="border-right:1px solid #cdcdcd;">
                        <div class="vision-title center">
                            <span class="number">03</span>
                        </div>
                        <div class="vision-content center"  style="line-height:1.7;">
                            <h4 class="font20 weight700 darkblue">탁월(Excellence)</h4>
                            <p class="font14">끊임없는 혁신을 추구하여<br/> 모든 사업의 탁월성을 창조</p>
                        </div>
                    </div>
                    <div class="vision-one">
                        <div class="vision-title center">
                            <span class="number">04</span>
                        </div>
                        <div class="vision-content center">
                            <h4 class="font20 weight700 darkblue">고객(Customer)</h4>
                            <p class="font14">시스템의 운영에서<br/> 항상 고객의 성공을 위해 헌신</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="second flex" style="background-color:#F4F7FA;justify-content:center;padding:50px;">
                <div class="notice flex p10 m-lr20" m-lr20>
                    <div class="notice-title  m-lr10">
                        <p class="weight700 font20" style="color:#555;">공지사항</p>
                        <span class="">
                            <p class="m-tb5"><a herf="#">더보기 ></a></p>
                        </span>
                    </div>
                    <div class="notice-content"> 
                        <table style="line-height: 1.8;">
                            <tr class="center font14">
                                <td class="p-lr10 left ">소방훈련 일정 및 대피도 확인해주세요.</td>
                                <td>2020-09-09</td>
                            </tr>
                            <tr class="center font14">
                                <td class="p-lr10 left">풍성한 한가위되세요.</td>
                                <td>2020-09-09</td>
                            </tr>
                            <tr class="center font14">
                                <td class="p-lr10 left ">소방훈련 일정 및 대피도 확인해주세요.</td>
                                <td>2020-09-09</td>
                            </tr>
                            <tr class="center font14">
                                <td class="p-lr10 left ">소방훈련 일정 및 대피도 확인해주세요.</td>
                                <td>2020-09-09</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="news flex p10  m-lr20">
                    <div class="notice-title  m-lr10">
                        <p class="weight700 font20" style="color:#555;">새소식</p>
                        <span class="">
                            <p class="m-tb5"><a herf="#">더보기 ></a></p>
                        </span>
                    </div>
                    <div class="notice-content"> 
                        <table style="line-height: 1.8;">
                            <tr class="center font14">
                                <td class="p-lr10 left ">소방훈련 일정 및 대피도 확인해주세요.</td>
                                <td>2020-09-09</td>
                            </tr>
                            <tr class="center font14">
                                <td class="p-lr10 left">풍성한 한가위되세요.</td>
                                <td>2020-09-09</td>
                            </tr>
                            <tr class="center font14">
                                <td class="p-lr10 left ">소방훈련 일정 및 대피도 확인해주세요.</td>
                                <td>2020-09-09</td>
                            </tr>
                            <tr class="center font14">
                                <td class="p-lr10 left ">소방훈련 일정 및 대피도 확인해주세요.</td>
                                <td>2020-09-09</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<footer>
    <div class="footer-wrap white">
        <div class="footer-menu">
            <span><a herf="">회사소개</a></span>
            <span>|</span>
            <span><a herf="#">개인정보처리방침</a></span>
            <span>|</span>
            <span><a herf="#">이용약관</a></span>
        </div>
        <div class="footer-content">
            <div class="footer-address">
                <span><strong>주소</strong> : ${address}  |<strong>  대표회사명</strong> : ${name} |  <strong>전화</strong> : ${tel} |  <strong>팩스</strong> : ${fax}</span>
            </div>
            <div class="footer-copy" >
                <span>${copy}</span>
            </div>
        </div>
    </div>
</footer>
</html>