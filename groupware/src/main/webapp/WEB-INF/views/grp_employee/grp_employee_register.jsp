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
            <div class="right-info bg-white p10" style="width:87% ">
                <div class="title m-b5">
                    <h3 class="tomato font18 m-t20">
                        <i class="fas fa-sitemap"></i> 사원조직 <i class="fas fa-angle-right"></i> 사원정보입력
                    </h3>
                </div>
                <div class="page-content">
                    <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/grp_employee/grp_employee_register">
                        <h4 class="font16 noto m-t10 m-b10">[기본정보]</h4>
                        <input type="hidden" name="empID" value="${empOne.empID}"/>
                        <table>
                            <tr>
                                <td  class="td-7 center weight700 bg-darkgray black" >사원번호</td>
                                <td class="p-lr3">
                                    <input type="text" name="empNumber" id="empNumber" class="input-165" value="${empOne.empNumber}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td  class="td-7 center weight700 bg-darkgray black">사원명</td>
                                <td class="p-lr3">
                                    <input type="text" name="empName" id="empName" class="input-165" value="${empOne.empName}"/>
                                </td>
                            </tr>
                            <tr>
                                <td  class="td-7 center weight700 bg-darkgray black">입사일</td>
                                <td class="p-lr3">
                                    <input type="text" name="empEnterDate" id="empEnterDate" class="input-165" value="${empOne.empEnterDate}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td  class="td-7 center weight700 bg-darkgray black">부서</td>
                                <td class="p-lr3">
                                    <input type="text" name="empDepartmentCode" id="empDepartmentCode" class="input-165" value="${empOne.empDepartmentName}" />
                                </td>
                            </tr>
                            <tr>
                                <td  class="td-7 center weight700 bg-darkgray black">직책</td>
                                <td class="p-lr3">
                                    <input type="text" name="empGradeCode" id="empGradeCode" class="input-165" value="${empOne.empGradeName}" />
                                </td>
                            </tr>
                        </table>
                        <h4 class="font16 noto m-t20 m-b10">[상세정보]</h4>
                        <div class="member-info flex flex-justify">
                           <div class="member-info-left" style="margin-right:10px;">
                               <div class="photo">
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
                                   <div class="photo-btn center m-t5">
                                       <input type="file" name="file" id="empPhoto"/>
                                   </div>
                                </div>
                            </div>
                            <div class="member-info-right">
                               <table>
                                   <tr>
                                       <td class="td-7 center weight700 weight700 bg-darkgray black" >영문성명</td>
                                       <td class="td-13 p-lr3">
                                        <input type="text" name="empEngName" id="empEngName" class="input-100" value="${others.empEngName}"/>                                       
                                       </td>
                                       <td class="td-7 center weight700 weight700 bg-darkgray black">성별</td>
                                       <td class="td-13 p-lr3">
                                        <select name="empGender" class="sel-100" id="empGender">
                                            <option value="M"<c:if test="${others.empGender eq 'M'}">selected</c:if>>남</option>
                                            <option value="F"<c:if test="${others.empGender eq 'F'}">selected</c:if>>여</option>
                                        </select>                                     
                                       </td>
                                       <td class="td-7 center weight700 bg-darkgray black">생년월일</td>
                                       <td class="td-13 p-lr3">
                                        <input type="date" name="empBirth" id="empBirth" class="input-100" value="${others.empBirth}"/>
                                       </td>
                                       <td  class="td-7 center weight700 bg-darkgray black">결혼여부</td>
                                       <td class="td-13 p-lr3">
                                       		<select name="empMarried" class="sel-100" id="empMarried">
                                                <option value="N"<c:if test="${others.empMarried eq 'N'}">selected</c:if>>미혼</option>
                                                <option value="Y"<c:if test="${others.empMarried eq 'Y'}">selected</c:if>>기혼</option>
                                            </select>
                                       </td>
                                   </tr>
                                   <tr>
                                        <td  class="td-7 center weight700 bg-darkgray black">Tel</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empTel" id="empTel" class="input-100" value="${others.empTel}"/>
                                        </td>
                                        <td  class="td-7 center weight700 bg-darkgray black" >비상연락처</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empEmergencyTel" id="empEmergencyTel" class="input-100" value="${others.empEmergencyTel}"/>
                                        </td>
                                        <td  class="td-7 center weight700 bg-darkgray black">C.P</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empCp" id="empCp" class="input-100" value="${others.empCp}"/>
                                        </td>
                                        <td  class="td-7 center weight700 bg-darkgray black">내선번호</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empExtension" id="empExtension" class="input-100" value="${others.empExtension}"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  class="td-7 center weight700 bg-darkgray black">우편번호</td>
                                        <td class="td-13 p-lr3" colspan="7">
                                            <input type="text" id="sample6_postcode" name="empPostcode" placeholder="우편번호" value="${others.empPostcode}">
                                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                        </td>                                     
                                    </tr>
                                    <tr>
                                        <td  class="td-7 center weight700 bg-darkgray black">주소</td>
                                        <td colspan="7" class="td-13 p-lr3">
                                           <input class="input-100" type="text" id="sample6_address" name="empAddr" placeholder="주소" >
                                        </td>                                       
                                    </tr>
                                    <tr>
                                        <td  class="td-7 center weight700 bg-darkgray black">상세주소</td>
                                        <td colspan="7" class="td-13 p-lr3">
                                            <input class="input-160" type="text" id="sample6_detailAddress" name="empDetailAddr" value="${others.empDetailAddr}" placeholder="상세주소">
											<input type="text" id="sample6_extraAddress" name="empExtraAddr" placeholder="참고항목" value="${others.empExtraAddr}">
                                        </td>                                       
                                    </tr>
                                    <tr>
                                     	<td  class="td-7 center weight700 bg-darkgray black">이메일</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empEmail" id="empEmail" class="input-100"  value="${others.empEmail}"/>
                                        </td>
                                        <td  class="td-7 center weight700 bg-darkgray black">채용형태</td>
                                        <td class="td-13 p-lr3">
                                        <select name="empRecruit" class="sel-100" id="empRecruit">
                                            <option value="open"<c:if test="${others.empRecruit eq 'open'}">selected</c:if>>공개채용</option>
                                            <option value="special"<c:if test="${others.empRecruit eq 'special'}">selected</c:if>>특별채용</option>
                                            <option value="frequently"<c:if test="${others.empRecruit eq 'frequently'}">selected</c:if>>수시채용</option>
                                        </select>
                                       </td>
                                       <td  class="td-7 center weight700 bg-darkgray black">재직여부</td>
                                       <td class="td-13 p-lr3">
                                        <select name="empEmployment" class="sel-100" id="empEmployment">
                                            <option value="work"<c:if test="${others.empEmployment eq 'work'}">selected</c:if>>재직</option>
                                            <option value="vacation"<c:if test="${others.empEmployment eq 'vacation'}">selected</c:if>>휴직</option>
                                            <option value="quit"<c:if test="${others.empEmployment eq 'quit'}">selected</c:if>>퇴사</option>
                                        </select>
                                       </td>                                      
                                       <td  class="td-7 center weight700 bg-darkgray black">병역구분</td>
                                       <td class="td-13 p-lr3">
                                        <select name="empMilitary" class="sel-100" id="empMilitary">
                                            <option value="Y"<c:if test="${others.empMilitary eq 'Y'}">selected</c:if>>병역필</option>
                                            <option value="N"<c:if test="${others.empMilitary eq 'N'}">selected</c:if>>병역미필</option>
                                        </select>
                                       </td>
                                   </tr>
                                   <tr>
                                        <td  class="td-7 center weight700 bg-darkgray black">보훈대상여부</td>
                                        <td class="td-13 p-lr3">
                                            <select name="empSpeciality" class="sel-100" id="empSpeciality">
                                                <option value="N"<c:if test="${others.empSpeciality eq 'N'}">selected</c:if>>비대상</option>
                                                <option value="Y"<c:if test="${others.empSpeciality eq 'Y'}">selected</c:if>>대상</option>
                                            </select>
                                        </td>
                                        <td  class="td-7 center weight700 bg-darkgray black">장애여부</td>
                                        <td class="td-13 p-lr3">
                                            <select name="empDisability" class="sel-100" id="empDisability">
                                                <option value="N"<c:if test="${others.empDisability eq 'N'}">selected</c:if>>비장애</option>
                                                <option value="Y"<c:if test="${others.empDisability eq 'Y'}">selected</c:if>>장애</option>
                                            </select>
                                        </td>
                                        <td  class="td-7 center weight700 bg-darkgray black">보유자격증1</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empLicense1" id="empLicense1" class="input-100"  value="${others.empLicense1}"/>
                                        </td>
                                        <td  class="td-7 center weight700 bg-darkgray black">보유자격증2</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empLicense2" id="empLicense2" class="input-100" value="${others.empLicense2}" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-7 center weight700 bg-darkgray black">어학사항1</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empLanguage1" id="empLanguage1" class="input-100"  value="${others.empLanguage1}"/>
                                        </td>
                                        <td class="td-7 center weight700 bg-darkgray black">어학사항2</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empLanguage2" id="empLanguage2" class="input-100" value="${others.empLanguage2}" />
                                        </td>
                                        <td class="td-7 center weight700 bg-darkgray black">상벌사항1</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empRewardPunish1" id="empRewardPunish1" class="input-100"  value="${others.empRewardPunish1}"/>
                                        </td>
                                        <td class="td-7 center weight700 bg-darkgray black">상벌사항2</td>
                                        <td class="td-13 p-lr3">
                                            <input type="text" name="empRewardPunish2" id="empRewardPunish2" class="input-100" value="${others.empRewardPunish2}" />
                                        </td>
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
                                <textarea id="editor" name="empComment" style="border:1px solid #ccc;padding:10px;border-radius:2px;" class="noto" >${others.empComment}</textarea>
                                <script>
                                    CKEDITOR.replace('editor');
                                    CKEDITOR.config.height =150;
                                </script>
                            </div>                                        
                        </div>
                        <div class="btn-grp center m-t10">
                            <button type="submit" class="btn-normal">내용저장</button>
                            <button type="submit" class="btn-cancel" onClick="printInfo('${empOne.empID}');">인쇄하기</button>
                            <button type="button" class="btn-cancel" onClick="location.href='${pageContext.request.contextPath}/grp_employee/grp_employee_list'">사원목록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>       
    </div>
</body>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/js/treeview.js"></script>
<script src="${pageContext.request.contextPath}/js/tab.js"></script>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script src="${pageContext.request.contextPath}/js/grp_employee/grp_employee_register.js"></script>
<script>
//프린트팝업창 띄우기
function printInfo(empID) {
	
	//window.open주소,별명,넓이높이위치스크롤바...옵션
	var url = "${pageContext.request.contextPath}/grp_employee/grp_employee_print?empID=" + ${empOne.empID};
	var nick = "print";
	var opt = "width=1300, height=700";

	window.open(url, nick, opt);
}
</script>
</html>