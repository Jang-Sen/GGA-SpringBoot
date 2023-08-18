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
					  <img src="http://localhost:9000/images/oppenhelmer.jpg" class="mimg" id="MOVIE_0001">
					  <div class="card-body">
					    <h5 class="card-title">오펜하이머</h5>
					    <p class="card-text">개봉일 : 2023.08.25<p>

					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/concreteutopia.jpg" class="mimg" id="MOVIE_0002">
					  <div class="card-body">
					    <h5 class="card-title">콘크리트 유토피아</h5>
					    <p class="card-text">개봉일 : 2023.08.09</p>
					   	<a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/honeysweet.jpg" class="mimg" id="MOVIE_0003">
					  <div class="card-body">
					    <h5 class="card-title">달짝지근해: 7510</h5>
					    <p class="card-text">개봉일 : 2023.08.15<p>
					    <!-- <p>🚘🚘🚘🚘</p> -->
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/smugglers.jpg" class="mimg" id="MOVIE_0004">
					  <div class="card-body">
					    <h5 class="card-title">밀수</h5>
					    <p class="card-text">개봉일 : 2023.07.26<p>
					    <!-- <p>🚘🚘</p> -->
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/elemental.jpg" class="mimg" id="MOVIE_0005">
					  <div class="card-body">
					    <h5 class="card-title">엘리멘탈</h5>
					    <p class="card-text">개봉일 : 2023.06.14<p>
					    <!-- <p>🚘🚘</p> -->
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
				<div class="card" >
				  <img src="http://localhost:9000/images/meg2.jpg" class="mimg" id="MOVIE_0006">
				  <div class="card-body">
				    <h5 class="card-title">메가로돈2</h5>
				    <p class="card-text">개봉일 : 2023.08.15<p>
				    <!-- <p>🚘🚘</p> -->
				   			 <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
				  </div>
				</div>
				</div>
				<div class="col">
				<div class="card" >
				  <img src="http://localhost:9000/images/amanofreason.jpg" class="mimg" id="MOVIE_0007">
				  <div class="card-body">
				    <h5 class="card-title">보호자</h5>
				    <p class="card-text">개봉일 : 2023.08.15<p>
				    <!-- <p>🚘🚘</p> -->
				   			 <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
				  </div>
				</div>
				</div>
				<div class="col">
				<div class="card" >
				  <img src="http://localhost:9000/images/octonauts.jpg" class="mimg" id="MOVIE_0008">
				  <div class="card-body">
				    <h5 class="card-title">바다 탐험대 옥토넛 어보브 앤 비욘드</h5>
				    <p class="card-text">개봉일 : 2023.08.10<p>
				   			 <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
				  </div>
				</div>
				</div>
				<div class="col">
				<div class="card" >
				  <img src="http://localhost:9000/images/ransomed.jpg" class="mimg" id="MOVIE_0009">
				  <div class="card-body">
				    <h5 class="card-title">비공식작전</h5>
				    <p class="card-text">개봉일 : 2023.08.02<p>
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