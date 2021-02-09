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

    .auth-right {
        position: relative;
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

    .list_table tr:hover {
        background-color: #EFF1F6;
    }

    .list_table tr:nth-child(1):hover {
        background-color: #D4DAE6;
    }
    /*상세보기 사진*/
    .content-left {
		width:175px;
		min-width: 175px;
	}
	
	.photo-area {
		width:145px;
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
	
	/*상세보기 CSS*/
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
                <div class="">
	            	 <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_map">
						<span class="btn-off">조직도</span>
					 </a>
	               	 <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list">
					 	<span class="btn-off">사원목록</span>
					 </a>
					 <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list">
						<span class="btn-on" style="width:95px;">사용정지목록</span>
					 </a>
	            </div>   
                <div class="title m-tb10">
                    <h3 class="font18 noto">
                        <i class="fas fa-sitemap"></i> 사원조직 <i class="fas fa-angle-right"></i> 사용정지목록 
                    </h3>
                </div>
                <div class="top-main flex flex-justify m-b5" style="margin-top:10px;">
                    <div>
                        <div class="btn-normal">전체 정지된 사용자 : ${count}명 </div>
                    </div>
                    <c:if test="${count > 0}">
                        <div class="m-t5 font16 weight700" style="margin-left:10px;">
                            [ ${curPage}page of ${totalPage}pages ]
                        </div>
                    </c:if>
                    <div class="flex float-r clearfix">
                        <div class="">
                            <form method="post" action="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list">
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
                            <button class="btn-off m-lr5" id="deleteAll">선택삭제</button>
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
                            <td class="td-7">부서코드</td>
                            <td class="td-10">부서</td>
                            <td class="td-13">사번</td>
                            <td class="td-13">사원명</td>
                            <td class="td-10">직급</td>
                            <td class="td-5">부서장</td>
                            <td class="td-10">입사일</td>
                            <td class="td-10">퇴사일</td>
                            <td class="td-8">비고</td>
                        </tr>

                        <c:if test="${count == 0}">
                            <tr>
                                <td colspan="12" class="m-t5 font14 weight700 center">
                                    <i class="fas fa-exclamation-circle"></i> 검색된 결과가 없습니다.
                                </td>
                            </tr>
                        </c:if>
                        
						<c:forEach items="${retiredList}" var="emp" varStatus="status">
	                        <c:if test="${emp.empRetired eq 'Y' }">
	                            <tr class="center font14">
	                                <td>
	                                    <input type="checkbox" name="chk"class="chk" data-uid="${emp.empID}">
	                                </td>
	                                <td>${ (count - status.index) - ( (curPage -1) * end) }</td>
	                                <td>${emp.empDepartmentCode}</td>
	                                <td>${emp.empDepartmentName}</td>
	                                <td class="popup weight700 cursor">${emp.empNumber}</a></td>
	                                <td class="popup weight700 cursor" onClick="detail_open('${emp.empID}');">${emp.empName}</a></td>
	                                <td>${emp.empGradeName}</td>
	                                <td>${emp.empHead}</td>
	                                <td>${emp.empEnterDate}</td>
	                                <td>${emp.empRetiredDate}</td>
	                                <td>
	                                	<button class="s-btn-off" onclick="comback('${emp.empID}');">복귀</button>
	                                    <button class="s-btn-off" onclick="deleteOne('${emp.empID}');">삭제</button>
	                                </td>
	                            </tr>
	                        </c:if>
	                    </c:forEach>
                    </table>
                    <!-- 페이징 -->
                    <c:if test="${count > 0}">
                        <div class="page-grp center m-t20">
                            <!-- 맨 앞페이지로 -->
                            <c:choose>
                                <c:when test="${curPage > 1}">
                                    <span class="page">
                                        <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list?curPage=1&searchOpt=${searchOpt}&words=${words}">
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
                                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
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
                                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
                                        <span class="page">${num}</span>
                                    </a>
                                </c:if>

                            </c:forEach>
                            <!-- 페이지번호 끝 -->

                            <!-- 한칸 뒤로  -->
                            <c:choose>
                                <c:when test="${curPage != totalPage}">
                                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
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
                                        <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
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
<script>
	function comback(empID) {
		var msg = "해당사원을 복귀시키겠습니까?";

		if(confirm(msg)) {
			$.ajax({
				url		: "${pageContext.request.contextPath}/grp_employee/grp_employee_comback",
				type	: "POST",
				data	: { empID : empID },
				success	: function(resData) {
					alert("복귀되었습니다.");
					location.href="${pageContext.request.contextPath}/grp_employee/grp_employee_list";
				},
				error	: function() {
					alert("관리자에게 문의하세요.");
				},
				complete : function() {}
			});
		}
	} 
</script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="${pageContext.request.contextPath}/js/grp_employee/grp_employee_retired_list.js"></script>
</html>