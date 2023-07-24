<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
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
	.joinbts{
		width:100px;
		height:100px;
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
		padding: 11px;
		border-radius:4px;
		position: relative;
		right:25px;
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
	<div class="join_title">
		<img src="http://localhost:9000/images/jointitle.png">
	</div>
	<section class="join">
		<form name="joinForm" action="join" method="post">
			<ul>
				<li>
					<label>아이디</label>
					<c:choose>
						<c:when test="${svo.naverLoginResult == null}">
							<input type="text" name="id" class="input1" id="id" maxlength="20">
							<button type="button" class="idCheckbtn" id="btnIdCheck">중복체크</button>
							<span id="idCheck_msg"></span>
						</c:when>
						<c:otherwise>
							<input type="text" name="id" class="input1" id="id" value="${svo.id}" readonly><br>
							<span id="idCheck_msg" style="color:gray; margin:0px 0px 0px 175px; font-size: 12pt">네이버 로그인은 이메일 주소로 가입됩니다!</span>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<label>비밀번호</label>
					<input type="password" name="pass" class="input1" id="pass" placeholder="50자이내 8자 이상 영문(대소문자 구분)" maxlength="50">
				</li>
				<li>
					<label>비밀번호 확인</label>
					<input type="password" name="cpass" class="input1" id="cpass" placeholder="50자이내 8자 이상 영문(대소문자 구분)" maxlength="50">
					<span id="cmsg"></span>
				</li>
				<li>
					<label>이름</label>
					<c:choose>
						<c:when test="${svo.naverLoginResult == null}">
							<input type="text" name="name" class="input1" id="name" maxlength="15">
						</c:when>
						<c:otherwise>
							<input type="text" name="name" class="input1" id="name" value="${svo.name}" readonly>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<label>생년월일</label>
					<input type="text" name="birth" class="input1" id="birth" maxlength="8" numberOnly placeholder="예) 20140416">
				</li>
				<li>
					<label>성별</label>
					<c:choose>
						<c:when test="${svo.navGender == null}">
							<input type="radio" name="gender" id="genderRadio" value="m"><span>남자</span>
							<input type="radio" name="gender" id="genderRadio" value="f"><span>여자</span>
						</c:when>
						<%--							<c:otherwise>--%>
						<%--								<input type="text" name="gender" id="gender" value="${svo.navGender}" disabled>--%>
						<%--							</c:otherwise>--%>
						<c:otherwise>
							<c:choose>
								<c:when test="${svo.navGender == 'm'}">
									<input type="radio" name="gender" id="gender" value="m" checked><span id="genderSpan">남자</span>
								</c:when>
								<c:otherwise>
									<input type="radio" name="gender" id="gender" value="f" checked><span id="genderSpan">여자</span>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</li>
				<li>
					<label>휴대폰</label>
					<input type="radio" name="tel" value="skt"><span>SKT</span>
					<input type="radio" name="tel" value="kt"><span>KT</span>
					<input type="radio" name="tel" value="lgu"><span>LG U+</span>
					<input type="text" name="phone" id="phone" maxlength="11" numberOnly placeholder="'-'없이 모두 입력">
					<button type="button" name="phoneCheck" id="phoneCheck"
							style="border-radius: 3px; border:2px solid black;">인증하기</button>
					<input type="hidden" name="phoneConfirm" id="phoneConfirm" value="1"> <%-- 시연일 때 0으로 바꾸면됨--%>
				</li>
				<c:if test="${svo.id == null}">
					<li>
						<label>이메일</label>
						<input type="text" name="email1" id="email1" maxlength="30" > @
						<input type="text" name="email2" id="email2" maxlength="20" placeholder="주소 : 예) gga.com">
						<select id="email3">
							<option value="default">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="google.com">구글</option>
							<option value="daum.net">다음</option>
						</select>
					</li>
				</c:if>
				<li>
					<label>차량번호</label>
					<input type="text" name="car1" id="car1" class="input1" maxlength="4" placeholder= "예) 00가">
					<input type="text" name="car2" id="car2" class="input1" maxlength="6" numberOnly placeholder= "예) 0000">
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
			</ul>
			<div class="joinbtn">
				<a href= "http://localhost:9000/join">
					<img src="http://localhost:9000/images/resetbtn.png"></a>
				<button type="submit" id="btnJoin" class="btnjoinproc">
					<img src="http://localhost:9000/images/joinbtn2.png" ></button>
			</div>
		</form>
	</section>
</div>
<!-- content -->
<div class="modalJoin-bg"></div>
<div class="modalJoin-wrap">
	<span id="modalJoinGuide">*문자로 전송된 인증번호를 입력해주세요.</span>
	<span id="modalJoinTitle">인증번호 입력</span>
	<input type="text" name="joinAccessKeyCheck" id="joinAccessKeyCheck">
	<button type="button" class="modalJoinConfirm">인증하기</button>
	<button type="button" class="modalJoinClose">닫기</button>
</div>


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