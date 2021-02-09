<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groupware administor</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/beac665ab2.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
</head>
<style>
#btn:hover {
	background-color:#6B8BB5;
	color:#fff;
}

td:nth-child(2n-1) {
	background-color:#6B8BB5;
}
</style>

<body>
    <div class="container p10 bg-gray" style="height:100%;">
        <div class="top-wrap">
            <div class="top  ">
                <div class="logo bg-white p10" >
                    <div class="flex flex-justify m-t10 m-b5">
                        <div class="title ">
                            <h3 class="font18 m-b5">
                                <i class="fas fa-file-alt "></i> ${boardTitle} > 게시글 상세보기
                            </h3>
                        </div>
                    </div>
                    <div>
                    	<input type="hidden" name="boardCode" value="${boardCode}" />
                        <table>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">게시물분류</td>
                                <td class="td-40 m-lr3 p-lr3" colspan="3">
                                    <div class="p10">
                                    	<c:if test="${list.division eq 0}">공지사항</c:if>
                                    	<c:if test="${list.division eq 1}">일반게시물</c:if>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">게시물제목</td>
                                <td colspan="3" class="td-90 p-lr3">
                                	<div class="p10">${list.subject}</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">작성자</td>
                                <td colspan="3" class="td-90 p-lr3">
                                    <div class="p10">${list.writer}</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">게시물내용</td>
                                <td colspan="3">
                                	<div style="width:100%;height:500px;padding:10px;">${list.content}</div>
                                </td>
                            </tr>
                            <tr>
                            	<td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">조회수</td>
                            	<td colspan="3">
                            		<div class="p10">${list.hit}</div>
                            	</td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">첨부파일</td>
                                <td colspan="3" class="td-90">
                                	<c:if test="${list.fileOriName == null }">
                                		<span class="p10">첨부파일이 없습니다.</span>
                                	</c:if>
	                                
                                    <c:if test="${list.fileOriName != null}">
										<span class="file" style="margin:0 10px;">
											<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}">${list.fileOriName}</a>
										</span>
										<span class="" >
                                    		<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-download"></i></a>
                                    	</span>
								    </c:if>
                                </td>
                            </tr>
                        </table>
                        <div class="m-t5 right">
	                    	<button type="button" class="btn-off" onclick="location.href='${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}'">게시물 목록</button>
	                    	<button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/article/grp_article_reply?boardCode=${boardCode}&aid=${list.aid}'">답글달기</button>                      
	                    	<c:if test="${list.writer eq sessionScope.empName || sessionScope.empAuth > 4}">
	                    		<button type="button" class="btn-on black" onClick="location.href='${pageContext.request.contextPath}/article/grp_article_modify?boardCode=${boardCode}&aid=${list.aid}'">수정하기</button>
	                    	</c:if>
	                    	<c:if test="${list.writer eq sessionScope.empName || sessionScope.empAuth > 4}">
	                    		<button type="button" class="btn-on black" onClick="deleteOne('${boardCode}','${list.aid}');">삭제하기</button>
	                    	</c:if>
	                    </div>
                    </div>
                    <hr style="margin:30px 0; border:1px solid #eee;"/>
                    <form id="frm">
	                    <input type="hidden" name="boardCode" id="boardCode" value="${boardCode}"/>
	                    <input type="hidden" name="aid" value="${list.aid}"/>
	                    <input type="hidden" name="who" value="${sessionScope.empName}"/>
	                    <div>
	                    	<div style="margin:10px;" class="font18">댓글</div>
	                    </div>
	                    <div class="flex">
	                    	<textarea id="comment" name="comment" class="p10" style="width:90%;height:120px;border:solid 1px #eee;"placeholder="댓글 내용을 입력하세요."></textarea>
	                    	<button id="btn" class="btn-off white weight700 font20" style="width:10%;height:120px;background-color:#29558a;border:1px solid #244875;color:#fff;" onClick="addComment();">댓글등록</button>
	                    </div>
		                <hr style="margin:30px 0; border:1px solid #eee;"/>
                    	<div id="commentList"></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/grp_board/grp_article_view.js"></script>
</html>