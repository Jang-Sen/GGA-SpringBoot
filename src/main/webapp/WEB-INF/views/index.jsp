<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gga_plz</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css" /> <!-- gga.css -->
<%--	<link rel="stylesheet" href="http://localhost:9000/css/glide.core.min.css">--%>
<%--	<link rel="stylesheet" href="node_modules/@glidejs/glide/dist/css/glide.core.min.css">--%>
	<script src = "http://localhost:9000/js/Movie_api.js"></script>
<script src="http://localhost:9000/js/weather_api.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
	<!-- 부트스트랩 -->

</head>

<script type="text/javascript">
	var naver_id_login = new naver_id_login("t7Ls7Xci47cHwRs_WQYf", "http://localhost:9000");
	// 접근 토큰 값 출력
	// alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		var id = naver_id_login.getProfileData('id');
		var email = naver_id_login.getProfileData('email');
		var name = naver_id_login.getProfileData('name');
		var gender = naver_id_login.getProfileData('gender');
		var birthday = naver_id_login.getProfileData('birthday');
		var mobile = naver_id_login.getProfileData('mobile');

		document.getElementById("naverId").value = id;
		document.getElementById("naverEmail").value = email;
		document.getElementById("naverName").value = name;
		document.getElementById("naverGender").value = gender;
		document.getElementById("naverBirthday").value = birthday;
		document.getElementById("naverMobile").value = mobile;
	}
</script>

<script>
	let loginResult = "${loginResult}";
	let logoutResult = "${logoutResult}"
	let naverLoginResult = "${naverLoginResult}"
	if(loginResult == 'ok' || naverLoginResult == "ok"){
		alert("로그인 성공하였습니다");
	}
	if(logoutResult == "ok") {
		alert("로그아웃 되었습니다.")
	}
</script>
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
.section2{
	margin:auto;
}
.section4{
    margin-top: 20px;
}

.fixed_button{
	border : 1px solid blue;
	position: fixed;
	bottom: 20px;
	right: 20px;
	margin : 50px 230px; 
	border: none;
	padding: 10px; 
	font-weight: bold;
	z-index : 1;
	
}


.fixed_button .fixed{
	/* padding: 10px; */
	cursor: pointer;
}
.fixed_button .fixed .fixed_order_btn{
	border-radius: 30px;
	/* padding: 11px 35px; */
	border:1px solid white;
	margin-bottom:15px;
}
.fixed_button .fixed .fixed_order_btn img{
	border-radius: 30px;
	width:125px;
	height:55px;
}
 .fixed_weather_btn{
	width:155px;
	height:60px;
 	margin-left : 20px;
 	margin-bottom:15px;
 }

.fixed_top_btn {
	width:80px;
	height:70px;
	margin-left : 40px;
	opacity : 0.5;
	margin-bottom:15px;
}
.Ktitle{
	padding-top: 60px;
	/*border:1px solid red;*/
	font-family: "Noto Sans CJK KR";
	font-weight: 700;
	font-size : 60px;
}
.Kchoice{
	/*border:3px solid pink;*/
	margin-left: 70%;
	padding : 0;
}
.K{
	border:1px solid dimgray;
	border-radius : 5px;
	padding : 0px 12px;
	margin-left: 5px;
	font-family: "Noto Sans CJK KR";
	font-size : 15px;
	color:dimgray;
}

.Kbtn{
	border:1px solid white;
	padding : 0px 10px;
	background: lightgrey;
	border-radius : 5px;
	text-align: center;
	margin: 20px 0;
	font-family: "Noto Sans CJK KR";
	font-size : 15px;
	color:#212121;
	font-weight: 500;
}

.KobisList{
	/*border:1px solid blue;*/
	font-family: "Noto Sans CJK KR";
	text-align: center;
	margin-left: 50px;
}

div.KobisList table tr th{
	border-bottom : 1px solid gray;
	padding : 9px 27px;
}

div.KobisList table tr td{
	border-bottom : 1px solid #EEEEEE;
	padding : 9px 27px;
}

.kp{
	padding : 20px 0 80px 0;
	font-family: "Noto Sans CJK KR";
	color: #004D40;
	font-size : 13px;
	font-weight: 700;

}
/*.glides{*/
/*	height: 100vh;*/
/*	width : 100%;*/
/*	display : flex;*/
/*	justify-content: center;*/
/*	align-items: center;*/
/*	padding : 15px*/
/*}*/
</style>

<body>

<c:choose>
	<c:when test="${svo.id == null}">
		<!-- header -->
		<jsp:include page="headerNaver.jsp" />
		<input type="hidden" id="naverId" name="id">
		<input type="hidden" id="naverEmail" name="email" >
		<input type="hidden" id="naverName" name="name">
		<input type="hidden" id="naverGender" name="gender">
		<input type="hidden" id="naverBirthday" name="birthday">
		<input type="hidden" id="naverMobile" name="mobile">
		<!-- header -->
	</c:when>
	<c:otherwise>
		<jsp:include page="header.jsp" />

	</c:otherwise>
