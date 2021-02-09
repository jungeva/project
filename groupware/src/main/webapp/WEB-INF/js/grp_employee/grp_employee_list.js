
/*상세정보*/
function detail_open(empID) {
	detailInfo(empID);
	
	$("#detail_bg").css({
		display: "block"
	});
}

function detail_close() {
	$("#detail_bg").css({
		display : "none"
	});
}

function detailInfo(empID) {
	$.ajax({
		url		: "/groupware/grp_employee/grp_employee_detail",
		type	: "POST",
		data	: {empID : empID},
		success	: function(resData) {
			var a = '';
		    a += '<div class="p20 detail_box">';
		    	a += '<div class="flex flex-justify" style="margin-bottom:10px;">';
		    		a += '<div class="content_title font18 weight700">'+resData.empName+'님의 정보</div>';
		    		a += '<div>';
		    			a += '<i class="fas fa-times font18 weight700 cursor" onClick="detail_close();"></i>';
		    		a += '</div>';
		    	a += '</div>';
		    	a += '<div class="flex">';
			        a += '<div class="content-left">';
			            a += '<div class="photo-area">';
					    	a += '<img src="/groupware/'+resData.empPhoto+'">';
			            a += '</div>';
			        a += '</div>';
			        a += '<div class="content-right">';
			            a += '<table>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">사원번호</td>';
			                    a += '<td class="td-30 center">'+resData.empNumber+'</td>';
			                    a += '<td class="center  weight700 bg-darkgray black">입사일</td>';
			                    a += '<td class="td-30 center">'+resData.empEnterDate+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                	a += '<td class="td-20 center weight700 bg-darkgray black">사원명</td>';
			                	a += '<td class="td-30 center">'+resData.empName+'</td>';
			                	a += '<td class="td-20 center weight700 bg-darkgray black"> 영문성명</td>';
			                	a += '<td class="td-30 center">'+resData.empEngName +'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center weight700 bg-darkgray black">부서</td>';
			                    a += '<td class="td-30 center">'+resData.empDepartmentName+'</td>';
			                   	a += '<td class="center weight700 bg-darkgray black">직책</td>';
			           			a += '<td class="td-30 center">'+resData.empGradeName+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">Tel</td>';
			                    a += '<td class="td-30 center">'+resData.empTel+'</td>';
			                    a += '<td class="center  weight700 bg-darkgray black">C.P</td>';
			                    a += '<td class="td-30 center">'+resData.empCp+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">내선번호</td>';
			                    a += '<td class="td-30 center">'+resData.empExtension+'</td>';
			                    a += '<td class="center  weight700 bg-darkgray black">비상연락처</td>';
			                    a += '<td class="td-30 center">'+resData.empEmergencyTel+'</td>';
			                a += '<tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">Email</td>';
			                    a += '<td colspan="3" class="td-30 center">'+resData.empEmail+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">주소</td>';
			                    a += '<td colspan="3" class="td-30 m-lr3 center">('+resData.empPostcode+')'+resData.empAddr+resData.empExtraAddr+resData.empDetailAddr+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">보유자격증</td>';
			                    a += '<td class="td-30 center">'+resData.empLicense1+'</td>';
			                    a += '<td class="center  weight700 bg-darkgray black">어학사항</td>';
			                    a += '<td class="td-30 center">'+resData.empLanguage1+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">기타사항</td>';
			                    a += '<td colspan="3" class="td-30 m-lr3 center">'+resData.empComment+'</td>';
			                a += '</tr>';
			            a += '</table>';
			        a += '</div>';
			    a += '</div>';
			        a += '<div style="width:100%; text-align:center;">';
                		a += '<button type="button" class="btn-on" id="YYbtn" style="margin-top:30px;" onclick="empModify('+resData.empID+');">상세보기</button>';
                	a += '</div>';
		    a += '</div>';

		$("#detail_bg").html(a);
		},
		error	: function() {
			alert("시스템에러");
		}
	});
}

