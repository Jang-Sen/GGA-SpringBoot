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
	<link rel="stylesheet" href="http://localhost:9000/css/glide.core.min.css">
	<link rel="stylesheet" href="http://localhost:9000/css/glide.theme.min.css">
	<script src = "http://localhost:9000/js/Movie_api.js"></script>
	<script src="http://localhost:9000/js/weather_api.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		  rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
	<!-- 부트스트랩 -->

</head>

<script>
	let loginResult = "${loginResult}";
	if(loginResult == 'ok'){
		alert("로그인 성공하였습니다");
	}
</script>
<style>
	#btnKobis{
		margin-left: 5px;
		padding: 3px 20px;
		border: white;
		background-color: white;
		color: gray;

	}
	.mapimg{
		margin-top: 30px;
	}
	.mapaddress{
		margin-top: 5px;

	}
	.ggamovieranktitle img{
		margin-top: 30px;
		width:450px;
	}
	#kselect{
		height: 25px;
		border: white;

	}
	.ggaeventtitle img{
		width:300px;
	}

	.div.section4 div{
		border:1px solid white;
	}
	.glide__slides img{
		width:100%;
		height: 300px;
		margin-bottom: 10px;
	}

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
		margin-top: 30px;
		width: 800px;
		background-image:url("http://localhost:9000/images/movierankback.jpg");
		background-repeat: no-repeat;
		/*background-size: 1000px 300px;*/

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
	.section3{
		margin-bottom: 50px;

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
		/*font-family: "Noto Sans CJK KR";*/
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
		/*font-family: "Noto Sans CJK KR";*/
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
		/*font-family: "Noto Sans CJK KR";*/
		font-size : 15px;
		color:#212121;
		font-weight: 500;
	}

	.KobisList{
		width : 1000px;
		/*font-family: "Noto Sans CJK KR";*/
		margin-left : 50px;
	}
	div.KobisList table tr th:nth-child(2){
		width : 400px;
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
		/*font-family: "Noto Sans CJK KR";*/
		color: #004D40;
		font-size : 13px;
		font-weight: 700;

	}

	div.glides {
		padding : 50px 0 100px 0;
	}
	.ggamovieboxofficetitle img{
		width: 800px;

	}


	#modalBody{
		/*border : 1px solid red;*/
		position : relative;
		height: 900px;
	}

	table#posterRemove td{
		/*border : 1px solid blue;*/
		float :left;
		position : relative;
		height : auto;
		top: -1350px;
		margin-left : 130px;
		max-width : 100%;
	}
	#movieInformation{
		/*border : 1px solid yellow;*/
		margin-left : 40%;
		padding: 30px 30px 0 0;
		position: relative;
		top: -1050px;
		right : 70px;
		height : auto;
		font-family: "Noto Sans CJK KR";
		text-align:left;
		font-size : 15px;
	}
	#exampleModalLabel{
		font-family: "Noto Sans CJK KR";
		font-size: 30px;
		font-weight: bold;
	}
	#movieTitle{
		/*border: 1px solid red;*/
		font-size: 35px;
		font-weight: bold;
		color : #444451;
		padding-bottom: 20px;
		margin : 0;
	}
	#string{
		font-size: 20px;
		font-weight: bold;
	}

	td#buttonTitle button{
		border : 1px solid white;
		background: white;
		color : black;
		font-weight: 700;
	}
	#actors{
		font-size: 18px;
	}

	div.modalOrder button{
		border : 1px solid white;
		padding : 10px 20px;
		position : relative;
		top : 600px;
		left : 300px;
		background: darkgrey;
		border-radius: 5px;
		z-index: 1;
	}
	div.modalOrder button a:hover {
		color: #444451;
	}
	div.modalOrder button a{
		text-decoration: none;
		color:black;
		font-size: 15px;
		padding : 10px 20px;
		text-size : 15px;
		font-family: "Noto Sans CJK KR";
		font-size : 18px;
		font-weight : 500;
		color : white;
	}
	#info{
		/*border : 1px solid green;*/
		width : 100%;
		height : auto;
		position: relative;
		top: -280px;

	}



</style>

<body>
<!-- header -->
<jsp:include page="header.jsp" />
<!-- header -->

