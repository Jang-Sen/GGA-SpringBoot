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
    var orderResult = document.getElementById("orderValue");
    var movieResult = document.getElementById("movieValue");

    orderResult.text="예매";
    movieResult.text="영화";

    if(naverId == "") {
        loginResult.text="로그인";
        loginResult.href="http://localhost:9000/login"
        joinResult.text="회원가입";
        joinResult.href="http://localhost:9000/join";
        mypageResult.text="마이페이지";
        mypageResult.href="http://localhost:9000/login";
        movieResult.href="/movie_menu/none";
        orderResult.href="http://localhost:9000/login";
    }else{
        loginResult.text=naverName+"님 환영합니다.";
        loginResult.style.color= "lightYellow"
        loginResult.href="";
        joinResult.text="로그아웃";
        joinResult.href="/naverLogout";
        mypageResult.text="마이페이지";
        mypageResult.href="/naverMypage/"+naverEmail+"/"+naverName+"/"+naverGender+"/"+naverBirthday+"/"+naverMobile;
        movieResult.href="/movie_menu/"+naverEmail;
        orderResult.href="/order/"+naverEmail+"/"+naverName;
    }

    if(document.getElementById("naverId").value != "") {
        alert("네이버 로그인에 성공하였습니다.");
    }


});