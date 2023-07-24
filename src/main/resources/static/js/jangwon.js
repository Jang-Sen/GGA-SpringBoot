$(document).ready(function(){

	/* 윈도우 창 */
	$("#findIdBtn").click(function(){
		// window.open("/login_idFind", "_blank", "width=600, height=550");
		$(".modalLogin-bg").show();
		$(".modalLogin-wrap").show();
		$('html').css({
			overflow:'hidden',
			height : 'auto'
		});

		$("#modalLoginGuide").text("※ 정보를 입력해주세요. ※");
		$("#modalLoginTitle").text("아이디 찾기");
		$("#modalLoginType1").text("이름 : ");
		$("#modalLoginType2").text("생년월일 : ");
		$("#modalLoginType3").text("전화번호 : ");


		$(".modalLoginClose").click(function (){
			$(".modalLogin-bg").hide();
			$(".modalLogin-wrap").hide();
			$('html').removeAttr('style');
		});

	}); // findIdBtn

	$("#findPwBtn").click(function(){
		// window.open("/login_pwFind", "_blank", "width=600, height=580");
		$(".modalLogin-bg").show();
		$(".modalLogin-wrap").show();
		$('html').css({
			overflow:'hidden',
			height : 'auto'
		});

		$("#modalLoginGuide").text("※ 정보를 입력해주세요. ※");
		$("#modalLoginTitle").text("비밀번호 찾기");
		$("#modalLoginType1").text("아이디 : ")
			.css("margin-right","20px");
		$("#modalLoginFind1").css("position","relative")
			.css("right","30px");
		$("#modalLoginType2").text("이름 : ")
			.css("margin-right","5px");
		$("#modalLoginFind2").css("position","relative")
			.css("right","2px");
		$("#modalLoginType3").text("전화번호 : ")
			.css("margin-right","38px");
		$("#modalLoginFind3").css("position","relative")
			.css("right","33px");

		$(".modalLoginClose").click(function (){
			$(".modalLogin-bg").hide();
			$(".modalLogin-wrap").hide();
			$('html').removeAttr('style');
		});
	}); // findPwBtn


	/* 아이디 찾기 입력 */
	$("#btnFindId").click(function(){
		var name = $("#name").val();
		var birth = $("#birth").val();
		var phone = $("#phone").val();

		if (name == ""){
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		} else if (birth == ""){
			alert("생년월일을 입력해주세요.");
			$("#birth").focus();
			return false;
		} else if (phone == ""){
			alert("번호를 입력해주세요. '-' 제외");
			$("#phone").focus();
			return false;
		} else {
			$.ajax({
				url : "/login_idFind_proc/" + name + "/" + birth + "/" + phone ,
				success : function(result){
					alert(result);
					if (result == ""){
						alert("존재하지 않는 정보입니다.");
						location.href="/login_idFind";
					} else {
						location.href="/login_idSelect/" + result;
					}
				}

			}); // ajax

		}
	}); // btnFindId

	/* 비밀번호 찾기 입력 */
	$("#btnFindPw").click(function(){
		if ($("#id").val() == ""){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		} else if ($("#name").val() == ""){
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		} else if ($("#birth").val() == ""){
			alert("생년월일을 입력해주세요.");
			$("#birth").focus();
			return false;
		} else if ($("#phone").val() == ""){
			alert("번호를 입력해주세요. '-' 제외");
			$("#phone").focus();
			return false;
		} else {
			var id = $("#id").val();
			var name = $("#name").val();
			var birth = $("#birth").val();
			var phone = $("#phone").val();

			$.ajax({
				url : "login_pwFind_proc.do?id=" + id + "&name=" + name + "&birth=" + birth + "&phone=" + phone ,
				success : function(result){
					if (result == ""){
						alert("존재하지 않는 정보입니다.");
						location.href="login_pwFind.do";
					} else {
						location.href="login_pwSelect.do?pass=" + result;
					}
				}
			}); // ajax
		}

	}); // btnFindPw

	/**
	 * 내 정보 수정
	 */
	$("#updatebtn").click(function(){
		var passFlag, telFlag, phoneFlag, emailFlag, carnumFlag
		if ($("#pass").val() == "") {
			// alert("비밀번호를 입력해주세요.");
			if ($("#cpass").val() != "") {
				alert("비밀번호를 입력해주세요.");
				$("#pass").focus();
				return false;
			} else {
				// $("#pass").val($("#Hpass").val());
			}
		}else if($("#pass").val() == $("#cpass").val()){
			passFlag = true;
		}else if($("#pass").val() == "" && $("#cpass").val() == "") {
			passFlag = false;
		}
		// } else if ($("input[name = 'gender']:checked").length == 0){
		// 	alert("성별을 선택해주세요.");
		// 	return false;
		if ($("input[name = 'telCheck']:checked").length == 0){
			telFlag = true;
		}else {
			telFlag = false;
		}
		if ($("#phone").val() == ""){
			phoneFlag = false;
		} else {
			phoneFlag = true;
		}
		if ($("#email1").val() == ""){
			if($("#email2").val() != ""){
				alert("이메일을 입력해주세요.");
				$("#email1").focus();
				return false;
			}else if($("#email2").val() == ""){
				emailFlag = false;
			}
		} else if ($("#email2").val() != "" && $("#email1").val() != ""){
			emailFlag = true;
		}

		if ($("#car1").val() == ""){
			if($("#car2").val() != "") {
				alert("차량번호를 입력해주세요.");
				$("#car1").focus();
				return false;
			}else if($("#car2").val() == ""){
				carnumFlag = false;
			}
		}else if ($("#car1").val() != "" && $("#car2").val() != ""){
			carnumFlag = true;
		}else{
			alert("차량번호를 입력해주세요.")
			$("#car2").focus();
			return false;
		}

		if(!passFlag){
			$("#pass").val($("#Hpass").val());
		}
		if(!telFlag){
			var selectTel = $("input[name='telCheck']:checked").val();
			$("#tel").val(selectTel);
		}
		if(!phoneFlag) {
			$("#phone").val($("#Hphone").val());
		}
		if(!emailFlag) {
			var injectEmail = $("#Hemail").val();
			$("#email1").val(injectEmail);
			$("#email2").val("");
			// 이메일 1,2,3 병합 해결 나머지 set 공백처리 setter가서 +로 합쳐질때 공백이라 값안들어가고 합쳐짐
		}
		if(!carnumFlag) { //차번호 1,2 병합 해결 나머지 set 공백처리 ㄱㄴ??
			$("#car1").val($("#Hcar").val());
			$("#car2").val("");
		}
		mp_updateForm.submit();
	}); // btnJoin



}); // ready