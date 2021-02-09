<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.icon {
	color:#2A558A;
}
.left-info{background:white;}
</style>
<div class="menu" style="min-height:calc(100vh - 86px);">
	<ul class="bg-white" style="min-height:calc(100vh - 86px);">
        <li class="organization ">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-users"></i>
                </span>
                <span class="organ-wrap">사내조직도</span>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="${pageContext.request.contextPath}/grp_employee/grp_employee_map"><span><i class="fas fa-chevron-right m-lr5"></i></span> 조직도</a></li>
                </div>
                <div class="content-box">
                    <li><a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list"><span><i class="fas fa-chevron-right m-lr5"></i></span> 사원목록</a></li>
                </div>
                <div class="content-box">
                    <li><a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list"><span><i class="fas fa-chevron-right m-lr5"></i></span> 퇴사자목록</a></li>
                </div>
            </ul>
        </li>

        <li class="approval">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-desktop"></i>
                </span>
                <span class="approval-wrap">전자결재</span>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="#"><span><i class="fas fa-chevron-right m-lr5"></i></span> 일반결재</a></li>
                </div>
                <div class="content-box">
                    <li><a href="#"><span><i class="fas fa-chevron-right m-lr5"></i></span> 결재문서양식등록</a></li>
                </div>
            </ul>
        </li>
        <li class="certificate">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-stamp"></i>
                </span>
                <span class="approval-wrap">증명서발급</span>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="#"><span><i class="fas fa-chevron-right m-lr5"></i></span> 증명서관리</a></li>
                </div>
                <div class="content-box">
                    <li><a href="#"><span><i class="fas fa-chevron-right m-lr5"></i></span> 증명서발급요청</a></li>
                </div>
            </ul>
        </li>

        <li class="boardManage">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-comments"></i>
                </span>
                <span class="board-wrap">게시판관리</a>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="${pageContext.request.contextPath}/board/grp_board_main"><span><i class="fas fa-chevron-right m-lr5"></i></span> 게시판 등록 및 목록</a></li>
                </div>
            </ul>
        </li>
        <li class="vacationManage">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-plane-departure"></i>
                </span>
                <span class="task-wrap">휴가관리</a>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="#"><span><i class="fas fa-chevron-right m-lr5"></i></span> 휴가사용내역</a></li>
                </div>
                <div class="content-box">
                    <li><a href="#"><span><i class="fas fa-chevron-right m-lr5"></i></span> 연차/휴가 신청</a></li>
                </div>
            </ul>
        </li>

        <li class="taskManage">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-tasks"></i>
                </span>
                <span class="task-wrap">일정관리</a>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="${pageContext.request.contextPath}/schedule/grp_schedule"><span><i class="fas fa-chevron-right m-lr5"></i></span> 일정목록</a></li>
                </div>
            </ul>
        </li>

        <li class="taskManage">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-sticky-note"></i>
                </span>
                <span class="${pageContext.request.contextPath}/survey-wrap">설문조사</a>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="${pageContext.request.contextPath}/survey/grp_survey_list"><span><i class="fas fa-chevron-right m-lr5"></i></span> 설문게시판</a></li>
                </div>
                <div class="content-box">
                    <li><a href="${pageContext.request.contextPath}/survey/grp_survey_register"><span><i class="fas fa-chevron-right m-lr5"></i></span> 설문등록</a></li>
                </div>
            </ul>
        </li>
        <li class="salaryManage">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-money-check-alt"></i>
                </span>
                <span class="salary-wrap">급여 및 상여금관리</a>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="#"><span><i class="fas fa-chevron-right m-lr5"></i></span> 급여조회</a></li>
                </div>
            </ul>
        </li>
        <li class="companyManage">
            <div class="header bg-white black p-lr10 p-tb20 font14 cursor">
                <span class="icon m-lr5">
                    <i class="fas fa-user-cog"></i>
                </span>
                <span class="salary-wrap">회사기본정보</a>
            </div>
            <ul class="contents bg-white">
                <div class="content-box">
                    <li><a href="${pageContext.request.contextPath}/company/grp_companySetting"><span><i class="fas fa-chevron-right m-lr5"></i></span>기본정보설정</a></li>
                </div>
            </ul>
        </li>
    </ul>
</div>