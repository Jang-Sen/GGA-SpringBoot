<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>gga_plz</title>
	<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
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
	section.moviemanager th {
		width:20%
	}

	section.moviemanager table {
		margin:auto;
		vertical-align:middle
	}
	section.moviemanager table input {
		width:70%;
	}
	section.moviemanager table button {
		border:1px solid black;
	}
	section.moviemanager table img{
		width:300px;
		height: 200px;
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
	<div class="board_title">
		<h1>영화 등록</h1>
	</div>
	<section class="moviemanager">
		<form name="movieDelete" action="/movie_delete" method="post">
			<table class="table table-bordered" style="width: 90%;">
				<tr>
					<th>영화제목</th>
					<td>${movie.movietitle}</td>
					<input type="hidden" name="movieid" value="${movie.movieid}"></td>
					<input type="hidden" name="gsfiles" value="${movie.gsfiles}"></td>
					<input type="hidden" name="smainposter" value="${movie.smainposter}"></td>
					<input type="hidden" name="sstillcut1" value="${movie.sstillcut1}"></td>
					<input type="hidden" name="sstillcut2" value="${movie.sstillcut2}"></td>
					<input type="hidden" name="sstillcut3" value="${movie.sstillcut3}"></td>
					<input type="hidden" name="sstillcut4" value="${movie.sstillcut4}"></td>
				</tr>
				<tr>
					<th>장르</th>
					<td>${movie.genre}</td>
				</tr>
				<tr>
					<th>상영날짜</th>
					<td>${movie.moviedday}</td>
				</tr>
				<tr>
					<th>상영시간</th>
					<td>${movie.runtime}</td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td>${movie.movieinfo}</td>
				</tr>
				<tr>
					<th>감독</th>
					<td>${movie.director}</td>
				</tr>
				<tr>
					<th>배우</th>
					<td>${movie.actor}</td>
				</tr>
				<tr>
					<th>메인포스터</th>
					<td><c:if test="${movie.smainposter != null}"><img src="http://localhost:9000/upload/${movie.smainposter}"></c:if></td>
				</tr>
				<tr>
					<th>스틸컷1</th>
					<td><c:if test="${movie.sstillcut1 != null}"><img src="http://localhost:9000/upload/${movie.sstillcut1}"></c:if></td>
				</tr>
				<tr>
					<th>스틸컷2</th>
					<td><c:if test="${movie.sstillcut2 != null}"><img src="http://localhost:9000/upload/${movie.sstillcut2}"></c:if></td>
				</tr>
				<tr>
					<th>스틸컷3</th>
					<td><c:if test="${movie.sstillcut3 != null}"><img src="http://localhost:9000/upload/${movie.sstillcut3}"></c:if></td>
				</tr>
				<tr>
					<th>스틸컷4</th>
					<td><c:if test="${movie.sstillcut4 != null}"><img src="http://localhost:9000/upload/${movie.sstillcut4}"></c:if></td>
				</tr>
				<tr>
					<th>예고편</th>
					<td>${movie.youtube}</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="/admin_movie_update/${movie.movieid}">
							<button type="button" class="btn btn-outline-secondary">수정하기</button></a>
						<button type="button" id="btnMovieDelete" class="btn btn-outline-secondary">삭제하기</button>
						<a href="http://localhost:9000/admin_movie_list/1">
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