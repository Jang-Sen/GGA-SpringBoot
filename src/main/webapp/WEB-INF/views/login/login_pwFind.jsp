<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script> <!-- gga_jquery.js -->
<script src="http://localhost:9000/js/jangwon.js"></script> <!-- gga_jquery.js -->
	<script src="http://localhost:9000/js/mobile_validation.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
	<!-- 부트스트랩 -->
</head>

<style>
@media (min-width: 768px) {
  .container {
    width: 750px;
  }
}

@media (min-width: 992px) {
  .container {
    width: 1000px;
  }
}

.btnfindproc{
	margin-right:20px;
	width:130px;
}
body {
 	overflow: hidden;
}
</style>

<body onresize="parent.resizeTo(600,650)" onload="parent.resizeTo(600,650)">
	<!-- content -->
	<div class="container">
		<div class="login_title">
			<img src="http://localhost:9000/images/passschtitle.png">
		</div>
		<p>찾으실 회원님의 정보를 입력해주세요.</p>
		<section class="login">
			<form name="findPwForm" action="login_pwFind_proc" method="get" class="loginForm">
				<ul>
					<li>
						<label>아이디</label>
						<input type="text" name="id" id="id" class="imput1" value="${id}">
					</li>
					<li>
						<label>이름</label>
						<input type="text" name="name" id="name" class="imput1" value="${name}">
					</li>
					<li>
						<label>생년월일</label>
						<input type="text" name="birth" id="birth" class="input1" maxlength="8" numberOnly value="${birth}"placeholder="주민등록번호 앞 6자리">
					</li>
					<li>
						<label>휴대전화</label>
						<c:choose>
							<c:when test="${phone != null}">
								<input type="text" name="phone" id="phone" maxlength="11" numberOnly value="${phone}"placeholder="'-'없이 모두 입력" readonly>
							</c:when>
							<c:otherwise>
								<input type="text" name="phone" id="phone" maxlength="11" numberOnly placeholder="'-'없이 모두 입력">
							</c:otherwise>
						</c:choose>
						<button type="button" name="findPhoneCheck" id="findPhoneCheck">인증하기</button>
					</li>
					<input type="text" name="findAccessKey" id="findAccessKey" placeholder="4자리 입력 후 '입력완료' 클릭">
					<input type="hidden" name="findConfirm" id="findConfirm" value="1">
					<li>
						<img src="http://localhost:9000/images/schbtn.png" id="btnFindPw" class="btnfindproc">
					</li>
				</ul>
			</form>
		</section>
	</div>
	<!-- content -->
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->

</body>
</html>