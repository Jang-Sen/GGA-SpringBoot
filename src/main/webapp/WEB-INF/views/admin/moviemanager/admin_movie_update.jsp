<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div class="board_title">
		<h1>영화 수정</h1>
		</div>
		<section class="moviemanager">
			<form name="movieUpdate" action="/movie_update" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 90%;">
				<tr>
					<th>영화제목</th>
					<td><input type="text" name="movietitle" id="movietitle" value="${movieDto.movietitle}"></td>
					<td><input type="hidden" name="movieid" value="${movieDto.movieid}"></td>
				</tr>
				<tr>
					<th>장르</th>
					<td><input type="text" name="genre" value="${movieDto.genre}"></td>
				</tr>
				<tr>
					<th>상영날짜</th>
					<td><input type="text" name="moviedday" value="${movieDto.moviedday}"></td>
				</tr>
				<tr>
					<th>상영시간</th>
					<td><input type="text" name="runtime" value="${movieDto.runtime}"></td>
				</tr>
				<tr>
					<th>줄거리</th>
					<td><input type="text" name="movieinfo" value="${movieDto.movieinfo}"></td>
				</tr>
				<tr>
					<th>감독</th>
					<td><input type="text" name="director" value="${movieDto.director}"></td>
				</tr>
				<tr>
					<th>배우</th>
					<td><input type="text" name="actor" value="${movieDto.actor}"></td>
				</tr>
				<tr>
					<th>메인포스터</th>
					<input type="hidden" name="mainposter" value="${movieDto.mainposter }">
					<input type="hidden" name="smainposter" value="${movieDto.smainposter }">
					<td><input type="file" name="files" class="form-control">
					<c:choose>
						<c:when test="${movieDto.mainposter != null}">
							<span>${movieDto.mainposter}</span>
						</c:when>
						<c:otherwise>
							<span>등록된 파일 없음</span>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>스틸컷1</th>
					<input type="hidden" name="stillcut1" value="${movieDto.stillcut1 }">
					<input type="hidden" name="sstillcut1" value="${movieDto.sstillcut1 }">
					<td><input type="file" name="files" class="form-control">
						<c:choose>
							<c:when test="${movieDto.stillcut1 != null}">
								<span>${movieDto.stillcut1}</span>
							</c:when>
							<c:otherwise>
								<span>등록된 파일 없음</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>스틸컷2</th>
					<input type="hidden" name="stillcut2" value="${movieDto.stillcut2 }">
					<input type="hidden" name="sstillcut2" value="${movieDto.sstillcut2 }">
					<td><input type="file" name="files" class="form-control">
						<c:choose>
							<c:when test="${movieDto.stillcut2 != null}">
								<span>${movieDto.stillcut2}</span>
							</c:when>
							<c:otherwise>
								<span>등록된 파일 없음</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>스틸컷3</th>
					<input type="hidden" name="stillcut3" value="${movieDto.stillcut3 }">
					<input type="hidden" name="sstillcut3" value="${movieDto.sstillcut3 }">
					<td><input type="file" name="files" class="form-control">
						<c:choose>
							<c:when test="${movieDto.stillcut3 != null}">
								<span>${movieDto.stillcut3}</span>
							</c:when>
							<c:otherwise>
								<span>등록된 파일 없음</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>스틸컷4</th>
					<input type="hidden" name="stillcut4" value="${movieDto.stillcut4 }">
					<input type="hidden" name="sstillcut4" value="${movieDto.sstillcut4 }">
					<td><input type="file" name="files" class="form-control">
						<c:choose>
							<c:when test="${movieDto.stillcut4 != null}">
								<span>${movieDto.stillcut4}</span>
							</c:when>
							<c:otherwise>
								<span>등록된 파일 없음</span>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>예고편</th>
					<td><input type="text" name="youtube" value="${movieDto.youtube}"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" id="btnMovieUpdate" class="btn btn-outline-secondary">수정완료</button>
						<a href="http://localhost:9000/movie_content/${movieDto.movieid}">
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