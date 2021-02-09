<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<style>
	.board_list tr:hover {
        background-color: #EFF1F6;
    }
    .board_list tr:nth-child(1):hover {
        background-color: #D4DAE6;
    }
    .content-box {
       border:1px solid #eee;
       padding:10px 20px;
   }

   .contents {
       display:none;
   }

   .auth-right {
        position:relative;
    }

    .auth-right form i {
        position:absolute;
        top:0;
        left:300px;
        line-height:55px;
    }

    .logo a {
        display: inline-block;
        margin-top:5px;
    }
    
    #layerbox {
       display:none;
    }
    
    .layerpop {
    	background-color:#fff;
    	width:1200px;
    	height:250px;
    	border:1px solid #555;
    	padding: 20px 20px; 
    }
</style>
<body>
<!-- layer  -->
<div>
	<div id="layerbox" class="layerpop" >
		<div class="">
			<h3 class="tomato font18 noto m-b10">
                <i class="fas fa-file-alt"></i> 게시판 수정
            </h3>
		</div>
	    <form method="post" id="pop_frm">	    
                 <table>
                     <tr class="center" >
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">게시판그룹</td>
                         <td class="td-15 p-lr3">
                             <select class="sel-100 boardGrp" name="pop_boardGrp" id="pop_boardGrp" ></select>
                         </td>
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">게시판코드</td>
                         <td class="p-lr3">
                             <input class="input-100" name="pop_boardCode" id="pop_boardCode"readonly/>
                         </td>
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">게시판색상</td>
                         <td class="td-15 p-lr3">
                              <select class="sel-100" name="pop_boardColor" id="pop_boardColor">
                                  <option value="#CFE1E9">#CFE1E9</option>
                                  <option value="#DFE8E4">#DFE8E4</option>
                                  <option value="#F0F2E7">#F0F2E7</option>
                                  <option value="#EDE7D6">#EDE7D6</option>
                                  <option value="#F3E4E7">#F3E4E7</option>
                                  <option value="#E6E1F0">#E6E1F0</option>
                               </select>
                               <span class="color"></span>
                        </td>
                        <td class="bg-darkgray weight700 td-10 black pop_rowColer">게시판 생성자</td>
                        <td class="td-15 p-lr3">
                             <input type="text" class="input-100" name="pop_boardMaker" id="pop_boardMaker" readonly/>
                         </td>
                     </tr>
                     <tr class="center">
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">게시판제목</td>
                         <td colspan="5" class="td-90 p-lr3" >
                             <input type="text" class="input-100" name="pop_boardTitle" id="pop_boardTitle"/>
                         </td>
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">게시판타입</td>
                         <td class="td-90 p-lr3" >
                            <select class="sel-100" name="pop_boardType" id="pop_boardType">
                                 <option value="1">답변형게시판</option>
                                 <option value="2">공지사항게시판</option>
                             </select>
                         </td>
                     </tr>
                     <tr class="center">
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">읽기권한</td>
                         <td class="td-15 p-lr3">
                             <select class="sel-100" name="pop_boardRead" id="pop_boardRead">
                                 <option value="0">모두</option>
                                 <option value="1">직원</option>
                             </select>
                         </td>
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">쓰기권한</td>
                         <td class="td-15 p-lr3">
                             <select class="sel-100" name="pop_boardWrite" id="pop_boardWrite">
                                 <option value="0">모두</option>
                                 <option value="1">직원</option>
                             </select>
                         </td>
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">댓글권한</td>
                         <td class="td-15 p-lr3">
                             <select class="sel-100" name="pop_boardReply" id="pop_boardReply">
                                 <option value="0">모두</option>
                                 <option value="1">직원</option>
                             </select>
                         </td>
                         <td class="bg-darkgray weight700 td-10 black pop_rowColer">다운권한</td>
                         <td class="td-15 p-lr3">
                             <select class="sel-100" name="pop_boardDownload" id="pop_boardDownload">
                                 <option value="0">모두</option>
                                 <option value="1">직원</option>
                             </select>
                         </td>
                     </tr>
                 </table>
                 <div class="btn-grp center m-t10">
                     <button class="btn-on" type="button" onClick="boardModify(boardCode);">확인</button>
                     <button class="btn-off" type="reset" onclick="popup_close();">취소</button>
                 </div>
             </form>
	</div>
