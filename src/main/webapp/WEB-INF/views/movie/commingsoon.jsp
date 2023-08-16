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
					  <img src="http://localhost:9000/images/sleep0.jpg" class="mimg" id="MOVIE_0010">
					  <div class="card-body">
					    <h5 class="card-title">잠</h5>
					    <p class="card-text">개봉예정일 : 2023.09.06<p>
					    <p class="dday">D-5</p>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/spy0.jpg" class="mimg" id="MOVIE_0011">
					  <div class="card-body">
					    <h5 class="card-title">스파이 코드명 포춘</h5>
					    <p class="card-text">개봉예정일 : 2023.08.30<p>
					    <p class="dday">D-3</p>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/joy0.jpg" class="mimg" id="MOVIE_0012">
					  <div class="card-body">
					    <h5 class="card-title">조이 라이드</h5>
					    <p class="card-text">개봉예정일 : 2023.08.30<p>
					    <p class="dday">D-3</p>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/innocents0.jpg" class="mimg" id="MOVIE_0013">
					  <div class="card-body">
					    <h5 class="card-title">이노센트</h5>
					    <p class="card-text">개봉예정일 : 2023.09.06<p>
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
						  <img src="http://localhost:9000/images/zip0.jpg" class="mimg" id="MOVIE_0014">
						  <div class="card-body">
						    <h5 class="card-title">신체모음.zip</h5>
						    <p class="card-text">개봉예정일 : 2023.08.30<p>
						    <p class="dday">D-3</p>
						    <a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
						  </div>
						</div>
					</div>
					<div class="col">
						<div class="card">
						  <img src="http://localhost:9000/images/target0.jpg" class="mimg" id="MOVIE_0015">
						  <div class="card-body">
						    <h5 class="card-title">타겟</h5>
						    <p class="card-text">개봉예정일 : 2023.08.30<p>
						    <p class="dday">D-3</p>
						    <a class="headerorderbtn">
								<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
						  </div>
						</div>
					</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/flower0.jpg" class="mimg" id="MOVIE_0016">
					  <div class="card-body">
					    <h5 class="card-title">물꽃의 전설</h5>
					    <p class="card-text">개봉예정일 : 2023.08.30<p>
					    <p class="dday">D-3</p>
					    <a class="headerorderbtn">
							<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png"></a>
					  </div>
					</div>
				</div>
				<div class="col">
					<div class="card">
					  <img src="http://localhost:9000/images/legend0.jpg" class="mimg" id="MOVIE_0017">
					  <div class="card-body">
					    <h5 class="card-title">거룩한 술꾼의 전설</h5>
					    <p class="card-text">개봉예정일 : 2023.08.30<p>
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