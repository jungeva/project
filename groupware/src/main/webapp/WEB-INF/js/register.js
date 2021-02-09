$(function(){
    $("#double-chk").click(function(){
        if($('#userid').val().length > 8) { //아이디가 8자리 이상일 경우
            alert("아이디는 8자리 이하로 입력해주세요.");
            $('#userid').focus(); 
            $('#userid').val(""); 
            return false;
        }
    });

    $("#signUp").click(function(){
        if($('#passwd').val().length > 15) { //비번이 15자리보다 큰경우
            alert("비밀번호는 8자~15자리로 입력해주세요.");
            $('#passwd').focus(); 
            $('#passwd').val(""); 
            return false;
        }

        if($('#passwd').val().length < 8) { //비번이 8자리보다 작은 경우
            alert("비밀번호는 8자~15자리로 입력해주세요.");
            $('#passwd').focus(); 
            $('#passwd').val(""); 
            return false;
        }

        if($('#passwd').val() != $('#passwdchk').val()) { //입력한 비번과 확인용비번이랑 다른경우
            alert("비밀번호가 일치하지 않습니다.");
            $('#passwdchk').focus(); 
            $('#passwdchk').val(""); 
            return false;
        }

        alert("회원가입이 완료되었습니다.");
    });

});