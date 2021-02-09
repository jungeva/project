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
			                    a += '<td class="td-20 center weight700 bg-darkgray black">사원명</td>';
			                	a += '<td class="td-30 center">'+resData.empName+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">입사일</td>';
			                    a += '<td class="td-30 center">'+resData.empEnterDate+'</td>';
			                	a += '<td class="td-20 center weight700 bg-darkgray black">퇴사일</td>';
			                	a += '<td class="td-30 center">'+resData.empRetiredDate +'</td>';
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
			                    a += '<td class="center  weight700 bg-darkgray black">비상연락처</td>';
			                    a += '<td class="td-30 center">'+resData.empEmergencyTel+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">Email</td>';
			                    a += '<td colspan="3" class="td-30 center">'+resData.empEmail+'</td>';
			                a += '</tr>';
			                a += '<tr>';
			                    a += '<td class="center  weight700 bg-darkgray black">주소</td>';
			                    a += '<td colspan="3" class="td-30 m-lr3 center">'+resData.empAddr+'</td>';
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
		    a += '</div>';

		$("#detail_bg").html(a);
		},
		error	: function() {
			alert("시스템에러");
		}
	});
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
	//개별삭제
	function deleteOne(empID) {
		
		var msg = "선택하신 사원의 모든 내용이 삭제됩니다.\n삭제하시겠습니까?";
		
		if( confirm(msg) ) {
			$.ajax({
				url 	: "/groupware/grp_employee/grp_employee_delete",
				type	: "POST",
				data 	: {empID :empID},
				success	: function(resData) {
					if(resData == "success") {
						alert("선택하신 정보가 삭제되었습니다.");
					}
				},
				error 	: function() {
					alert("관리자에게 문의하세요.");
				},
				complete : function() {
					window.location.reload();
				}
			});
		}
	}

	//체크된 정보 전체삭제
	$(function(){
		$("#deleteAll").click(function() {
			var msg = "선택하신 사원의 모든 내용이 삭제됩니다.\n삭제하시겠습니까?";
			
			if( confirm(msg) ) {
				var chkArray = new Array();
				$(".chk:checked").each(function() {
					chkArray.push($(this).attr("data-uid"));
				});

				
			}
			$.ajax({
				url 	: "/groupware/grp_employee/grp_employee_deleteAll",
				type	: "POST",
				data 	: {chkArray :chkArray},
				success	: function() {
					alert("선택하신 사원의 정보가 삭제되었습니다.");
				},
				error 	: function() {
					alert("삭제하실 사원을 선택해주세요.");
				},
				complete : function() {
					window.location.reload();
				}
			});
		});
	});