	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script> <!-- gga_jquery.js -->
<script src="http://localhost:9000/js/jangwon.js"></script> <!-- gga_jquery.js -->
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->

	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
	<!-- 부트스트랩 -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!-- 네이버 로그인 -->
<script>
	let joinResult = "${joinResult}";
	if(joinResult == 'ok'){
		alert("회원가입에 성공하였습니다");
	}
</script>
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

</style>
<body>
	<!-- header -->
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<!-- header -->
	
	
	<!-- content -->
	<div class="container">
	<div class="login_title">
		<img src="http://localhost:9000/images/logintitle.png">
		</div>
		<section class="login">
				<form name="loginForm" action="login" method="post" class="loginForm">
					<ul>
						<li>
							<label>아이디</label>
							<input type="text" name="id" id="id">
						</li>
						<li>
							<label>비밀번호</label>
							<input type="password" name="pass" id="pass">
						</li>
						<li>
							<a href= "http://localhost:9000/join">
							<img src="http://localhost:9000/images/joinbtn.png" class="loginbtnbtn"></a>
							<img src="http://localhost:9000/images/loginbtn.png" class="loginbtnbtn" id="btnLogin">
						</li>
						<li>

							<span><a href="#" id="findIdBtn">아이디 찾기></a></span>
							<span><a href="#" id="findPwBtn">비밀번호 찾기></a></span>
						</li>
<%--						<input type="button" id="naver_id" class="naverTest">--%>
<%--							<input type="hidden" class="naverToken" value="${state}">--%>

						<!-- 네이버 로그인 버튼 노출 영역 -->
						<div id="naver_id_login" style="margin-top: 10px"></div>
						<!-- //네이버 로그인 버튼 노출 영역 -->
						<script type="text/javascript">
							var naver_id_login = new naver_id_login("t7Ls7Xci47cHwRs_WQYf", "http://localhost:9000");
							var state = naver_id_login.getUniqState();
							naver_id_login.setButton("green", 2,45);
							naver_id_login.setDomain("http://localhost:9000");
							naver_id_login.setState(state);
							// naver_id_login.setPopup();
							naver_id_login.init_naver_id_login();
						</script>
  						</li>
					</ul>
				</form>
			</section>
	</div>
	<!-- content -->


	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp" />	
	</footer>
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>