$(document).ready(function(){

    /* 회원가입 휴대폰 인증 */
    $("button#phoneCheck").click(function (){
        $(".modalJoin-bg").show();
        $(".modalJoin-wrap").show();
        $('html').css({
            overflow:'hidden',
            height : 'auto'
        });
        $(".modalJoinClose").click(function (){
            $(".modalJoin-bg").hide();
            $(".modalJoin-wrap").hide();
            $('html').removeAttr('style');
        });
        // alert("클릭");
        // alert($("#phone").val());
        $.ajax({
           url : "/joinMobileCheck/"+$("#phone").val(),
            success : function (result) {
               $(".modalJoinConfirm").click(function (){
                   if($("#joinAccessKeyCheck").val() == result){
                       $("#phoneConfirm").val("1");
                       alert("인증이 완료되었습니다.");
                       $("#phoneCheck").text("인증완료");
                       $("#phoneCheck").css("color","blue").css("border","1px solid white")
                           .css("background","white");
                       $("#phone").attr("readonly",true);
                       $(".modalJoin-bg").hide();
                       $(".modalJoin-wrap").hide();
                       $('html').removeAttr('style');
                   }else{
                       $("#modalJoinGuide").text("인증번호가 일치하지 않습니다!");
                       $("#modalJoinGuide").css("color","red");
                       return false;
                   }
               });
               // alert(result);

            }
        });
    });

    // 비밀번호 찾기 휴대폰 인증
    $("#findPhoneCheck").click(function(){
        $("#findPhoneCheck").text("입력완료").css("background","lightgray");
        // $.ajax({
        //     url : "/joinMobileCheck/"+$("#phone").val(),
        //     success : function (result) {
        //                    $("#findPhoneCheck").click(function (){
        //                        if($("#findAccessKey").val() == result) {
        //                            $("#findPhoneCheck").text("인증완료").css("background","powderblue");
        //                            $("#findAccessKey").attr("readonly",true);
        //                            $("#findConfirm").val("1");
        //                        }else{
        //                             alert("인증번호가 일치 하지 않습니다. 다시입력해주세요.");
        //                             $("#findAccessKey").focus();
        //                        }
        //                    });
        //     }
        // });
        $("#findAccessKey").show();
        $("img#btnFindPw").css("postion","relative").css("bottom","59px");
    });




});