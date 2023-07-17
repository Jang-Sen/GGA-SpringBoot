<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "../errorpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 내 정보 수정</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<script src="http://localhost:9000/js/jangwon.js"></script> <!-- gga_jquery.js -->
<script src="http://localhost:9000/js/gga_javascript.js"></script> <!-- gga_javascript.js -->
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
	<header>
		<jsp:include page="../header.jsp" />	
	</header>
	
	<!-- Content -->
	<div class= "container">
		<section class= "mp_update">
			<h1 class= "mypage_title">내 정보 수정</h1>
			<form name= "mp_updateForm" action="/mypage_update_proc" method= "post">
			<input type="hidden" name="id" value="${ sessionScope.svo.id }">
				<ul>
					<li>
						<label>아이디</label>
						<input type="text" name="id" class="input1" id="id" value="${ MemberDto.id }" placeholder="저장값" disabled>
					</li>
					<li>
						<label>비밀번호</label>
						<input type="password" name="pass" class="input1" id="pass" placeholder="8자 이상 영문(대소문자 구분), 특수문자 포함">
					</li>
					<li>
						<label>비밀번호 확인</label>
						<input type="password" name="cpass" class="input1" id="cpass" placeholder="8자 이상 영문(대소문자 구분), 특수문자 포함">
						<span id="cmsg"></span>
					</li>
					<li>
						<label>이름</label>
						<input type="text" name="name" class="input1" id="name" value="${ MemberDto.name }" disabled>
					</li>
					<li>
						<label>생년월일</label>
						<input type="text" name="birth" class="input1" id="birth" value="${ MemberDto.birth }" numberOnly disabled>
					</li>
					<li>
						<label>성별</label>
						<input type="radio" name="gender" value="m"><span>남자</span> 
						<input type="radio" name="gender" value="f"><span>여자</span>
					</li>
					<li>
						<label>휴대폰</label>
						<input type="radio" name="tel" value="skt"><span>SKT</span>
						<input type="radio" name="tel" value="kt"><span>KT</span>
						<input type="radio" name="tel" value="lgu+"><span>LG U+</span>
						<input type="text" name="phone" id="phone" value="${ MemberDto.phone }" maxlength="11" numberOnly placeholder="'-'없이 모두 입력">
					</li>
					<li>
						<label>이메일</label>
						<input type="text" name="email1" id="email1" > @
						<input type="text" name="email2" id="email2" >
						<select id="email3">
							<option value="default">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="google.com">구글</option>
							<option value="daum.net">다음</option>
						</select>
					</li>
					<li>
						<label>차량번호</label>
						<input type="text" name="car1" id="car1" class="input1" maxlength="3" placeholder= "예) 00가">
						<input type="text" name="car2" id="car2" class="input1" maxlength="4" numberOnly placeholder= "예) 0000">
					</li>
				</ul>
				<div class="container text-center">
					<a href="/mypage.do">
						<button type="button" class="btn btn-outline-secondary">취소</button></a>
					<button type="submit" id="updatebtn" class= "btn btn-outline-secondary">저장</button>
				</div>
			</form>
		</section>
	</div>
	
	<!-- Footer -->
	<jsp:include page="../footer.jsp" />
	<!-- Footer -->
</body>
</html>