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
	        float:left;
	        margin:auto;
	        text-align:center;
	 
	        display:inline-block;
	        }
	   
			img {
			  height: 350px;
			  width: 100%;
			} 
			.dday{
				color:mediumvioletred;
			}
			
			.orderbtn{
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
		</div>
			<nav class="buttons">
			<a href="http://localhost:9000/movie_menu"><img src="http://localhost:9000/images/moviechart2.png" class="btn-outline-secondary"></a>
		    <a href="http://localhost:9000/commingsoon"><img src="http://localhost:9000/images/commingsoon.png" class="btn-outline-secondary2"></a>
			</nav>
		<nav class="menu1">
			<div class="row">
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/knife.jpg" class="mimg" id="MOVIE_0006">
					  <div class="card-body">
					    <h5 class="card-title">귀멸의 칼날</h5>
					    <p class="card-text">개봉예정일 : 2023.10.15<p>
					    <p class="dday">D-5</p>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/interstellar.jpg" class="mimg" id="MOVIE_0005">
					  <div class="card-body">
					    <h5 class="card-title">인터스텔라</h5>
					    <p class="card-text">개봉예정일 : 2023.10.15<p>
					    <p class="dday">D-3</p>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/war.jpg" class="mimg" id="MOVIE_0013">
					  <div class="card-body">
					    <h5 class="card-title">1917</h5>
					    <p class="card-text">개봉예정일 : 2023.10.15<p>
					    <p class="dday">D-3</p>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/wick.jpg" class="mimg" id="MOVIE_0014">
					  <div class="card-body">
					    <h5 class="card-title">존 윅 4</h5>
					    <p class="card-text">개봉예정일 : 2023.10.15<p>
					    <p class="dday">D-3</p>
					   <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="card">
						  <img src="http://localhost:9000/images/topgun.jpg" class="mimg" id="MOVIE_0012">
						  <div class="card-body">
						    <h5 class="card-title">탑 건 : 매버릭</h5>
						    <p class="card-text">개봉예정일 : 2023.10.15<p>
						    <p class="dday">D-3</p>
						    <a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
						  </div>
						</div>
					</div>
					<div class="col">
						<div class="card">
						  <img src="http://localhost:9000/images/tenet.jpg" class="mimg" id="MOVIE_0011">
						  <div class="card-body">
						    <h5 class="card-title">테넷</h5>
						    <p class="card-text">개봉예정일 : 2023.10.15<p>
						    <p class="dday">D-3</p>
						    <a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
						  </div>
						</div>
					</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/supermario.jpg" class="mimg" id="MOVIE_0010">
					  <div class="card-body">
					    <h5 class="card-title">슈퍼마리오</h5>
					    <p class="card-text">개봉예정일 : 2023.10.15<p>
					    <p class="dday">D-3</p>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/show.jpg" class="mimg" id="MOVIE_0008">
					  <div class="card-body">
					    <h5 class="card-title">위대한 쇼맨</h5>
					    <p class="card-text">개봉예정일 : 2023.10.15<p>
					    <p class="dday">D-3</p>
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