<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<style>

	body {
		color: #333;
	}
   .content-box {
       border:1px solid #eee;
       padding:10px 20px;
   }
   .contents {
       display:none;
   }

    .logo a {
        display: inline-block;
        margin-top: 5px;
    }
    
    .survey_bg {
    	position:absolute; /*포지션을 줘야 원래페이지 위에 만들수 있다.*/
    	top:0;
    	left:0;
    	width:100%;
    	height:100%;
    	background-color: rgba(0,0,0,0.5);
    	display:none;
    }
    
    .survey_box {
    	background-color:#fff;
    	width:500px;
    	position:absolute;
    	top:50%;
    	left:50%;
    	transform:translate(-50%,-50%); /*사각형을 가운데로 정렬시킬려면 */
    }
    
    .votebtn {
    	color:#fff;
    	background-color:#2A558A;
    	width:100%;
    	height:60px;
    	font-size:20px;
    	font-weight:700;
    }
	
.page-active {
     background-color:#29558a;
    color:#fff;
}
</style>
<body>
    <div class="container p10 bg-gray">
        <div class="top-wrap">
            <div class="top  flex flex-justify weight700">
                <!-- include logo -->
                <%@ include file ="/WEB-INF/views/grp_admin_main/ADMIN_LOGO.jsp" %>
                <!-- include logo -->
                <div class="auth-wrap  flex flex-justify font18 weight700 p-lr10 bg-white" style="width:87%">
                    <!-- include auth -->
                    <%@ include file ="/WEB-INF/views/grp_admin_main/ADMIN_AUTH.jsp" %>
                    <!-- include auth -->
                </div>
            </div>
        </div>
        <div class="bottom flex flex-justify m-t10">
            <div class="left-info" style="width:12.4%">
                <!-- include menu -->
                <%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_MENU.jsp" %>
                <!-- include menu -->
            </div>
            <div class="right-info bg-white p10" style="width:87% ">
                <div class="member-info">
                    <div class="title-wrap m-t10">
                        <div class="title">
                            <h3 class="font18 noto ">
                                <i class="fas fa-sticky-note"></i> 설문조사 > 설문게시판
                            </h3>
                        </div>
                        <div class="survey-upload flex flex-justify m-b5 m-t10">
                        	 <div class="btn-normal">진행중 : ${openCnt}개 / 설문완료 : ${closeCnt}개</div>
                        	 <div></div>
                             <button class="btn-on" onClick="location.href='${pageContext.request.contextPath}/survey/grp_survey_register'">설문등록</button>
                        </div>
                    </div>                      
                    <table class=" m-b10 black">
                        <tr class="center bg-darkgray font14 weight700">
                            <td class="td-5">번호</td>
                            <td class="td-7">상태</td>
                            <td class="td-7">결과여부</td>
                            <td>설문제목</td>
                            <td class="td-20">설문기간</td>
                            <td class="td-5">참여자수</td>
                            <td class="td-7">작성자</td>
                            <td class="td-10">비고</td>
                        </tr>
                        <c:forEach items="${open}" var="list" varStatus="status">
	                        <tr class="center font14">
	                            <td>${ (searchCount - status.index) - ( (curPage -1) * end) }</td>
	                            <td>
	                            	<c:set var="state" value="${list.surveyState}" />
	                            	<c:if test="${state eq 'open'}">
	                            		<btton class="m-btn-on" style="background-color:#EA6D56;color:#fff;font-weight:600;">진행중</button>
	                            	</c:if>
	                            	<c:if test="${state eq 'close'}">
	                            		<span style="font-size:12px;">설문완료</span>
	                            	</c:if>
	                            </td>
	                            <td>
	                            	<c:set var="result" value="${list.surveyResult}" />
	                            	<c:if test="${result eq 'Y'}">
	                            		<span >공개</span>
	                            	</c:if>
	                            	<c:if test="${result eq 'N'}">
	                            		<span>비공개</span>
	                            	</c:if>
	                            </td>
	                            <td class=" p-lr20" style="text-align:left;">${list.surveySubject}</td>                            
	                            <td>${list.surveyStartDate} <span>~</span> ${list.surveyEndDate }</td>
	                            <td>${list.surveyTotal}</td>
	                            <td>${list.surveyWriter}</td>
	                            <td>
	                           		<c:if test="${state eq 'open'}">
	                            		<button class="s-btn-on cursor" Onclick="surveyVote('${list.surveyID}');">투표</button>
		                                <button class="s-btn-on cursor" Onclick="surveyResult('${list.surveyID}');">결과</button>
		                                <button class="s-btn-off cursor" Onclick="surveyDelete('${list.surveyID}');">삭제</button>
	                            	</c:if>
	                            	<c:if test="${state eq 'close'}">
	                            		<button class="s-btn-on cursor" Onclick="surveyResult('${list.surveyID}');">결과</button>
		                                <button class="s-btn-off cursor" Onclick="surveyDelete('${list.surveyID}');">삭제</button>
	                            	</c:if>
	                                
	                            </td>                           
	                        </tr>
	                    </c:forEach>               
                    </table>       
                    <!-- 페이징 -->
		                    <c:if test="${searchCount > 0}">
		                        <div class="page-grp center m-t20">
		                            <!-- 맨 앞페이지로 -->
		                            <c:choose>
		                                <c:when test="${curPage > 1}">
		                                    <span class="page">
		                                        <a href="${pageContext.request.contextPath}/survey/grp_survey_list?curPage=1">
		                                            <i class="fas fa-angle-double-left"></i>
		                                        </a>
		                                    </span>
		                                </c:when>
		                                <c:otherwise>
		                                    <span class="page">
		                                        <i class="fas fa-angle-double-left"></i>
		                                    </span>
		                                </c:otherwise>
		                            </c:choose>
		                            <!-- 맨 앞페이지로 -->
		
		                            <!-- 한칸 앞페이지로 -->
		                            <c:choose>
		                                <c:when test="${curPage > 1}">
		                                    <a href="${pageContext.request.contextPath}/survey/grp_survey_list?curPage=${curPage-1}">
		                                        <span class="page">
		                                            <i class="fas fa-angle-left"></i>
		                                        </span>
		                                    </a>
		                                </c:when>
		                                <c:otherwise>
		                                    <span class="page">
		                                        <i class="fas fa-angle-left"></i>
		                                    </span>
		                                </c:otherwise>
		                            </c:choose>
		                            <!-- 한칸 앞페이지로 -->
		
		                            <!-- 페이지번호 출력 -->
		                            <c:forEach begin="${blockBegin}" end="${blockEnd}" var="num">
		                                <!-- 시작, 끝, 변수명 -->
		
		                                <c:if test="${selected == num}">
		                                    <span class="page page-active"><a href="#" class="weight700">${num}</a></span>
		                                </c:if>
		
		                                <c:if test="${selected != num}">
		                                    <a href="${pageContext.request.contextPath}/survey/grp_survey_list?curPage=${num}">
		                                        <span class="page">${num}</span>
		                                    </a>
		                                </c:if>
		
		                            </c:forEach>
		                            <!-- 페이지번호 끝 -->
		
		                            <!-- 한칸 뒤로  -->
		                            <c:choose>
		                                <c:when test="${curPage != totalPage}">
		                                    <a href="${pageContext.request.contextPath}/survey/grp_survey_list?curPage=${curPage+1}">
		                                        <span class="page">
		                                            <i class="fas fa-angle-right"></i>
		                                        </span>
		                                    </a>
		                                </c:when>
		                                <c:otherwise>
		                                    <span class="page">
		                                        <i class="fas fa-angle-right"></i>
		                                    </span>
		                                </c:otherwise>
		                            </c:choose>
		                            <!-- 한칸 뒤로  -->
		
		                            <!-- 맨 뒤로 -->
		                            <c:choose>
		                                <c:when test="${curPage != totalPage}">
		                                    <span class="page">
		                                        <a href="${pageContext.request.contextPath}/survey/grp_survey_list?curPage=${totalPage}">
		                                            <i class="fas fa-angle-double-right"></i>
		                                        </a>
		                                    </span>
		                                </c:when>
		                                <c:otherwise>
		                                    <span class="page">
		                                        <i class="fas fa-angle-double-right"></i>
		                                    </span>
		                                </c:otherwise>
		                            </c:choose>
		                            <!-- 맨 뒤로 -->
		                        </div>
		                    </c:if>
                    <!-- 페이징 -->
                </div>
                <div class="survey_bg" id="survey_bg">
                	<div class="survey_wrap">
                	<!-- AJAX -->
                	</div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="${pageContext.request.contextPath}/js/grp_survey/grp_survey_list.js"></script>
</html>