</c:choose>
	<!-- header -->
	
		<!-- content -->
	<div class="container text-center">
		<div class="section1">
			<div class="col" >
			<div class="ggamovietitle">
			    <img src="http://localhost:9000/images/ggamovietitle.png">
			    </div>
			    <iframe justify-content-center width="100%" height="500px"
			    src="https://www.youtube.com/embed/cGNUpsevAk4?mute=1&autoplay=1"></iframe>
			</div>
		</div>
		
		<!-- 고정 버튼 -->
		<div class="fixed_button">
			
			<div class = "fixed" onclick="window.scrollTo(0,0);">
			<img src="http://localhost:9000/images/top.png" class="fixed_top_btn">
			</div>
		
			<div class="fixed">
			<button type="button" class="fixed_order_btn" id="indexOrderBtn"><img src="http://localhost:9000/images/indexorderbtn.png"></button>
			</div>
			
			<!-- 날씨 부분으로 하단 이동 -->
			<div class="fixed" onclick="window.scrollTo(1600,1600);">
			<img src="http://localhost:9000/images/weather_checkbtn.png" class="fixed_weather_btn">
			</div>
			
		<!-- 카카오톡 채널 추가 버튼 -->
			<!-- <div class="fixed"
			  id="kakao-talk-channel-add-button"
			  data-channel-public-id="_CIxkYxj"
			  data-size="large"
			  data-support-multiple-densities="true"
			></div> -->
			
		<!-- 카카오톡 톡상담 버튼 -->
			<div class="fixed"
			  id="kakao-talk-channel-chat-button"
			  data-channel-public-id="_CIxkYxj"
			  data-title="consult"
			  data-size="large"
			  data-color="yellow"
			  data-shape="pc"
			  data-support-multiple-densities="true"
			></div>
		</div>

		<div class="section2">

				<h1 class="Ktitle">GGA MOVIE BOXOFFICE</h1>

				<div id="1111" class="Kchoice">
					<select id="kselect" class="K">
						<option value = "default">박스오피스 선택</option>
						<option value = "Daily">일별</option>
						<option value = "Weekly">주간</option>
					</select>
					<button type ="button" id="btnKobis" class="Kbtn">조회</button>
				</div>
			<p class="kp">* 일별 박스오피스는 하루 전, 주간은 7일 전으로 조회됩니다.</p>

<%--			<div class = "glides">--%>
<%--				<div class="glide">--%>
<%--					<div class="glide">--%>
<%--						<div class="glide__track" data-glide-el="track">--%>
<%--							<ul class="glide__slides">--%>
<%--								<li class="glide__slide"><image src="images/11111.jpg"/></li>--%>
<%--								<li class="glide__slide"><image src="images/11111.jpg"/></li>--%>
<%--								<li class="glide__slide"><image src="images/11111.jpg"/></li>--%>
<%--							</ul>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--					<div class="glide__arrows" data-glide-el="controls">--%>
<%--						<button class="glide__arrow glide__arrow--left" data-glide-dir="<">prev</button>--%>
<%--						<button class="glide__arrow glide__arrow--right" data-glide-dir=">">next</button>--%>
<%--					</div>--%>
<%--				</div>--%>
			</div>
<%--			<script src="https://cdn.jsdelivr.net/npm/@glidejs/glide"></script>--%>
<%--			<script>--%>
<%--				new Glide('.glide').mount()--%>
<%--			</script>--%>


		<div class="section3">
			  <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="http://localhost:9000/images/bannerimg2.jpg" class="d-block w-100" style="height: 200px;" alt="...">
				    </div>
				  <div class="carousel-item">
				      <img src="http://localhost:9000/images/bannerimg3.jpg" class="d-block w-100" style="height: 200px;" alt="...">
				  </div>
				    <div class="carousel-item">
				      <img src="http://localhost:9000/images/footerimg2.jpg" class="d-block w-100" style="height: 200px;" alt="...">
				    </div>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
			</div>
		</div>
		
		<div class="section4">
			<div class="row">
			    <div class="mapimg">
			    <img src="http://localhost:9000/images/map.png">
			    </div>
			</div>
			<div class="row">
				<div class="col-9">
			      <div id="map" style="width:100%; height:400px;"></div>
			    </div>
			    <div class="col-3">
				    <div class="weather_api"> 
			    	<div>
			    		<button type="button" class="btn_weather_date" id="today">오늘</button>
			    		<button type="button" class="btn_weather_date" id="tomorrow">+1</button>
			    		<button type="button" class="btn_weather_date" id="after">+2</button>
						<div class="weather_icon" id="weather_icon">
						<!-- 날씨API 들어가는 자리 -->
						</div>			    	
			    	</div>
			    	
			    	</div>
			    	<div class="card mb-4 rounded-3 shadow-sm">
			        	<div class="card-body">
			          	<p class="card-text">서울 강남구 강남대로 78길 8 한국빌딩 4F, 8F</p>
			        	</div>
			     	</div>
			    </div>
			 </div>
		</div>
	</div>
	<!-- content -->


	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	41da9f6853bb6c551d69442f2f310e83"></script>
	    <script type="text/javascript">
	
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.49463712100352, 127.02989249594765), //지도의 중심좌표.
				level: 2 //지도의 레벨(확대, 축소 정도)
			};
		
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var markerPosition  = new kakao.maps.LatLng(37.49463712100352, 127.02989249594765); 

			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			marker.setMap(map);
	</script>
</body>

	<!-- 카카오톡 채널 추가  -->
	<!-- <script>
	  window.kakaoAsyncInit = function() {
	    Kakao.Channel.createAddChannelButton({
	      container: '#kakao-talk-channel-add-button',
	    });
	  };
	
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
	    js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
	    js.crossOrigin = 'anonymous';
	    fjs.parentNode.insertBefore(js, fjs);
	  })(document, 'script', 'kakao-js-sdk');
	</script> -->

	<!-- 카카오톡 톡상담 -->
	<script>
	  window.kakaoAsyncInit = function() {
	    Kakao.Channel.createChatButton({
	      container: '#kakao-talk-channel-chat-button',
	    });
	  };
	
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
	    js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
	    js.crossOrigin = 'anonymous';
	    fjs.parentNode.insertBefore(js, fjs);
	  })(document, 'script', 'kakao-js-sdk');
	</script>
</html>