<!-- content -->
<div class="container text-center">
	<div class="ggamovieboxofficetitle">
				<img src="http://localhost:9000/images/ggamovieboxoffice.png">
			</div>

	<div class = "glides">
		<div class="glide">
			<div class="glide">
				<div class="glide__track" data-glide-el="track">
					<ul class="glide__slides">
						<li class="glide__slide"><img src="http://localhost:9000/images/oppenhelmer.jpg" id="MOVIE_0001" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
						<li class="glide__slide"><img src="http://localhost:9000/images/concreteutopia.jpg" id="MOVIE_0002" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
						<li class="glide__slide"><img src="http://localhost:9000/images/honeysweet.jpg" id="MOVIE_0003" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
						<li class="glide__slide"><img src="http://localhost:9000/images/smugglers.jpg" id="MOVIE_0004" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
						<li class="glide__slide"><img src="http://localhost:9000/images/elemental.jpg" id="MOVIE_0005" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
						<li class="glide__slide"><img src="http://localhost:9000/images/meg2.jpg" id="MOVIE_0006" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
						<li class="glide__slide"><img src="http://localhost:9000/images/amanofreason.jpg" id="MOVIE_0007" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
						<li class="glide__slide"><img src="http://localhost:9000/images/octonauts.jpg" id="MOVIE_0008" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
						<li class="glide__slide"><img src="http://localhost:9000/images/ransomed.jpg" id="MOVIE_0009" class="mimg"/>
							<a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a></li>
					</ul>
				</div>
			</div>
			<div class="glide__arrows" data-glide-el="controls">
				<button class="glide__arrow glide__arrow--left" data-glide-dir="<"><</button>
				<button class="glide__arrow glide__arrow--right" data-glide-dir=">">></button>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/@glidejs/glide"></script>
	<script>
		const config = {
			type : 'carousel',
			perView: 5
		}
		new Glide('.glide', config).mount()
	</script>

	<div class="section1">
		<div class="col" >
			<iframe justify-content-center width="100%" height="500px"
					src="https://www.youtube.com/embed/oSqK_v6zPoM?mute=1&autoplay=1"></iframe>
		</div>
	</div>
	<div class="ggaeventtitle">
				<img src="http://localhost:9000/images/eventtitle.png">
			</div>
	<div class="section3">
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" data-bs-interval="2000">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="http://localhost:9000/joinevent">
					<img src="http://localhost:9000/images/joineventbanner.jpg" class="d-block w-100" style="height: 200px;" alt="...">
					</a>
				</div>
				<div class="carousel-item">
					<a href="http://localhost:9000/order">
					<img src="http://localhost:9000/images/bannerimg2.jpg" class="d-block w-100" style="height: 200px;" alt="...">
					</a>
				</div>
				<div class="carousel-item">
					<a href="http://localhost:9000/store/combo">
					<img src="http://localhost:9000/images/footerimg2.jpg" class="d-block w-100" style="height: 200px;" alt="...">
					</a>
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

	<!-- 고정 버튼 -->
	<div class="fixed_button">

		<div class = "fixed" onclick="window.scrollTo(0,0);">
			<img src="http://localhost:9000/images/top.png" class="fixed_top_btn">
		</div>

		<div class="fixed">
			<button type="button" class="fixed_order_btn" id="indexOrderBtn"><img src="http://localhost:9000/images/indexorderbtn.png"></button>
		</div>

		<!-- 날씨 부분으로 하단 이동 -->
		<div class="fixed" onclick="window.scrollTo(1600,2600);">
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

		<div class="ggamovieranktitle">
			<img src="http://localhost:9000/images/movierank.png">
		</div>
		<div id="1111" class="Kchoice">
			<select id="kselect" class="K">
				<%--<option value = "default">일별/주간 선택</option>--%>
				<option value = "Daily">일별</option>
				<option value = "Weekly">주간</option>
			</select>
			<button type ="button" id="btnKobis" class="Kbtn">조회</button>



		</div>
		<p class="kp">* 일별 박스오피스는 하루 전, 주간은 7일 전으로 조회됩니다.</p>
	</div>

		<!-- Modal -->

		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

					</div>
					<div class="modalOrder">
						<button type="button"><a href="http://localhost:9000/order">예매하기</a></button>
					</div>

					<div class="modal-body" id="modal-body">



					</div>

				</div>
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
					<p align="left" class="mapaddress">주소 : 서울 강남구 강남대로 78길 8 한국빌딩 4F, 8F</p>
				</div>
<%--				<div class="card mb-4 rounded-3 shadow-sm">--%>
<%--					<div class="card-body">--%>
<%--						<p class="card-text">서울 강남구 강남대로 78길 8 한국빌딩 4F, 8F</p>--%>
<%--					</div>--%>
<%--				</div>--%>
				<div class="col-3">
					<div class="weather_api">
						<div>
							<button type="button" class="btn_weather_date" id="today">오늘 날씨</button>
							<button type="button" class="btn_weather_date" id="tomorrow">내일</button>
							<button type="button" class="btn_weather_date" id="after">모레</button>
							<div class="weather_icon" id="weather_icon">
								<!-- 날씨API 들어가는 자리 -->
							</div>
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