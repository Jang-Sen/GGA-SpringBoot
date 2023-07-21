$(document).ready(function(){
    var naverId = $("#naverId").val()
    var naverEmail = $("#naverEmail").val()
    var naverName = $("#naverName").val()
    var naverGender = $("#naverGender").val()
    var naverBirthday = $("#naverBirthday").val()
    var naverMobile = $("#naverMobile").val()

    var loginResult = document.getElementById("loginValue");
    var joinResult = document.getElementById("joinValue");
    var mypageResult = document.getElementById("mypageValue");

    if(naverId == "") {
        loginResult.text="로그인";
        loginResult.href="http://localhost:9000/login"
        joinResult.text="회원가입";
        joinResult.href="http://localhost:9000/join";
        mypageResult.text="마이페이지";
        mypageResult.href="http://localhost:9000/login"
    }else{
        loginResult.text=naverName+"님 환영합니다.";
        loginResult.href="";
        joinResult.text="로그아웃";
        joinResult.href="/naverLogout";
        mypageResult.text="마이페이지";
        mypageResult.href="/naverMypage/"+naverEmail+"/"+naverName+"/"+naverGender+"/"+naverBirthday+"/"+naverMobile;
    }

    if(document.getElementById("naverId").value != "") {
        alert("네이버 로그인에 성공하였습니다.");
    }


});