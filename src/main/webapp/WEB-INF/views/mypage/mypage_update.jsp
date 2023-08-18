<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#gender{
	border: 1px solid white;
	color:white;
	background: white;
	position: relative;
	right:3000px;
}
#genderSpan {
	border: 1px solid lightgray;
	background: #fafafa;
	padding: 11px;
	border-radius:4px;
	position: relative;
	right:25px;
}

</style>
<body>
	<header>
		<jsp:include page="../header.jsp" />	
	</header>
	
	<!-- Content -->
	<div class= "container">
		<section class= "mp_update">
			<h1 class= "mypage_title" style="float: left; margin-right: 30px;">내 정보 수정</h1>
			<p style="color: gray; padding-top: 15px;">입력된 정보만 변경됩니다</p>
			<form name= "mp_updateForm" action="/mypage_update" method= "post">
			<input type="hidden" name="id" value="${ memberInfo.id }">
				<ul>
					<li>
						<label>아이디</label>
						<input type="text" name="id" class="input1" id="id" value="${memberInfo.id}" placeholder="저장값" disabled>
					</li>
					<li>
						<label>비밀번호</label>
						<input type="password" name="pass" class="input1" id="pass" placeholder="50자이내 8자 이상 영문(대소문자 구분)" maxlength="50">
						<input type="hidden" name="Hpass" id="Hpass" value="${memberInfo.pass}">
					</li>
					<li>
						<label>비밀번호 확인</label>
						<input type="password" name="cpass" class="input1" id="cpass" placeholder="50자이내 8자 이상 영문(대소문자 구분)" maxlength="50">
<%--						<input type="hidden" name="Hcpass" id="Hcpass" value="${memberInfo.pass}">--%>
						<span id="cmsg"></span>
					</li>
					<li>
						<label>이름</label>
						<input type="text" name="name" class="input1" id="name" value="${ memberInfo.name }" disabled>
					</li>
					<li>
						<label>생년월일</label>
						<input type="text" name="birth" class="input1" id="birth" value="${ memberInfo.birth }" numberOnly disabled>
					</li>
					<li>
						<label>성별</label>
						<%-- 남녀 픽스 조건문 작성 --%>
						<c:choose>
							<c:when test="${memberInfo.gender == 'm'}">
								<input type="radio" name="gender" value="m" id="gender"><span id="genderSpan">남자</span>
							</c:when>
							<c:otherwise>
								<input type="radio" name="gender" value="f" id="gender"><span id="genderSpan">여자</span>
							</c:otherwise>
						</c:choose>
					</li>
					<li>
						<label>휴대폰</label>
						<input type="radio" name="telCheck" id="skt" value="skt"><span>SKT</span>
						<input type="radio" name="telCheck" id="kt" value="kt"><span>KT</span>
						<input type="radio" name="telCheck" id="lgu" value="lgu"><span>LG U+</span>
<%--						<input type="hidden" name="Htel" id="Htel" value="${memberInfo.tel}">--%>
						<input type="hidden" name="tel" id="tel" class="tel" value="${memberInfo.tel}">
						<input type="hidden" name="Hphone" id="Hphone" value="${memberInfo.phone}">
						<input type="text" name="phone" id="phone" maxlength="11" numberOnly placeholder="'-'없이 모두 입력">
					</li>
					<li>
						<label>이메일</label>
						<input type="text" name="email1" id="email1" placeholder="아이디" maxlength="30" > @
						<input type="text" name="email2" id="email2" placeholder="주소 : 예) gga.com" maxlength="20">
						<input type="hidden" name="Hemail" id="Hemail" value="${memberInfo.email}">
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
						<input type="text" name="car1" id="car1" class="input1" maxlength="4" placeholder= "예) 00가">
						<input type="text" name="car2" id="car2" class="input1" maxlength="6" numberOnly placeholder= "예) 1234">
						<input type="hidden" name="Hcar" id="Hcar" value="${memberInfo.carnum}">
					</li>
					<li id="genreCheckbox">
						<label>영화 장르</label>
						<input type="checkbox" name="genre" value="범죄/스릴러"><span>범죄/스릴러</span>
						<input type="checkbox" name="genre" value="멜로/로맨스"><span>멜로/로맨스</span>
						<input type="checkbox" name="genre" value="판타지/코미디"><span>판타지/코미디</span>
						<input type="checkbox" name="genre" value="액션/SF"><span>액션/SF</span><br>
						<input type="checkbox" name="genre" value="전쟁/재난" style="margin-left:173.5px; margin-top: 10px"><span>전쟁/재난</span>
						<input type="checkbox" name="genre" value="느와르/첩보" style="margin-left: 31.7px"><span>느와르/첩보</span>
						<input type="checkbox" name="genre" value="애니메이션"><span>애니메이션</span>
						<input type="checkbox" name="genre" value="가족/음악" style="margin-left: 42.2px"><span>가족/음악</span>
					</li>
					<span style="margin-left: 175px; color :gray; font-size: 11pt">기존 선택 : ${memberInfo.genre}</span>
				</ul>
				<div class="container text-center">
					<a href="/mypage/${memberInfo.id}">
						<button type="button" class="btn btn-outline-secondary">이전으로</button></a>
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