</div> 
<!-- layer  --> 
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
                <div class="board-info">
                    <div class="create-board">
                        <div class="title">
                            <h3 class="font18 m-tb10 ">
                                <i class="fas fa-file-alt"></i> 게시판관리 <i class="fas fa-angle-right"></i> 게시판등록
                            </h3>
                        </div>
                        
                        <form id="frm" method="post" action="">
                            <table>
                                <tr>
                                    <td class="center bg-darkgray black font14 weight700 td-10">게시판그룹</td>
                                    <td class="td-15 p-lr3">
                                        <select name="boardGrp" id="boardGrp" class="sel-100 boardGrp"></select>
                                    </td>
                                    <td class="center bg-darkgray black font14 weight700 td-10">게시판코드</td>
                                    <td class="td-15 p-lr3">
                                    	 <input onBlur="boardCodeChk();" name="boardCode" id="boardCode" type="text" placeholder="영어로 입력" class="input-100" autocomplete="OFF" />
                                    </td>
                                    <td class="center bg-darkgray black font14 weight700 td-10">게시판색상</td>
                                    <td class="td-15  p-lr3">
                                        <select class="sel-100" name="boardColor" id="boardColor">
	                                        <option value="#CFE1E9">#CFE1E9</option>
			                                <option value="#DFE8E4">#DFE8E4</option>
			                                <option value="#F0F2E7">#F0F2E7</option>
			                                <option value="#EDE7D6">#EDE7D6</option>
			                                <option value="#F3E4E7">#F3E4E7</option>
			                                <option value="#E6E1F0">#E6E1F0</option>
			                          	</select>
                                    </td>
                                    <td class="center bg-darkgray black font14 weight700 td-10">게시판생성자</td>
                                    <td class="td-15 p-lr3">
                                        <input type="text" class="input-100" name="boardMaker" id="boardMaker" value="${sessionScope.empName}" readonly/>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="center bg-darkgray black font14 weight700 td-10">게시판제목</td>
                                    <td colspan="5" class="td-90 p-lr3"  >
                                        <input type="text" name="boardTitle" id="boardTitle" class="input-100" autocomplete="OFF"/>
                                    </td>
                                    <td class="center bg-darkgray black font14 weight700 td-10">게시판타입</td>
                                    <td class="td-90 p-lr3" >
                                       <select class="sel-100" name="boardType">
                                            <option value="1">답변형게시판</option>
                                            <option value="2">공지사항게시판</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="center bg-darkgray black font14 weight700 td-10">읽기권한</td>
                                    <td class="td-15  p-lr3">
                                        <select class="sel-100" name="boardRead">
                                             <option value="0">모두</option>
                                             <option value="1">직원</option>
                                        </select>
                                    </td>
                                    <td class="center bg-darkgray black font14 weight700 td-10">쓰기권한</td>
                                    <td class="td-15  p-lr3">
                                        <select class="sel-100" name="boardWrite">
                                            <option value="0">모두</option>
                                            <option value="1">직원</option>
                                        </select>
                                    </td>
                                    <td class="center bg-darkgray black font14 weight700 td-10">댓글권한</td>
                                    <td class="td-15 p-lr3">
                                        <select  class="sel-100" name="boardReply">
                                            <option value="0">모두</option>
                                            <option value="1">직원</option>
                                        </select>
                                    </td>
                                    <td class="center bg-darkgray black font14 weight700 td-10">다운권한</td>
                                    <td class="td-15 p-lr3">
                                        <select class="sel-100" name="boardDownload">
                                            <option value="0">모두</option>
                                            <option value="1">직원</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <div class="btn-wrap m-tb5 center">
                                <button class="btn-on cursor" type="button" id="btn">게시판등록</button>
                                <button class="btn-off cursor" type="reset">취소</button>
                            </div>
                        </form>
                        
                    </div>
                    <div class="modify-board">
                        <div class="title">
                            <h3 class="tomato font18 m-b10 m-t20 ">
                                <i class="fas fa-file-alt"></i> 게시판관리 > 게시물판목록
                            </h3>
                        </div>
                        <div class="flex flex-justify">
                            <div class="btn-normal">생성된 게시판 수 ${searchCount}개</div>
                            <div class="">
                            	<form method="post">
	                                <div class="flex">
		                                <select class="m-lr3" name="searchOpt">
		                                    <option value="department_name" <c:if test="${searchOpt eq 'department_name'}">selected</c:if>>게시판그룹</option>
		                                    <option value="boardTitle" <c:if test="${searchOpt eq 'boardTitle'}">selected</c:if>>제목</option>
		                                    <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if>>게시판그룹+제목</option>
		                                </select>
		                                <input type="text" name="words" required style="margin-left:-2px" autocomplete="off" />
	                                	<button type="submit" class="btn-on m-lr5">회원검색</button>
                            			<button class="btn-off" onClick="deleteAll();">선택삭제</button>
                        			</div>
	                            </form>
                            </div>
                        </div>
                            <table class="m-t5 board_list">                            
                                <tr class="center bg-darkgray black font14 weight700" id="rowColor">
                                    <td class="td-5">
                                        <input type="checkbox" id="checkAll" onclick="chkAll();"/>
                                    </td>
                                    <td class="td-8">게시판그룹</td>
                                    <td class="td-8">게시판코드</td>
                                    <td class="td-8">게시판색상</td>
                                    <td>게시판제목</td>
                                    <td class="td-5">읽기권한</td>
                                    <td class="td-5">쓰기권한</td>
                                    <td class="td-5">댓글권한</td>
                                    <td class="td-5">다운권한</td>
                                    <td class="td-8">비고</td>
                                </tr>
                                <c:forEach  items="${list}" var="board">
	                                <tr class="center font14">
	                                    <td><input type="checkbox" name="chk" class="chk" data-uid="${board.boardCode}"/></td>
	                                    <td>${board.department_name}</td>
	                                    <td><a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${board.boardCode}" target="_blank" class="weight700" id="boardCode">${board.boardCode}</td>
	                                    <td>${board.boardColor}</td>
	                                    <td>
	                                        <a href="${pageContext.request.contextPath}/article/grp_article_list?boardCode=${board.boardCode}" target="_blank" class="weight700">${board.boardTitle}</a>
	                                    </td>
	                                    <td>${board.boardRead}</td>
	                                    <td>${board.boardWrite}</td>
	                                    <td>${board.boardReply}</td>
	                                    <td>${board.boardDownload}</td>
	                                    <td>
	                                        <span class="s-btn-on cursor" onClick="popup('${board.boardCode}');">수정</span>
	                                        <button class="s-btn-off" onClick="boardDelete('${board.boardCode}');">삭제</button>
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
		                                        <a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=1&searchOpt=${searchOpt}&words=${words}">
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
		                                    <a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
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
		                                    <a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
		                                        <span class="page">${num}</span>
		                                    </a>
		                                </c:if>
		
		                            </c:forEach>
		                            <!-- 페이지번호 끝 -->
		
		                            <!-- 한칸 뒤로  -->
		                            <c:choose>
		                                <c:when test="${curPage != totalPage}">
		                                    <a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
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
		                                        <a href="${pageContext.request.contextPath}/board/grp_board_main?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
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

    </div>

</body>
<script src="${pageContext.request.contextPath}/calendar/core/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/core/locales/ko.js"></script>
<script src="${pageContext.request.contextPath}/calendar/interaction/main.js"></script>
<script src="${pageContext.request.contextPath}/calendar/daygrid/main.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>

<script src="${pageContext.request.contextPath}/js/grp_board/grp_board_main.js"></script>
</html>