<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<style>
   .content-box {
       border:1px solid #eee;
       padding:10px 20px;
   }
   .contents {
       display:none;
   }

   input[type="radio"] {
       width:15px;
       height:15px;
       margin:0 5px;  
   }

   input[type="checkbox"] {
       width:15px;
       height:15px;
       margin:0 5px;  
    }
   .cal{
       position: relative;
   }

   .cal i {
       position:absolute;
       top:10px;
       left:140px;
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
            <div class="right-info bg-white p10" style="width:87%;">               
                <div class="member-info">
                    <div class="title">
                        <h3 class="tomato font18 noto m-tb10 ">
                            <i class="fas fa-sticky-note"></i> 설문조사 > 설문 등록
                        </h3>
                    </div>
                    <form method="post" id="frm">                                                
						<table>
							<tr>
								<td class="center bg-darkgray black font14 weight700">설문상태</td>
								<td class="td-90 p-lr3">
									<select id="surveyState" name="surveyState" class="sel-135">
										<option value="open">진행중</option>
										<option value="close">완료</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="center bg-darkgray black font14 weight700">공개여부</td>
								<td class="td-90 p-lr3">
									<select id="surveyResult" name="surveyResult" class="sel-135">
										<option value="Y">공개</option>
										<option value="N">비공개</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="center bg-darkgray black font14 weight700">설문기간</td>
                                <td class="td-90 p-lr3">
                                    <div class="range flex">
                                        <div class="cal">
                                            <input type="text"  autocomplete="off" class="input-165" id="surveyStartDate" name="surveyStartDate" />
                                            <i class="fas fa-calendar-alt font16"></i>
                                        </div>
                                        <p style="line-height: 35px;" class="m-lr5 font16">-</p>
                                        <div class="cal">
                                            <input type="text"  autocomplete="off" class="input-165" id="surveyEndDate" name="surveyEndDate" />
                                            <i class="fas fa-calendar-alt font16"></i>
                                        </div>
                                    </div>
                                </td>
							</tr>
							<tr>
								<td class="center bg-darkgray black font14 weight700">설문작성자</td>
								<td class="td-90 p-lr3">
									<input type="text" id="surveyWriter" name="surveyWriter" value="${sessionScope.empName}" readonly />
								</td>
							</tr>
							<tr>
								<td class="center bg-darkgray black font14 weight700">설문제목</td>
								<td class="td-90 p-lr3">
									<input type="text" class="input-100" id="surveySubject" name="surveySubject" autocomplete="off" maxlength="100"/>
								</td>
							</tr>
							<tr>
								<td class="center bg-darkgray black font14 weight700">
									<span>보기</span>
								</td>
								<td class="td-90 p-lr3">
									<div id="example-wrap">
                        				<div class="example">
	                        				<span style="line-height:35px;">1. </span><input type="text" name="surveyExample" id="surveyExample1" autocomplete="off" style="width:50%; margin:2px 0;"/>
	                        			</div>
	                        			<div class="example"> 
	                        				<span style="line-height:35px;">2. </span><input type="text" name="surveyExample" id="surveyExample2" autocomplete="off" style="width:50%; margin:2px 0;"/>
                        				</div>
                        			</div>
                        			<i class="fas fa-plus m-t10 cursor font12" id="example-plus" style="margin:10px 10px;"> 추가하기</i>
                        			<i class="fas fa-minus m-lr5 cursor font12" id="example-minus"> 삭제하기</i>
								</td>
							</tr>
						</table>
                    </form> 
                    <div class="btn-wrap flex m-tb5 float-r clearfix" >
                        <button type="button" class="btn-on cursor" id="btn">완료</button>
                        <button type="reset" class="btn-off cursor m-lr5">취소</button>
                    </div>  
                </div>
            </div>
        </div>
        
    </div>
    
</body>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="${pageContext.request.contextPath}/js/grp_survey/grp_survey_register.js"></script>
</html>