function empModify(empID){
	location.href = "/groupware/grp_employee/grp_employee_register?empID=" + empID;
}
/*부서장 변경*/
function headChange(empHead, empID) {
    var msg = "선택하신 사원을 부서장으로 변경합니다.\n변경하시겠습니까?";
    if (confirm(msg)) {
        var headValue;
        if (empHead == 'Y') {
            headValue = 'N';

        } else {
            headValue = 'Y';
        }

        var formData = {
            empHead: headValue,
            empID: empID
        };

        $.ajax({
            url: "/groupware/grp_employee/grp_employee_head_change",
            type: "POST",
            data: formData,
            success: function (resData) {
                if (resData == "success") {
                    alert("부서장 설정이 변경되었습니다.");
                }
            },
            error: function () {
                alert("부서장 설정변경에 실패했습니다.");
            },
            complete: function () {
                window.location.reload();
            }
        });
    }
}

/*승인여부 변경*/
function confirmChange(empConfirm, empID) {
    var msg = "선택하신 사원의 승인여부를 변경합니다.\n변경하시겠습니까?";
    if (confirm(msg)) {

        var formData = {
            empConfirm: empConfirm,
            empID: empID
        };

        $.ajax({
            url: "/groupware/grp_employee/grp_employee_confirm_change",
            type: "POST",
            data: formData,
            success: function (resData) {
                if (resData == "success") {
                    alert("사원승인설정이 변경되었습니다..");
                }
            },
            error: function () {
                alert("사원승인변경에 실패했습니다.");
            },
            complete: function () {
                window.location.reload();
            }
        });

    }
}

/*권한변경*/
function authChange(empAuth, empID) {
    var msg = "선택하신 사원의 권한을 변경합니다.\n변경하시겠습니까?";
    if (confirm(msg)) {

        var formData = {
            empAuth: empAuth,
            empID: empID
        };

        $.ajax({
            url: "/groupware/grp_employee/grp_employee_auth_change",
            type: "POST",
            data: formData,
            success: function (resData) {
                if (resData == "success") {
                    alert("사원권한이 변경되었습니다.");
                }
            },
            error: function () {
                alert("사원권한변경에 실패했습니다.");
            },
            complete: function () {
                window.location.reload();
            }
        });

    }
}
//한명 퇴사
function retiredChange(empRetired,empID) {
    var msg = "선택하신 사원을 퇴사시키겠습니까?";
    if (confirm(msg)) {

    	var formData = {
            	empRetired : empRetired,
                empID: empID
        };
        
        $.ajax({
            url		: "/groupware/grp_employee/grp_employee_retired",
            type	: "POST",
            data	: formData,
            success	: function (resData) {
                if(resData == "success") {
                alert("퇴사되었습니다.");
                location.href="/groupware/grp_employee/grp_employee_retired_list";
                }
            },
         error	: function () {
             alert("재직상태 변경에 실패했습니다.");
            },
            complete: function () {
               
            }
        });
    }
}
  
 //클릭시 다 체크되는 자바스크립트
var flag = false;
function chkAll() {

	var chk = document.getElementsByName("chk"); //화면에서 name="chk"인 요소를 가져와라
	if (flag == false) { //선택x
		flag = true;
		for( var i =0; i < chk.length; i++) {
			chk[i].checked = true;
		}
	}else {
		flag = false;
		for( var i =0; i < chk.length; i++) {
			chk[i].checked = false;
		}
	}
	
}

//체크한 사람 퇴사처리
$(function() {
	$("#deleteAll").click(function(){
		var msg = "선택하신 사원을 퇴사처리하시겠습니까?"
		if( confirm(msg) ) {
			var chkArray = new Array();
			$(".chk:checked").each(function() {
				chkArray.push($(this).attr("data-uid"));
			});

			$.ajax({
				url		: "/groupware/grp_employee/grp_employee_retiredAll",
				type	: "POST",
				data	: { chkArray : chkArray },
				success	: function(resData) {
					alert("선택하신 사원이 퇴사처리되었습니다.");
					window.location.href="/groupware/grp_employee/grp_employee_retired_list"
				},
				error	: function() {
					alert("관리자에게 문의하세요.");
				},
				complete : function() {}
			});
		} 
	});
});