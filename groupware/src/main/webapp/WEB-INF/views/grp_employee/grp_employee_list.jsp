<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<style>
    .content-box {
        border: 1px solid #eee;
        padding: 10px 20px;
    }

    .contents {
        display: none;
    }

    .logo a {
        display: inline-block;
        margin-top: 5px;
    }

    .list_table tr:hover {
        background-color: #EFF1F6;
    }

    .list_table tr:nth-child(1):hover {
        background-color: #D4DAE6;
    }
    

    /* 상세보기 css */
    .content-left {
		width:175px;
		min-width: 175px;
	}
	
	.photo-area {
		width:155px;
		height:180px;
	}
	
	.photo-area img {
		width:100%;
		height:100%;
        display:inline-block;
        border:1px solid #ededed;
    }
    
    .content-right {
		width:100%;
	}
	
	 .detail_bg {
    	position:absolute;
    	left:0;
    	top:0;
    	width:100%;
    	height:100%;
    	background-color:rgba(0,0,0,0.5);
    	display:none;	
    }
    
    .detail_box {
    	position:absolute;
    	left:50%;
    	top:50%;
    	transform:translate(-50%, -50%);
    	background-color:#fff;
    	width:700px;
    }
    
    /* 상세보기 css */
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
            ${uploadPath}
                <div class="">
	            	 <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_map">
						<span class="btn-off">조직도</span>
					 </a>
	               	 <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list">
					 	<span class="btn-on">사원목록</span>
					 </a>
					 <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list">
						<span class="btn-off" style="width:95px;">사용정지목록</span>
					 </a>
	            </div>   
                <div class="title m-tb10">
                    <h3 class="font18 noto">
                        <i class="fas fa-sitemap"></i> 사원조직 <i class="fas fa-angle-right"></i> 사원목록 [ 총 직원수 : ${totalCount}명 ]
                    </h3>
                </div>
                <div class="top-main flex flex-justify m-b5" style="margin-top:10px;">
                    <div>
                       <div class="btn-normal">검색된 직원수 : ${searchCount}명</div>
                    </div>
                    <c:if test="${searchCount > 0}">
                        <div class="m-t5 font16 weight700" style="margin-left:10px;">
                            [ ${curPage}page of ${totalPage}pages ]
                        </div>
                    </c:if>
                    <div class="flex float-r clearfix">
                        <div class="">
                            <form method="post" action="${pageContext.request.contextPath}/grp_employee/grp_employee_list">
                                <select class="" name="searchOpt">
                                    <option value="emp_name" <c:if test="${searchOpt eq 'emp_name'}">selected</c:if>>사원명</option>
                                    <option value="emp_number" <c:if test="${searchOpt eq 'emp_number'}">selected</c:if>>사원번호</option>
                                    <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if>>사원명+사원번호</option>
                                </select>
                                <input value="${words}" type="text" name="words" required style="margin-left:-2px" autocomplete="off" />
                                <button type="submit" class="btn-on">회원검색</button>
                            </form>
                        </div>
                        <div class="remove">
                            <button type="button" class="btn-off m-lr5" id="deleteAll">퇴사처리</button>
                        </div>
                    </div>
                </div>
                <div class="member-info">
                    <table class=" m-b10 list_table">
                        <tr class="center bg-darkgray black font14 weight700">
                            <td class="td-5">
                                <input type="checkbox" onclick="chkAll();" id="chkAll"/>
                            </td>
                            <td class="td-5">번호</td>
                            <td class="td-10">부서코드</td>
                            <td class="td-10">부서</td>
                            <td class="td-15">사번</td>
                            <td class="td-10">사원명</td>
                            <td class="td-8">직급</td>
                            <td class="td-5">부서장</td>
                            <td class="td-10">입사일</td>
                            <td class="td-8">권한</td>
                            <td class="td-7">승인여부</td>
                            <td class="td-7">비고</td>
                        </tr>
                        

                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="12" class="center font14 weight700">등록된 사원이 없습니다.</td>
                            </tr>
                        </c:if>

                        <c:if test="${totalCount != 0 and searchCount == 0}">
                            <tr>
                                <td colspan="12" class="m-t5 font14 weight700 center">
                                    <i class="fas fa-exclamation-circle"></i> 검색된 결과가 없습니다.
                                </td>
                            </tr>
                        </c:if>
                        
						<c:forEach items="${list}" var="emp" varStatus="status">
	                        <c:if test="${emp.empRetired eq 'N' }">
	                            <tr class="center font14">
	                                <td>
	                                    <input class="chk" type="checkbox" name="chk" data-uid="${emp.empID}"/>
	                                </td>
	                                <td>${ (searchCount - status.index) - ( (curPage -1) * end) }</td>
	                                <td>${emp.empDepartmentCode}</td>
	                                <td>${emp.empDepartmentName}</td>
	                                <td class="weight700 cursor" onClick="detail_open('${emp.empID}');">${emp.empNumber}</td>
	                                <td class="weight700 cursor" onClick="detail_open('${emp.empID}');">${emp.empName}</td>
	                                <td>${emp.empGradeName}</td>
	                                <td>
	                                    <input type="checkbox" value="${emp.empHead}" onClick="headChange(this.value,'${emp.empID}');" <c:if test="${emp.empHead eq 'Y'}">checked</c:if>/>
	                                </td>
	                                <td>${emp.empEnterDate}</td>
	                                <td class="p-lr3">
	                                    <select class="sel-100 p-lr3" name="" id="" onchange="authChange(this.value, '${emp.empID}')">
	                                        <option value="1" <c:if test="${emp.empAuth eq '1'}">selected</c:if> >협력업체
	                                        </option>
	                                        <option value="2" <c:if test="${emp.empAuth eq '2'}">selected</c:if> >사원
	                                        </option>
	                                        <option value="3" <c:if test="${emp.empAuth eq '3'}">selected</c:if> >부서장
	                                        </option>
	                                        <option value="4" <c:if test="${emp.empAuth eq '4'}">selected</c:if> >임원
	                                        </option>
	                                        <option value="5" <c:if test="${emp.empAuth eq '5'}">selected</c:if> >관리자
	                                        </option>
	                                    </select>
	                                </td>
	                                <td class="p-lr3">
	                                    <select class="sel-100 p-lr3" name="" id="" onchange="confirmChange(this.value, '${emp.empID}');">
	                                        <option value="N" <c:if test="${emp.empConfirm eq 'N'}">selected</c:if> >미승인</option>
	                                        <option value="Y" <c:if test="${emp.empConfirm eq 'Y'}">selected</c:if> >승인</option>
	                                    </select>
	                                </td>
	                                <td>
	                                    <button class="s-btn-off" onClick="location.href='${pageContext.request.contextPath}/grp_employee/grp_employee_register?empID=${emp.empID}'">수정</button>
	                                    <button name="" value="${emp.empRetired}" class="m-btn-off" onClick="retiredChange(this.value,'${emp.empID}');">사용정지</button>
	                                </td>
	                            </tr>
	                        </c:if>
	                    </c:forEach>
                    </table>

                    <!-- 페이징 -->
                    <c:if test="${searchCount > 0}">
                        <div class="page-grp center m-t20">
                            <!-- 맨 앞페이지로 -->
                            <c:choose>
                                <c:when test="${curPage > 1}">
                                    <span class="page">
                                        <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list?curPage=1&searchOpt=${searchOpt}&words=${words}">
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
                                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
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
                                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
                                        <span class="page">${num}</span>
                                    </a>
                                </c:if>

                            </c:forEach>
                            <!-- 페이지번호 끝 -->

                            <!-- 한칸 뒤로  -->
                            <c:choose>
                                <c:when test="${curPage != totalPage}">
                                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
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
                                        <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
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
            </div>
        </div>
    </div>
    <div class="detail_bg" id="detail_bg"></div>
</body>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="${pageContext.request.contextPath}/js/grp_employee/grp_employee_list.js"></script>
</html>