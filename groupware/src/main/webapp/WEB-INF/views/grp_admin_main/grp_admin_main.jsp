<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp" %>
<script src="js/admin.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<!-- calendar css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/core/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/daygrid/main.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- calendar css-->

<style>
    .contents {
        display: none;
    }

    .logo a {
        display: inline-block;
        margin-top: 5px;
    }

    .check-btn-on:hover {
        background-color: #2A558A;
        color: #fff;
    }
    /*cal*/
    ::-webkit-scrollbar {
        display: none;
    }

    .fc-view {
        width: 100%;
        height: 480px;
        position: absolute;
    }

    #calendar {
        width: 90%;
        height: 350px;
        margin: 0 auto;
        font-size: 10px;
        overflow: hidden;
    }

    .fc-header-title h2 {
        font-size: .9em;
        white-space: normal !important;
    }

    .fc-view-month .fc-event,
    .fc-view-agendaWeek .fc-event {
        font-size: 0;
        overflow: hidden;
        height: 2px;
    }
    
    .fc-view-agendaWeek .fc-event-vert {
        font-size: 0;
        overflow: hidden;
        width: 2px !important;
    }

    .fc-agenda-axis {
        width: 20px !important;
        font-size: .7em;
    }

    .fc-button-content {
        padding: 0;
    }

    .fc-center>div {
        display: flex;
    }

    .fc-prev-button {
        margin-right: 25px;
        width:30px;
        height:30px;
    }
    
    .fc-icon {
    	font-size:12px;
    }

    .fc-next-button {
        margin-left: 25px;
        width:30px;
        height:30px;
    }

    .fc-button-primary:not(:disabled):active,
    .fc-button-primary:not(:disabled).fc-button-active {
        color: #fff;
        background-color: #5d86a4;
        border-color: #5d86a4;
    }
    .fc-day-top fc-sun fc-other-month fc-past {
    	height:10px;
    }
    
	 .survey_bg {
    	position:absolute; /*포지션을 줘야 원래페이지 위에 만들수 있다.*/
    	top:0;
    	left:0;
    	width:100%;
    	height:100%;
    	background-color: rgba(0,0,0,0.5);
    	display:none;
    	z-index:99999;
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
    /*cal*/
</style>
<body>
    <div class="container p10 bg-gray" style="width:100%; height:100%;">
        <div class="top-wrap">
            <div class="top  flex flex-justify weight700">
            	<!-- include logo -->
                <%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_LOGO.jsp" %>
                <!-- include logo -->
                
                <div class="auth-wrap  flex flex-justify font18 weight700 p-lr10 bg-white" style="width:87%">
                <!-- include auth -->
                <%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_AUTH.jsp" %>
                <!-- include auth -->
                </div>
            </div>
        </div>
        <div class="bottom flex flex-justify m-t10" style="min-height:calc(100vh - 86px);">
            <div class="left-info" style="width:12.4%; min-height:calc(100vh - 86px);">
                <!-- include menu -->
                <%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_MENU.jsp" %>
                <!-- include menu -->
            </div>
            <div class="right-info" style="width:87% ">
                <div class="flex flex-justify" style="width:100%;">
                    <div class="main-left" style=" margin-right:10px;width:20%">
                    	<div class="sum-wrap" style="border:1px solid #eee;">
                            <nav class="sumUp-list flex bg-white">
                                <a href="#attend" class="tab active">근태관리</a>
                                <a href="#vacation" class="tab">연차정보</a>
                            </nav>
                            <div class="attend-info tab-content show bg-white" id="attend" style="padding:29px 20px;margin-bottom:10px;">
                                <div class="font16" >2020-09-16 [수]</div>
                                <div class="m-t10 m-b20 m-lr10 center" style="font-size:30px">17:33:50</div>
                                <div class="clock center font14">
                                    <div class="flex flex-justify ">
                                    	<span class="font20" style="width:50%">AM 09:10</span>
                                        <button class="check-btn-on weight700 font14" style="width:50%">출근</button>
                                    </div>
                                    <div class="flex flex-justify m-t10" style="">
                                    	<span class="font20" style="width:50%">PM 16:20</span>
                                        <button class="check-btn-on weight700 font14" style="width:50%">퇴근</button>
                                    </div>
                                </div>
                                <div class="change-state m-t10">
                                    <select name="state" class="font14 weight700">
                                        <option value="">근무 상태 변경</option>
                                        <option value="">근무중</option>
                                        <option value="">퇴근</option>
                                        <option value="">외근</option>
                                    </select>
                                </div>
                            </div>
                            <div class="vacation-info tab-content bg-white m-b10" id="vacation" style="padding:18.5px 20px;">
                                <div class="vacation-title flex flex-justify">
                                    <h2 class="m-b10">내 연차정보</h2>
                                    <span class="icon-plus m-b10">
                                        <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                                    </span>
                                </div>
                                <div class="vaca-list flex flex-justify p20 p-lr20">
                                    <span>입사일</span>
                                    <span>2018-09-08</span>
                                </div>
                                <div class="vaca-list flex flex-justify p20 p-lr20">
                                    <span>총연차수</span>
                                    <span>16일 0시간</span>
                                </div>
                                <div class="vaca-list flex flex-justify p20  p-lr20">
                                    <span>사용연차</span>
                                    <span>15일 7시간</span>
                                </div>
                                <div class="vaca-list flex flex-justify p20  p-lr20">
                                    <span>연차 잔여일</span>
                                    <span>0일 0시간</span>
                                </div>
                            </div>
                        </div>
                        <div class="calendar-wrap bg-white m-b10" style="padding-top:20px;">
                        	<div id="calendar" class="calendar"></div>
                        </div>
                    </div>
                    <div class="main-right">
                        <div class="right-up flex flex-justify" >
                            <div class="approval-box p20 bg-white" style="width:49.5%;">
                                <div class="paper-title flex flex-justify" style="border-bottom:2px solid #eee">
                                    <span class="font16 weight700 m-b10 p-lr10">결제서류함</span>
                                    <span class="icon-plus">
                                        <a href="#"><i class="fas fa-ellipsis-v"></i></i></a>
                                    </span>
                                </div>
                                <table>
                                    <tr class="center font14">
                                        <td class="td-15 weight700">기안일</td>
                                        <td class="weight700">결제제목</td>
                                        <td class="td-15 weight700">작성자</td>
                                        <td class="td-10 weight700">첨부</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" class="center">
                                            <i class="fas fa-exclamation-circle"></i><strong> 등록된 문서가 없습니다.</strong>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class=" p20 bg-white" style="width:49.5%; ">
                                <div class="paper-title flex flex-justify" style="border-bottom:2px solid #eee">
                                    <span class="font16 weight700 m-b10 p-lr10">진행중인 설문</span>
                                    <span class="icon-plus">
                                        <a href="${pageContext.request.contextPath}/survey/grp_survey_list"><i class="fas fa-ellipsis-v"></i></a>
                                    </span>
                                </div>
                                <div class="top-main flex flex-justify m-lr10">
	                                <c:forEach items="${survey}" var="survey">
	                                    <div class="sum-survey" style="margin-top:15px;">
	                                        <div class="survey p20 noto" style="width:280px;height:260px;line-height:1.7; border:1px solid #e7e7e7; border-radius:10px;">
	                                            <div class="alarm-btn m-tb10" style="text-align:left;">                     
	                                                <span class="btn-blue" style="background-color:#EA6D56;color:#fff;">진행중</span>
	                                            </div>                                
	                                            <h2 class="font14 m-tb10" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${survey.surveySubject}</h2>
	                                            <p>${survey.surveyStartDate} ~ ${survey.surveyEndDate}</p>                           
	                                            <p>작성자: ${survey.surveyWriter}</p>
	                                            <c:set var="state" value="${survey.surveyResult}" />
	                                            <c:if test="${state eq 'Y'}">
	                                           	    <p>설문결과 : 공개</p>
	                                           	</c:if>
	                                           	<c:if test="${state eq 'N'}">
	                                           	    <p>설문결과 : 비공개</p>
	                                           	</c:if>
	                                           	<p><i class="fas fa-user" style="margin-right:5px;"> ${survey.surveyTotal}명</i></p>
	                                            <div class="center noto font14 weight700 p10 m-tb10 cursor white" style="background-color:#2A558A;" Onclick="surveyResult('${survey.surveyID}');">설문결과보기</div>
	                                        </div>                      
	                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="right-down" style="margin-top:10px;">
                            <div class="notice-box p10 bg-white">
                                <div class="paper-title">
                                    <nav class="sumUp-list p10 " style="border-bottom:1px solid #dcdcdc ">
                                        <a href="#notice" class="board active font16 weight700 p10">공지사항</a>
                                        <a href="#new-alarm" class="board font16 weight700 p10">최근 게시물</a>
                                        <div class="icon-plus float-r clearfix">
                                            <a href="#"><i class="fas fa-ellipsis-v"></i></a>
                                        </div>
                                    </nav>

									<div class="board-content show" id="notice">
										<table>
											<tr class="center weight700 font14">
												<td class="td-10">상태</td>
												<td>제목</td>
												<td class="td-10">작성자</td>
												<td class="td-10">조회수</td>
												<td class="td-15">등록일</td>
											</tr>
											<tr class="center font14" style="height:45px;">
												<td class="weight700 red">[공지]</td>
												<td class="p-lr10 left weight700">소방훈련 일정 및 대피도 확인해주세요.</td>
												<td>관리자</td>
												<td>50</td>
												<td>2020-09-09</td>
											</tr>
											<tr class="center font14" style="height:45px;">
												<td class="weight700 red">[공지]</td>
												<td class="p-lr10 left weight700">업데이트 관련 공지</td>
												<td>관리자</td>
												<td>20</td>
												<td>2020-09-08</td>
											</tr>
											<tr class="center font14" style="height:45px;">
												<td class="weight700 red">[공지]</td>
												<td class="p-lr10 left weight700">휴가신청기간 안내</td>
												<td>인사팀</td>
												<td>20</td>
												<td>2020-09-07</td>
											</tr>
											<tr class="center font14" style="height:45px;">
												<td class="weight700 red">[공지]</td>
												<td class="p-lr10 left weight700">인사발령공지</td>
												<td>인사팀</td>
												<td>20</td>
												<td>2020-09-01</td>
											</tr>
											<tr class="center font14" style="height:45px;">
												<td class="weight700 red">[공지]</td>
												<td class="p-lr10 left weight700">코로나19로 인한 근무시간 조정 알림
													및 배차시간 변경</td>
												<td>관리자</td>
												<td>5</td>
												<td>2020-08-29</td>
											</tr>
											<tr class="center font14" style="height:45px;">
												<td class="weight700 red">[공지]</td>
												<td class="p-lr10 left weight700">코로나19로 인한 근무시간 조정 알림
													및 배차시간 변경</td>
												<td>관리자</td>
												<td>5</td>
												<td>2020-08-29</td>
											</tr>
										</table>
									</div>
									<div class="board-content" id="new-alarm">
                                        <div class="p10 flex flex-justify" style="border-bottom:1px solid #eee;height:78px;">
                                            <div class="flex" >
                                                <div class="user-img" style="width:50px;height:50px;">
                                                    <img src="images/t7.png" />
                                                </div>
                                                <div class="flex flex-justify">
                                                    <div>
                                                        <p class="weight700 font14" style="line-height:65px;">
                                                            [인사부 알림] 운영자 확인이 필요한 정보가 있습니다. 근태관리에서 확인하세요.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex" style="line-height:65px;">
                                                <span class="font14 ">홍길동 과장</span>
                                                <p class="m-lr20 font14">09/20 09:20:55</p>
                                                <span style="font-size:24px;color:#555;">
                                                    <i class="fas fa-chevron-right"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="p10 flex flex-justify" style="border-bottom:1px solid #eee;height:78px;">
                                            <div class="flex" >
                                                <div class="user-img" style="width:50px;height:50px;">
                                                    <img src="images/t2.png" />
                                                </div>
                                                <div class="flex flex-justify">
                                                    <div>
                                                        <p class="weight700 font14" style="line-height:65px;">
                                                            [인사부 알림] 운영자 확인이 필요한 정보가 있습니다. 근태관리에서 확인하세요.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex" style="line-height:65px;">
                                                <span class="font14 ">홍길동 과장</span>
                                                <p class="m-lr20 font14">09/20 09:20:55</p>
                                                <span style="font-size:24px;color:#555;">
                                                    <i class="fas fa-chevron-right"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="p10 flex flex-justify" style="border-bottom:1px solid #eee;height:78px;">
                                            <div class="flex" >
                                                <div class="user-img" style="width:50px;height:50px;">
                                                    <img src="images/t1.png" />
                                                </div>
                                                <div class="flex flex-justify">
                                                    <div>
                                                        <p class="weight700 font14" style="line-height:65px;">
                                                            [인사부 알림] 운영자 확인이 필요한 정보가 있습니다. 근태관리에서 확인하세요.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex" style="line-height:65px;">
                                                <span class="font14 ">홍길동 과장</span>
                                                <p class="m-lr20 font14">09/20 09:20:55</p>
                                                <span style="font-size:24px;color:#555;">
                                                    <i class="fas fa-chevron-right"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="p10 flex flex-justify" style="border-bottom:1px solid #eee;height:77px;">
                                            <div class="flex" >
                                                <div class="user-img" style="width:50px;height:50px;">
                                                    <img src="images/t3.png" />
                                                </div>
                                                <div class="flex flex-justify">
                                                    <div>
                                                        <p class="weight700 font14" style="line-height:65px;">
                                                            [인사부 알림] 운영자 확인이 필요한 정보가 있습니다. 근태관리에서 확인하세요.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="flex" style="line-height:65px;">
                                                <span class="font14 ">홍길동 과장</span>
                                                <p class="m-lr20 font14">09/20 09:20:55</p>
                                                <span style="font-size:24px;color:#555;">
                                                    <i class="fas fa-chevron-right"></i>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>    
                <div class="right-main-bottom">
	                <div class="main-copyright" style="background-color:#d5dbe6;with:100%;padding:48px 0;">
	                	<span style="text-align:center; width:100%; display:inline-block;">&copy;Copyright 2020. All Right Reserved.</span>
	                </div>
                </div>    
            </div>
        </div>
    </div>
    </div>
    <div class="survey_bg" id="survey_bg">
    	<div class="survey_wrap"></div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/grp_damin_main/grp_admin_main.js"></script>
<!-- calendar js-->
<script src="${pageContext.request.contextPath}/calendar/core/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/core/locales/ko.js"></script>
<script src="${pageContext.request.contextPath}/calendar/interaction/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/daygrid/main.js"></script>
<!-- calendar js-->

</html>