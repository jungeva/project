<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="auth" style="line-height:55px;">
	<span class="font16 weight700">
		${sessionScope.empDepartmentName} ${sessionScope.empName} ${sessionScope.empGradeName}님
		 [ 사번 : ${sessionScope.empNumber} / 권한 : ${sessionScope.empAuth}등급 ]
	</span>
</div>
<div class="auth-right flex" style="margin-top:3px;">
    <div class="auth-icon font25 center cursor" onclick="location.href='${pageContext.request.contextPath}/schedule/grp_schedule'">       
        <i class="far fa-calendar-alt"></i><p style="font-size:10px">일정관리</p>        
    </div>
    <div class="auth-icon font25 center m-lr10 cursor" onclick="location.href='${pageContext.request.contextPath}/board/grp_board_main'">
		<i class="fas fa-volume-down"></i><p style="font-size:10px">게시판</p>
    </div>
    <div class="auth-icon font25 center cursor" onclick="location.href='${pageContext.request.contextPath}'">
        <i class="fas fa-home"></i><p style="font-size:10px">HOME</p>
    </div>
     <div class="auth-icon font25 center m-lr10 cursor" onclick="location.href='${pageContext.request.contextPath}/grp_login'">
        <i class="fas fa-sign-out-alt"></i> <p style="font-size:10px">로그아웃</p>
    </div>
</div>