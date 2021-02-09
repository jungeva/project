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

</head>
<style>
   tr:hover {
        background-color: #EFF1F6;
    }
</style>

<body>
    <div class="container p10 bg-gray">
        <div class="top-wrap">
            <div class="top" >
                <div class="logo bg-white p10" style="height:calc(100vh - 20px);">
                    <div class="title">
                        <h3 class="font18 m-b10 m-t10 ">
                            <i class="fas fa-file-alt"></i></i> ${boardTitle}
                        </h3>
                    </div>
                    <div class="flex flex-justify m-t20">
                        <div class="">
                            <span class="btn-normal">생성된 게시판 수 ${searchCount}개</span>
                        </div>
                        <div class="">
                            <form method="post" >
                                <select class="" name="searchOpt">
                                    <option value="writer" <c:if test="${searchOpt eq 'writer'}">selected</c:if>>작성자</option>
                                    <option value="subject" <c:if test="${searchOpt eq 'subject'}">selected</c:if>>게시글제목</option>
                                    <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if>>작성자+게시글제목</option>                                 
                                </select>
                                <input type="text" name="words" style="margin-left:-2px" autocomplete="off"/>
                                <button type="submit" class="btn-off">게시글검색</button>
                                <button type="button"  class="btn-on cursor" onClick="location.href='${pageContext.request.contextPath}/article/grp_article_insert?boardCode=${boardCode}'">게시글작성</button>                                
                            </form>
                        </div>
                    </div>
                    <table class="m-t5">                            
                        <tr class="center black font14 weight700" style="background-color:${boardColor}">
                            <td class="td-7">번호</td>
                            <td class="td-10">분류</td>
                            <td>게시물제목</td>
                            <td class="td-7">작성자</td>
                            <td class="td-10">작성일</td>
                            <td class="td-7">조회수</td>
                            <td class="td-5">첨부</td>
                            <td class="td-5">비고</td>
                        </tr>
                        
                        <c:if test="${totalCount == 0}">
                            <tr>
                                <td colspan="12" class="center font14 weight700">등록된 게시물이 없습니다.</td>
                            </tr>
                        </c:if>

                        <c:if test="${totalCount != 0 and searchCount == 0}">
                            <tr>
                                <td colspan="12" class="m-t5 font14 weight700 center">
                                    <i class="fas fa-exclamation-circle"></i> 검색된 결과가 없습니다.
                                </td>
                            </tr>
                        </c:if>
                        
                        <c:forEach items="${list}" var="list" varStatus="status">
	                        <tr class="center font14">
	                            <td>
	                            	<c:if test="${list.division == 0}">
	                            		<span>-</span>
	                            	</c:if>
	                            	<c:if test="${list.division == 1}">
	                            		${ (searchCount - status.index ) - ( (curPage -1) * end) }
	                            	</c:if>
	                            </td>
	                            <td>
	                            	<c:if test="${list.division == 0}">
	                            		<span class="notice weight700" style="color:#f00;">공지</span>
	                            	</c:if>
	                            	<c:if test="${list.division == 1}">
	                            		<span class="">일반</span>
	                            	</c:if>
	                            </td>
	                            <td class="left p-lr10 weight700">
	                            	<c:forEach begin="1" end="${list.re_level}">
	                            		<img src = "${pageContext.request.contextPath}/images/icon_reply.gif" />	
	                            	</c:forEach>
	                                <a href="grp_board_detail.html" target="_blank">
	                                <span>
	                                	<c:if test="${list.division == 0}">
		                            		<span class="weight700" onClick="location.href='${pageContext.request.contextPath}/article/grp_article_view?boardCode=${boardCode}&aid=${list.aid}'" style="color:tomato;">
		                            			${list.subject}
		                            			<span style="color:tomato;">
		                            				<span>(<span>${list.count}</span>)</span>
		                            			</span>
		                            		</span>
		                            	</c:if>
		                            	<c:if test="${list.division != 0}">
		                            		<span class="weight700" onClick="location.href='${pageContext.request.contextPath}/article/grp_article_view?boardCode=${boardCode}&aid=${list.aid}'">
		                            			${list.subject}
		                            			<span style="color:tomato;">
		                            				<span>(<span>${list.count}</span>)</span>
		                            			</span>
		                            		</span>
		                            	</c:if>
	                                </span>
	                                </a>
	                            </td>
	                            <td>${list.writer}</td>
	                            <td>${list.regdate}</td>
	                            <td>${list.hit}</td>
	                            <td>
	                            	<c:set var="fileName" value="${fn:toLowerCase(list.fileOriName)}" />
	                            	<c:forTokens items="${fileName}" var="file" delims="." varStatus="status">
	                            		<c:if test="${status.last}">
	                            			<c:choose>
	                            				<c:when test="${file eq 'jpg' || file eq 'png' || file eq 'jfjf'}">
	                            					<c:if test="${sessionScope.empAuth >1}">
	                   	         						<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-file-image font18"></i></a>
	                            					</c:if>
	                            				</c:when>
	                            				<c:when test="${file eq 'pdf'}">
	                            					<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-file-pdf font18"></i></a>
	                            				</c:when>
	                            				<c:when test="${file eq 'ppt' || file eq 'pptx'}">
	                            					<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-file-powerpoint font18"></i></a>
	                            				</c:when>
	                            				<c:when test="${file eq 'xls' || file eq 'xlsx'}">
	                            					<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-file-excel font18"></i></a>
	                            				</c:when>
	                            				<c:when test="${file eq 'hwp' || file eq ''}">
	                            					<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-file-word font18"></i></a>
	                            				</c:when>
	                            				<c:when test="${file eq 'zip'}">
	                            					<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-file-archive font18"></i></a>
	                            				</c:when>
	                            				<c:when test="${file eq 'txt' || file eq 'log'}">
	                            					<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-file-alt font18"></i></a>
	                            				</c:when>
	                            				<c:otherwise>
	                            					<a href="${pageContext.request.contextPath}/article/grp_article_download?boardCode=${boardCode}&aid=${list.aid}"><i class="fas fa-file font18"></i></a>
	                            				</c:otherwise>
	                            			</c:choose>
	                            		</c:if>
	                            	</c:forTokens>
	                            </td>
	                            <td>
	                                <button class="s-btn-on cursor" onClick="location.href='${pageContext.request.contextPath}/article/grp_article_modify?boardCode=${boardCode}&aid=${list.aid}'">수정</button>
	                                <button type="button" class="s-btn-off" onClick="deleteOne('${boardCode}','${list.aid}');">삭제</button>
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
                                        <a href="${pageContext.request.contextPath}/article/grp_article_list?curPage=1&searchOpt=${searchOpt}&words=${words}&boardCode=${boardCode}">
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
                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}&boardCode=${boardCode}">
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
                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?curPage=${num}&searchOpt=${searchOpt}&words=${words}&boardCode=${boardCode}">
                                        <span class="page">${num}</span>
                                    </a>
                                </c:if>

                            </c:forEach>
                            <!-- 페이지번호 끝 -->

                            <!-- 한칸 뒤로  -->
                            <c:choose>
                                <c:when test="${curPage != totalPage}">
                                    <a href="${pageContext.request.contextPath}/article/grp_article_list?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}&boardCode=${boardCode}">
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
                                        <a href="${pageContext.request.contextPath}/article/grp_article_list?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}&boardCode=${boardCode}">
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
</body>
<script src="${pageContext.request.contextPath}/js/grp_board/grp_article_list.js"></script>
</html>