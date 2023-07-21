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




});