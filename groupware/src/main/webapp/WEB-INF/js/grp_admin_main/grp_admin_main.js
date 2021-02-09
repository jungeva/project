$(function () { // menu 
    $(".header").click(function () {
        $(this).toggleClass("ul>li>.contents").next().toggle();
    });
});

$(function(){ //근태관리 및 휴가관리
    $(".tab").on("click", function(e){
        $(".tab").removeClass("active");
        $(".tab-content").removeClass("show");

        $(this).addClass("active");
        $($(this).attr("href") ).addClass("show");
        e.preventDefault();
    });
});

$(function(){ //게시물
    $(".board").on("click", function(e){
        $(".board").removeClass("active");
        $(".board-content").removeClass("show");

        $(this).addClass("active");
        $($(this).attr("href") ).addClass("show");
        e.preventDefault();
    });
});

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
$(function() {
    getScheduleList();
});
function getCalendar(resData) {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid'],
        header: {
            left: '',
            center: 'prev,title,next',
            right: 'dayGridMonth'
        },
        navLinks: true,
        editable: true,
        eventLimit: true,
        locales: "ko",
        events: resData
    });

    calendar.render();
}

function surveyResult(surveyID) {
	$("#survey_bg").css({
		display : "block"
	});
	$.ajax({
		url		: "/groupware/survey/grp_survey_result",
		type	: "POST",
		data	: {surveyID : surveyID},
		success	: function(resData) {
			var a = '';
				a += '<div class="survey_box">';
	        		a += '<div class="p20">';
		        		a += '<div class="flex flex-justify">';
		        		
		        		if(resData.surveyState == 'open') {
		        			a += '<span class="m-btn-on" style="background-color:#EA6D56;color:#fff;">진행중</span>';
			        	}else {
			        		a += '<span class="m-btn-on" style="background-color:#6b8bb5;color:#fff">설문완료</span>';
				        }
				        
		        			a += '<span onClick="closeSurvey();"><i class="fas fa-times font20 cursor"></i></span>';
		        		a += '</div>';
		        		a += '<div class="m-tb10" style="line-height:1.8;">';
		        			a += '<p class="font14">설문기간 : '+resData.surveyStartDate+' ~ '+ resData.surveyEndDate +'</p>';
		        			a += '<p class="font14">설문작성자 : '+ resData.surveyWriter+'</p>';
		        			a += '<p class="font16"><i class="fas fa-user" style="margin-right:5px;"> '+ resData.surveyTotal +'명 참여</i></p>';
		                a += '</div>';
		                a += '<div style="margin-top:20px;">';
		                	a += '<h2>Q. '+ resData.surveySubject +'</h2>';
		                	a += '<div style="line-height:2;" class="m-tb10">';
		                		a += '<div class="flex flex-justify">';
			                		a += '<div style="width:65%;">';

									var token = resData.surveyEx.split("|");
									for( var i =0; i < token.length -1; i++) {
										a += '<div class="font16 m-t10" style="background-color:#eee;height:40px;line-height:40px;padding-left:20px;">'+token[i]+'</div>';
									}
			                			
			                		a += '</div>';
			                		a += '<div style="width:35%;text-align:right;">';

									var result = resData.surveyExcnt.split("|");
									for( var i = 0; i < result.length-1 ; i++ ) {
										a += '<div class="font16 weight700 m-t10" style="background-color:#eee;height:40px;line-height:40px;padding-right:20px;">';

										if(result[i] == 0 ) {
											a += '0표(0%)';
										}else {
											a += result[i] + '표('+ ((result[i]/resData.surveyTotal)*100).toFixed(0) +'%)';
										}
										a += '</div>';
									}
			                		
			                		a += '</div>';
			                	a += '</div>';
		                	a += '</div>';
		                	a += '<div style="margin-top:20px;">';
		                	if(resData.surveyState == 'open') {
		                		a += '<button class="votebtn" onClick="surveyEnd('+resData.surveyID+');">설문마감하기</button>';
				        	}else {
					        }
			            	
		                a += '</div>';
			            a += '</div>';
	            	a += '</div>';
       		 	a += '</div>';
       		 a += '<input type="hidden" name="surveyID" value="'+resData.surveyID+'" />';
       		 
   		 	$("#survey_bg").html(a);
		},
		error	: function() {
			alert("관리자에게 문의하세요.");
		}
	});
}	
function closeSurvey() {
	$("#survey_bg").css({
		display : "none"
	});
}

//설문마감
function surveyEnd(surveyID) {
	var msg= "설문을 마감하시겠습니까?";

	if(confirm(msg)) {
		$.ajax({
			url		: "/groupware/survey/grp_survey_end",
			type	: "POST",
			data	: { surveyID : surveyID },
			success	: function() {
				alert("설문이 마감되었습니다.");
			},
			error	: function() {
				alert("관리자에게 문의하세요.");
			},
			complete : function() {
				location.reload(true);
			}
		});
	}
}