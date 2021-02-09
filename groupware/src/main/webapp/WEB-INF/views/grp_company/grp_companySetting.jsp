<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
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
 
 table {
 	font-size:14px;
 }
 
 .sign_photo>img {
 	width:300px;
 	height:150px;
 }
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
            	<div class="title">
                    <h3 class="font18 m-tb10">
                        <i class="fas fa-building"></i> 회사기본정보 > 회사정보설정
                    </h3>
                </div>
                <div class="company_wrap">
                	<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/company/grp_companySetting">
                		<table>
                			<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10 font14">회사로고</td>
		                		<td class="p-lr3 p-tb10">
		                			<div class="sign_photo m-t20">
                                        <img src="${pageContext.request.contextPath}/${info.comLogo}" id="comLogoImg" name="comLogo" />
                                    </div>
                                    <input type="file" name="file" id="comLogo" class="logo" style="width:23%;" />
                                    <p class="m-t20">*3MB 이하의 파일만 업로드할 수  있습니다.</p>
		                			<p>*이미지 사이즈는 300*150, 배경화면은 투명으로 제작해 주시기 바랍니다.</p>
		                			<p>*파일 확장자는 PNG, 파일명은 영문,숫자로 저장해야 합니다.</p>
		                		</td>
		                	</tr>
		                	<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10">회사명</td>
		                		<td class="p-lr3">
		                			<input type="text" class="input-100" name="comName" id="comName" value="${info.comName}" autocomplete="off">
		                		</td>
		                	</tr>
		                	<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10">대표전화</td>
		                		<td class="p-lr3">
		                			<input type="text" name="comTel" id="comTel" value="${info.comTel}" autocomplete="off">
		                		</td>
		                	</tr>
		                	<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10">팩스번호</td>
		                		<td class="p-lr3">
		                			<input type="text" name="comFax" id="comFax" value="${info.comFax}" autocomplete="off">
		                		</td>
		                	</tr>
		                	<tr>
                                <td class="bg-darkgray weight700 td-20 black p-lr10">우편번호</td>
                                <td class="p-lr3">
                                    <input type="text" id="sample6_postcode" name="comPostcode" placeholder="우편번호" value="${info.comPostcode}" autocomplete="off">
                                    <input type="button" onclick="sample6_execDaumPostcode()" class="cursor" value="우편번호 찾기"><br>
                                </td>                                     
                            </tr>
                            <tr>
                                <td class="bg-darkgray weight700 td-20 black p-lr10">주소</td>
                                <td class="p-lr3">
                                   <input class="input-100" type="text" id="sample6_address" name="comAddr" placeholder="주소" value="${info.comAddr}" autocomplete="off"><br>
                                </td>                                       
                            </tr>
                            <tr>
                                <td class="bg-darkgray weight700 td-20 black p-lr10">상세주소</td>
                                <td class="p-lr3">
                                    <input class="input-160" type="text" id="sample6_detailAddress" name="comDetailAddr" placeholder="상세주소" value="${info.comDetailAddr}" autocomplete="off">
									<input type="text" id="sample6_extraAddress" name="comExtraAddr" placeholder="참고항목" value="${info.comExtraAddr}" autocomplete="off">
                                </td>                                       
                            </tr>
                		<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10">Web URL</td>
		                		<td class="p-lr3">
		                			<input type="text" class="input-100" name="comURL" id="comURL" value="${info.comURL}" autocomplete="off">
		                		</td>
		                	</tr>
		                	<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10">Web Copyright</td>
		                		<td class="p-lr3">
		                			<input type="text" class="input-100" name="comCopy" id="comCopy" value="${info.comCopy}" autocomplete="off">
		                		</td>
		                	</tr>
		                	<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10">사이트 상단메뉴</td>
		                		<td class="p-lr3">
		                			<input type="text" class="input-100" name="comMainMenu" id="comMainMenu" value="${info.comMainMenu}" placeholder="(,)로구분하여 적어주세요." autocomplete="off">
		                		</td>
		                	</tr>
		                	<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10">사이트 메인 텍스트 상단</td>
		                		<td class="p-lr3">
		                			<input type="text" class="input-100" name="comTitle" id="comTitle" value="${info.comTitle}" autocomplete="off">
		                		</td>
		                	</tr>
		                	<tr>
		                		<td class="bg-darkgray weight700 td-20 black p-lr10">사이트 메인 텍스트 하단</td>
		                		<td class="p-lr3">
		                			<input type="text" class="input-100" name="comSubTitle" id="comSubTitle" value="${info.comSubTitle}" autocomplete="off">
		                		</td>
		                	</tr>
                		</table>
                		<div class="btn-grp center m-t10">
                            <button type="submit" class="btn-normal">정보수정</button>
                            <button type="reset" class="btn-cancel" >새로고침</button>
                        </div>
                	</form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/grp_company/grp_companySetting.js"></script>
</html>