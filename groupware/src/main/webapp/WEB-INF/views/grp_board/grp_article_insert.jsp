<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                                <i class="fas fa-file-alt"></i> ${boardTitle} > 게시글작성하기
                            </h3>
                        </div>
                        
                    </div>
                    <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/article/grp_article_add">
                    	<input type="hidden" name="boardCode" value="${boardCode}" />
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
                                    <input type="text" name="subject" id="subject" class="input-100" maxlength="50" required autocomplete="off"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">작성자</td>
                                <td colspan="3" class="td-90 p-lr3">
                                    <input type="text" name="writer" id="writer" class="input-100" value="${sessionScope.empName}" readonly required/>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">게시물내용</td>
                                <td colspan="3">
                                    <textarea id="editor" name="content" class="" required></textarea>
                                    <script>
                                        CKEDITOR.replace('editor');
                                        CKEDITOR.config.height = 400;
                                    </script>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-10 bg-darkgray center noto black font14" style="background-color:${boardColor}">첨부파일</td>
                                <td colspan="3" class="td-90">
                                    <input type="file" name="files" multiple class="input-100" />
                                </td>
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