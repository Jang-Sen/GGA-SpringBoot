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
section.moviemanager table {
		margin:auto;
} 
section.moviemanager table input {
		width:70%;
} 
section.moviemanager table button {
	border:1px solid black;
}
</style>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../../header.jsp" />
	</header>
	<!-- header -->
	
	<!-- content -->
	<div class="container text-center">
	<div class="boardTitle">
		<h1>영화 수정</h1>
		</div>
		<section class="moviemanager">
			<form name="movieUpdate" action="movie_update_proc" method="post">
			<table class="table table-bordered" style="width: 90%;">
				<tr>
					<th>영화제목</th>
					<td><input type="text" name="movietitle" id="movietitle" value="${movieVo.movietitle}"></td>
					<td><input type="hidden" name="movieid" value="${movieVo.movieid}"></td>
				</tr>
				<tr>
					<th>장르</th>
					<td><input type="text" name="genre" value="${movieVo.genre}"></td>
				</tr>
				<tr>
					<th>상영날짜</th>
					<td><input type="text" name="moviedday" value="${movieVo.moviedday}"></td>
				</tr>
				<tr>
					<th>상영시간</th>
					<td><input type="text" name="runtime" value="${movieVo.runtime}"></td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td><input type="text" name="movieinfo" value="${movieVo.movieinfo}"></td>
				</tr>
				<tr>
					<th>감독</th>
					<td><input type="text" name="director" value="${movieVo.director}"></td>
				</tr>
				<tr>
					<th>배우</th>
					<td><input type="text" name="actor" value="${movieVo.actor}"></td>
				</tr>
				<tr>
					<th>메인포스터</th>
					<td><input type="text" name="mainposter" value="${movieVo.mainposter}"></td>
				</tr>
				<tr>
					<th>스틸컷1</th>
					<td><input type="text" name="stillcut1" value="${movieVo.stillcut1}"></td>
				</tr>
				<tr>
					<th>스틸컷2</th>
					<td><input type="text" name="stillcut2" value="${movieVo.stillcut2}"></td>
				</tr>
				<tr>
					<th>스틸컷3</th>
					<td><input type="text" name="stillcut3" value="${movieVo.stillcut3}"></td>
				</tr>
				<tr>
					<th>스틸컷4</th>
					<td><input type="text" name="stillcut4" value="${movieVo.stillcut4}"></td>
				</tr>
				<tr>
					<th>예고편</th>
					<td><input type="text" name="youtube" value="${movieVo.youtube}"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" id="btnMovieUpdate" class="btn btn-outline-secondary">수정완료</button>
						<a href="http://localhost:9000/movie_content?movieid=${movieVo.movieid}">
						<button type="button" class="btn btn-outline-secondary">이전으로</button></a>
					</td>
				</tr>
			</table>
			</form>
		</section>
	</div>
	<!-- content -->


	<!-- footer -->
	<footer>
		<jsp:include page="../../footer.jsp" />
	</footer>
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>