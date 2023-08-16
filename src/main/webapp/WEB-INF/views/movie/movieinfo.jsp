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
.john {
	width:450px;
	height:700px;
}
.movieinfotable img{
	height:50px;
	width:117px;
	margin:25px 50px 25px 0;
}
.orderbtn{
	width:200px;
	heigth:110px;
	margin:50px 125px;	
}

.movie_info2 .movieinfoback{
	background-image: url(http://localhost:9000/images/ddaom.png);
	background-size: 100%;
	background-position: center top -50px;
}

#movieinfobtn{
	width:200px;
	height: 90px;
	margin-top: 10px;
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
		<div class="content">
			<!-- <section class="movie_info1"> -->
				<div class="row">
					<div class="col">
						<img class="john" src="http://localhost:9000/images/${movie.mainposter}">
					</div>
					<div class="col">
						<table class="movieinfotable">
							<tr>
								<th><img src="http://localhost:9000/images/desctitle.png"></th>
								<td>${movie.movietitle}</td>
							</tr>
							<tr>
								<th><img src="http://localhost:9000/images/descdate.png"></th>
								<td>${movie.moviedday}</td>
							</tr>
							<tr>
								<th><img src="http://localhost:9000/images/descdirector.png"></th>
								<td>${movie.director}</td>
							</tr>
							<tr>
								<th><img src="http://localhost:9000/images/descactor.png"></th>
								<td>${movie.actor}</td>
							</tr>
							<tr>
								<th><img src="http://localhost:9000/images/descgenre.png"></th>
								<td>${movie.genre}</td>
							</tr>
							<tr>
								<th><img src="http://localhost:9000/images/descrun.png"></th>
								<td>${movie.runtime}</td>
							</tr>
							<tr>
								<th><img src="http://localhost:9000/images/descgrade.png"></th>
								<td>94% 만족</td>
							</tr>
						</table>
					</div>
				</div>
			
			<div>
				<a class="headerorderbtn">
					<img class="orderbtn" src="http://localhost:9000/images/neworderbtn.png" id="movieinfobtn"></a>
			</div>
			<!-- </section> -->
			
			<section class="movie_info2">
			<div>
				<table class="table">
					<tr class="movieinfoback">
						<td></td>
						<td style="width: 80%;">${movie.movieinfo}</td>
						<td></td>
					</tr>
				</table>
				<!-- <table border="1">
					<tr>
						<th>영화설명</th><td>영화설명</td>
					</tr>
				</table> -->
			</div>
			<div>
				<iframe width="1000" height="450" src="${movie.youtube}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</div>
			</section>
			<div class="still_cut">
				<img src="http://localhost:9000/images/stillcut.jpg" >
			</div>
			<section class="movie_info3">
			<div>
				<a target="_blank" href="http://localhost:9000/images/${movie.stillcut1}">
					<img alt="cut1" src="http://localhost:9000/images/${movie.stillcut1}" width="250" height="210">
				</a>
			</div>		
			<div>
				<a target="_blank" href="http://localhost:9000/images/${movie.stillcut2}">
					<img alt="cut2" src="http://localhost:9000/images/${movie.stillcut2}" width="250" height="210">
				</a>
			</div>		
			<div>
				<a target="_blank" href="http://localhost:9000/images/${movie.stillcut3}">
					<img alt="cut3" src="http://localhost:9000/images/${movie.stillcut3}" width="250" height="210">
				</a>
			</div>		
			<div>
				<a target="_blank" href="http://localhost:9000/images/${movie.stillcut4}">
					<img alt="cut4" src="http://localhost:9000/images/${movie.stillcut4}" width="250" height="210">
				</a>
			</div>		
			
			</section>
		</div>
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