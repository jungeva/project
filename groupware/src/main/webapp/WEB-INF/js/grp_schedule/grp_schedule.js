//datepicker icon 
$(function() {
    $(".cal1").click(function() {
        $("#startDate").focus();  
    });

    $(".cal2").click(function() {
    	$("#endDate").focus(); 
    });
    
    $("#startDate, #endDate").datepicker({
        dateFormat: 'yy-mm-dd'
    });

    getScheduleList();
});

//일정등록
function setScheduleAdd() {

	if($("#startDate").val() == '' ) {
		alert("시작일을 선택해주세요.");
		$("#startDate").focus();
		return false;
	} 

	if($("#endDate").val() == '' ) {
		alert("종료일을 선택해주세요.");
		$("#endDate").focus();
		return false;
	}

	if($("#schContent").val() == '' ) {
		alert("일정내용을 입력해주세요.");
		$("#schContent").focus();
		return false;
	}  
	
	var formData = $("#frm").serialize();

	$.ajax({
		url		: "/groupware/schedule/grp_schedule_add",
		type	: "POST",
		data	: formData,
		success	: function() {
			alert("일정이 등록되었습니다.");
			window.location.reload();
		},
		error	: function() {
			alert("관리자에게 문의하세요.");
		}
	});
}
$(function(){
    $("#scheduleAdd").click(function(){
    	setScheduleAdd();
    });
});

//일정정보
function getScheduleList() {
	$.ajax({
		url		: "/groupware/schedule/grp_schedule_list",
		type	: "POST",
		success	: function(resData) {
			
			for(var i = 0; i < resData.length; i++) {
            	resData[i].start = resData[i].startDate;
            	resData[i].end 	 = resData[i].endDate;
            	resData[i].title = resData[i].schContent; 
            	resData[i].color =  "#"+(parseInt(Math.random()*0xffffff)).toString(16);
            }

			getCalendar(resData);
            
		},
		error	: function() {
			alert("관리자에게 문의하세요.");
		}
	});
}

function getCalendar(resData) {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid'],
        header: {
            left: 'today',
            center: 'prevYear,prev,title,next,nextYear',
            right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        navLinks: true,
        editable: true,
        eventLimit: true,
        locales: "ko",
        events: resData
    });

    calendar.render();
}