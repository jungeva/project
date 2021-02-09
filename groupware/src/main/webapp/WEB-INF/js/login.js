$(function(){
    $("#btn").click(function(){
        if($("#userid").val()=='') {
            alert("아이디를 입력해주세요.");
            $("#userid").focus();
            $("#userid").val("");
            $("#passwd").val("");
            return false;
        }

        if($("#passwd").val()=='') {
            alert("비밀번호를 입력해주세요.");
            $("#passwd").focus();
            $("#passwd").val("");
            return false;
        }

    });
});