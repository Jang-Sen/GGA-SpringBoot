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

.fmsg{
	position: fixed;
	bottom: 0;
	right: 0;
}
</style>

<body>
	<!-- content -->
	<div class="container">
		<div class="login_title">
			<img src="http://localhost:9000/images/passschtitle.png">
		</div>
		<p>입력하신 회원님의 비밀번호 정보입니다.</p>
		<div style="text-align : center;">
			<br><br><br><h3>${ pass }</h3>
		</div>
		<div class="fmsg">
			<p>로그인 후 '마이페이지', '내 정보 수정'에서 <strong><span style="color: red;">반드시</span></strong> 비밀번호 변경을 해주세요.</p>
		</div>
	</div>
	<!-- content -->
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->

</body>
</html>