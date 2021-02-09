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

<body>
    <div class="container p10 bg-gray">
        <div class="top-wrap">
            <div class="top  ">
                <div class="logo bg-white p10">
                    <div class="flex flex-justify m-t10 m-b5">
                        <div class="title ">
                            <h3 class="font18">
                                <i class="fas fa-file-alt"></i> ${boardTitle} > 게시글수정하기
                            </h3>
                        </div>
                        
                    </div>
                    <form method="post" enctype="multipart/form-data" onClick="${pageContext.request.contextPath}/article/grp_article_modify">
                    	<input type="hidden" name="boardCode" value="${boardCode}" />
                        <input type="hidden" name="aid" value="${list.aid}" />
                        <table>
                           <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">게시물분류</td>
                                <td class="td-40 m-lr3 p-lr3" colspan="3">
                                    <select name="division" class="sel-135">
                                    	<option value="0">공지사항</option>
                                    	<option value="1" selected>일반게시물</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">게시물제목</td>
                                <td colspan="3" class="td-90 p-lr3">
                                    <input type="text" value="${list.subject}" name="subject" id="subject" class="input-100" maxlength="50" required autocomplete="off"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">작성자</td>
                                <td colspan="3" class="td-90 p-lr3">
                                    <input type="text" name="writer" id="writer" class="input-100" value="${list.writer}" readonly required/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">게시물내용</td>
                                <td colspan="3">
                                    <textarea id="editor" name="content" class="" required >${list.content}</textarea>
                                    <script>
                                        CKEDITOR.replace('editor');
                                        CKEDITOR.config.height = 400;
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">첨부파일</td>
                                <c:if test="${list.fileOriName == null}">
	                                <td colspan="3" class="td-90 p-lr3 weight700">
		                                <input type="file" name="files" class="input-100" />
		                            </td>
		                        </c:if>
		                        <c:if test="${list.fileOriName != null}">
		                        	<td class="td-40 p-lr3 weight700">
		                                <input type="file" name="files" class="input-100" />
		                            </td>
		                            <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">기존파일</td>
		                            <td class="td-40 p-lr3 weight700">
										<span class="p10">${list.fileOriName}</span>
									</td>
								</c:if>
                            </tr>
                        </table>
                        <div class="m-t5 flex flex-justify">
	                        <div>
	                        	<button type="button" class="btn-on" onclick="location.href='${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}'">게시물 목록</button>  
	                        </div>
	                        <div>
		                        <button type="submit" class="btn-on btn">저장</button>
		                        <button type="button" class="btn-off" onclick="location.href='${pageContext.request.contextPath}/article/grp_article_list?boardCode=${boardCode}'">취소</button>
		                    </div>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>