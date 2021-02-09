<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<!-- calendar css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/core/main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/calendar/daygrid/main.css">
<!-- calendar css-->

<!-- datepicker(달력모양을 나타내는 css) -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- datepicker(달력모양) -->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style>
.ui-widget-header {
	border:none;
	background-color:#fff
}
   .content-box {
       border:1px solid #eee;
       padding:10px 20px;
   }
   .contents {
       display:none;
   }

   form>table td:nth-child(2n) {
       position:relative;
   }

   table i {
       position:absolute;
       top:10px;
       left:145px;
   }
   .auth-right {
        position:relative;
    }

   .auth-right form i {
        position: absolute;
        top: 0;
        left: 340px;
        line-height: 55px;
    }

    .logo a {
        display: inline-block;
        margin-top: 5px;
    }
    
    .fc-center >div  {
    	display: flex;
    }
    
    .fc-prev-button {
    	margin-right: 50px;
    }
    
    .fc-next-button {
    	margin-left:50px;
    }
    
    .fc-button-primary:not(:disabled):active,
	.fc-button-primary:not(:disabled).fc-button-active {
	  color: #fff;
	  background-color: #5d86a4;
	  border-color:#5d86a4;
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
                <div class="page-main-wrap">
                    <div class="title">
                        <h3 class="font18 noto m-t10">
                            <i class="far fa-calendar-alt m-b10"></i> 일정관리 > 일정등록
                        </h3>
                    </div>
                    <div class="calendar-insert">
                        <form id="frm" method="post">
                        <input type="hidden" name="empNumber" value="${sessionScope.empNumber}"/>
                            <table>
                                <tr>
                                    <td class="td-10 bg-darkgray black weight700 center font14">시작일</td>
                                    <td class="p-lr3 td-10">
                                        <input  type="text" id="startDate" name="startDate" placeholder="YY-MM-DD" autocomplete="off" class="input-165" readonly />
                                        <i class="fas fa-calendar-alt font16 cursor cal1"></i>
                                    </td>
                                    <td class="td-10 bg-darkgray black weight700 center font14">종료일</td>
                                    <td class="p-lr3 td-10">
                                        <input  type="text" id="endDate" name="endDate" autocomplete="off" placeholder="YY-MM-DD" class="input-165" readonly  />
                                        <i class="fas fa-calendar-alt font16 cursor cal2"></i>
                                    </td>
                                    <td class="td-10 bg-darkgray black weight700 center font14">일정내용</td>
                                    <td class="p-lr3">
                                        <input type="text" autocomplete="off" class="input-100" id="schContent" name="schContent" />
                                    </td>
                                </tr>
                            </table>
                            <div class="btn-grp center m-t10">
                                <button type="submit" class="btn-on" id="scheduleAdd">일정등록</button>
                                <button type="reset" class="btn-off">등록취소</button>
                            </div>
                        </form>
                    </div>
                    <div class="title">
                        <h3 class="tomato font18 noto m-t20">
                            <i class="far fa-calendar-alt m-b10"></i> 일정관리 > 일정목록
                        </h3>
                    </div>
                    <div class="page-member-bottom">
                        <div class="page-content">
                            <div id="calendar" class="calendar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>       
</div>
</body>

<!-- calendar js-->
<script src="${pageContext.request.contextPath}/calendar/core/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/core/locales/ko.js"></script>
<script src="${pageContext.request.contextPath}/calendar/interaction/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/daygrid/main.js"></script>
<!-- calendar js-->

<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="${pageContext.request.contextPath}/js/grp_schedule/grp_schedule.js"></script>
</html>