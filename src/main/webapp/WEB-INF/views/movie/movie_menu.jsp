<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />	
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

		.buttons button:hover {
			  background-color: #e1bee7;
			}

		.card {
	        border:3px solid red;
	        float:left;
	        margin:auto;
	        text-align:center;
	        width: 300px;
  			height: 750px;
	        display:inline-block;
	        }
	 

			img {
			  height: 450px;
			  width: 100%;
			} 
			.orderbtn{
			/* margin-left:55px; */
			height:50px;
			width:160px;
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
		<div class="movie_titleimg">
		<img src="http://localhost:9000/images/movietitle.png">
			<input type="hidden" id="unLoginCheck" value="${sessionScope.svo.id}">
		</div>
		<nav class="buttons">
		<a href="http://localhost:9000/movie_menu"><img src="http://localhost:9000/images/moviechart.png" class="btn-outline-secondary"></a>
		<a href="http://localhost:9000/commingsoon"><img src="http://localhost:9000/images/commingsoon2.png" class="btn-outline-secondary2"></a>
		</nav>
		<nav class="menu1">
			<div class="row">
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/inception.jpg" class="mimg" id="MOVIE_0004">
					  <div class="card-body">
					    <h5 class="card-title">인셉션</h5>
					    <p class="card-text">개봉일 : 2020.01.01<p>
					   <!--  <p>🚘🚘</p> -->
					   <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <br>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/darknight.jpg" class="mimg" id="MOVIE_0001">
					  <div class="card-body">
					    <h5 class="card-title">다크 나이트 라이즈</h5>
					    <p class="card-text">개봉일 : 2020.01.01</p>
					    <!-- <p>🚘🚘🚘</p> -->
					    <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <br>
					   	<a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/door.jpg" class="mimg" id="MOVIE_0002">
					  <div class="card-body">
					    <h5 class="card-title">스즈메의 문단속</h5>
					    <p class="card-text">개봉일 : 2020.01.01<p>
					    <!-- <p>🚘🚘🚘🚘</p> -->
					    <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <br>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/ringsking.jpg" class="mimg" id="MOVIE_0007">
					  <div class="card-body">
					    <h5 class="card-title">반지의 제왕</h5>
					    <p class="card-text">개봉일 : 2020.01.01<p>
					    <!-- <p>🚘🚘</p> -->
					    <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <br>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/dune.jpg" class="mimg" id="MOVIE_0003">
					  <div class="card-body">
					    <h5 class="card-title">듄</h5>
					    <p class="card-text">개봉일 : 2020.01.01<p>
					    <!-- <p>🚘🚘</p> -->
					    <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <br>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
				<div class="card" >
				  <img src="http://localhost:9000/images/slamdunk.jpg" class="mimg" id="MOVIE_0009">
				  <div class="card-body">
				    <h5 class="card-title">더 퍼스트 슬램덩크</h5>
				    <p class="card-text">개봉일 : 2020.01.01<p>
				    <!-- <p>🚘🚘</p> -->
					   <span class="material-symbols-outlined">directions_car</span>
					   <span class="material-symbols-outlined">directions_car</span>
					   <br>
				   			 <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
				  </div>
				</div>
				</div>
			</div>
		</nav>
			
			
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