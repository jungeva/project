<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<style>
   .content-box {
       border:1px solid #eee;
       padding:10px 20px;
   }
   .contents {
       display:none;
   }

   .member-info-left {
        width:11%;
   }

    .member-info-right {
        width: 88.7%;
        max-width:1728px;
    }
    .member-photo, .sign-photo {
        width:100%;
    }

   .member-photo img {
        width:100%;
        height:205px;
    }

    .sign-photo img {
        width:100%;
        height:100px;
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
        <div class="bottom m-t10">
            <div class="right-info bg-white p20">
                <div class="title m-b5">
                    <h3 class="tomato font18">
                        <i class="fas fa-sitemap"></i> ${empOne.empName}님의 사원정보
                    </h3>
                </div>
                <div class="page-content">
                    <form method="post" >
                        <input type="hidden" name="empID" value="${empOne.empID}"/>
                        <h4 class="font16 noto m-t10 m-b10">[기본정보]</h4>
                        <div class="flex flex-justify">
	                        <div class="photo" style="width:25%">
	                        	<c:if test="${others.empPhoto == null}">
	                        		<div class="member-photo">
	                                	<img src="${pageContext.request.contextPath}/images/no.jpg" id="empPhotoImg" name="empPhoto" />
	                             	</div>
	                             </c:if>
	                             <c:if test="${others.empPhoto != null}">
	                        		<div class="member-photo">
	                                	<img src="${pageContext.request.contextPath}/${others.empPhoto}" id="empPhotoImg" name="empPhoto" />
	                             	</div>
	                             </c:if>
	                         </div>
	                         <div style="width:65%">
		                        <table >
		                            <tr>
		                                <td  class="td-20 center weight700 bg-darkgray black" >사원번호</td>
		                                <td class="p-lr10">${empOne.empNumber}</td>
		                            </tr>
		                            <tr>
		                                <td  class="td-10 center weight700 bg-darkgray black">사원명</td>
		                                <td class="p-lr10">${empOne.empName}</td>
		                            </tr>
		                            <tr>
		                                <td  class="td-10 center weight700 bg-darkgray black">입사일</td>
		                                <td class="p-lr10">${empOne.empEnterDate}</td>
		                            </tr>
		                            <tr>
		                                <td  class="td-10 center weight700 bg-darkgray black">부서</td>
		                                <td class="p-lr10">${empOne.empDepartmentName}</td>
		                            </tr>
		                            <tr>
		                                <td  class="td-10 center weight700 bg-darkgray black">직책</td>
		                                <td class="p-lr10">${empOne.empGradeName}</td>
		                            </tr>
		                        </table>
		                    </div>
		                </div>
                        <h4 class="font16 noto m-t20 m-b10">[상세정보]</h4>
                        <div class="member-info">
                            <div class="member-info-right" style="width:100%;">
                               <table>
                                   <tr>
                                       <td class="td-8 center weight700 weight700 bg-darkgray black" >영문성명</td>
                                       <td class="td-13 p-lr10">${others.empEngName}</td>
                                       <td class="td-8 center weight700 weight700 bg-darkgray black">성별</td>
                                       <td class="td-13 p-lr10">
                                       		<c:if test="${others.empGender eq 'M'}">남</c:if>
                                            <c:if test="${others.empGender eq 'F'}">여</c:if>                                
                                       </td>
                                       <td class="td-8 center weight700 bg-darkgray black">생년월일</td>
                                       <td class="td-13 p-lr10">${others.empBirth}</td>
                                       <td  class="td-8 center weight700 bg-darkgray black">결혼여부</td>
                                       <td class="td-13 p-lr10">
                                       		<c:if test="${others.empMarried eq 'N'}">미혼</c:if>
                                            <c:if test="${others.empMarried eq 'Y'}">기혼</c:if>
                                       </td>
                                   </tr>
                                   <tr>
                                        <td  class="td-8 center weight700 bg-darkgray black">Tel</td>
                                        <td class="td-13 p-lr10">${others.empTel}</td>
                                        <td  class="td-8 center weight700 bg-darkgray black" >비상연락처</td>
                                        <td class="td-13 p-lr10">${others.empEmergencyTel}"</td>
                                        <td  class="td-8 center weight700 bg-darkgray black">C.P</td>
                                        <td class="td-13 p-lr10">${others.empCp}</td>
                                        <td  class="td-8 center weight700 bg-darkgray black">내선번호</td>
                                        <td class="td-13 p-lr10">${others.empExtension}</td>
                                    </tr>
                                    <tr>
                                        <td  class="td-8 center weight700 bg-darkgray black">우편번호</td>
                                        <td class="td-13 p-lr10" colspan="7">${others.empPostcode}</td>                                     
                                    </tr>
                                    <tr>
                                        <td  class="td-8 center weight700 bg-darkgray black">주소</td>
                                        <td colspan="7" class="td-13 p-lr10">${others.empAddr}(${others.empExtraAddr})</td>                                       
                                    </tr>
                                    <tr>
                                        <td  class="td-8 center weight700 bg-darkgray black">상세주소</td>
                                        <td colspan="7" class="td-13 p-lr10">${others.empDetailAddr}</td>                                       
                                    </tr>
                                    <tr>
                                     	<td  class="td-8 center weight700 bg-darkgray black">이메일</td>
                                        <td class="td-13 p-lr10">${others.empEmail}</td>
                                        <td  class="td-8 center weight700 bg-darkgray black">채용형태</td>
                                        <td class="td-13 p-lr10">
                                            <c:if test="${others.empRecruit eq 'open'}">공개채용</c:if>
                                            <c:if test="${others.empRecruit eq 'special'}">특별채용</c:if>
                                            <c:if test="${others.empRecruit eq 'frequently'}">수시채용</c:if>
                                       </td>
                                       <td  class="td-8 center weight700 bg-darkgray black">재직여부</td>
                                       <td class="td-13 p-lr10">
                                            <c:if test="${others.empEmployment eq 'work'}">재직</c:if>
                                            <c:if test="${others.empEmployment eq 'vacation'}">휴직</c:if>
                                            <c:if test="${others.empEmployment eq 'quit'}">퇴사</c:if>
                                       </td>                                      
                                       <td  class="td-8 center weight700 bg-darkgray black">병역구분</td>
                                       <td class="td-13 p-lr10">
                                            <c:if test="${others.empMilitary eq 'Y'}">병역필</c:if>
                                            <c:if test="${others.empMilitary eq 'N'}">병역미필</c:if>
                                       </td>
                                   </tr>
                                   <tr>
                                        <td  class="td-8 center weight700 bg-darkgray black">보훈여부</td>
                                        <td class="td-13 p-lr10">
                                                <c:if test="${others.empSpeciality eq 'N'}">비대상</c:if>
                                                <c:if test="${others.empSpeciality eq 'Y'}">대상</c:if>
                                        </td>
                                        <td  class="td-8 center weight700 bg-darkgray black">장애여부</td>
                                        <td class="td-13 p-lr10">
                                                <c:if test="${others.empDisability eq 'N'}">비장애</c:if>
                                                <c:if test="${others.empDisability eq 'Y'}">장애</c:if>
                                        </td>
                                        <td  class="td-8 center weight700 bg-darkgray black">자격증1</td>
                                        <td class="td-13 p-lr10">${others.empLicense1}"</td>
                                        <td  class="td-8 center weight700 bg-darkgray black">자격증2</td>
                                        <td class="td-13 p-lr10">${others.empLicense2}</td>
                                    </tr>
                                    <tr>
                                        <td class="td-8 center weight700 bg-darkgray black">어학사항1</td>
                                        <td class="td-13 p-lr10">${others.empLanguage1}</td>
                                        <td class="td-8 center weight700 bg-darkgray black">어학사항2</td>
                                        <td class="td-13 p-lr10">${others.empLanguage2}</td>
                                        <td class="td-8 center weight700 bg-darkgray black">상벌사항1</td>
                                        <td class="td-13 p-lr10">${others.empRewardPunish1}</td>
                                        <td class="td-8 center weight700 bg-darkgray black">상벌사항2</td>
                                        <td class="td-13 p-lr10">${others.empRewardPunish2}</td>
                                    </tr>
                               </table>
                            </div>                            
                        </div>
                        <div class="comment">
                            <div class="title">
                                <h3 class="font16 noto m-t20 m-b10">
                                   	 추가사항 입력
                                </h3>
                            </div>
                            <div class="content">
                                <textarea id="editor" name="empComment" style="border:1px solid #ccc;padding:10px;border-radius:2px;width:100%;height:250px;" class="noto" >
                                	${others.empComment}
                                </textarea>                                
                            </div>                                        
                        </div>
                    </form>
                </div>
            </div>
        </div>       
    </div>
</body>
<script src="${pageContext.request.contextPath}/js/treeview.js"></script>
<script src="${pageContext.request.contextPath}/js/tab.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script>
	
	//프린트팝업창 띄우기
	$(function printInfo() {
		window.print();
	});
	
</script>
</html>