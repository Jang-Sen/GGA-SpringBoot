<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>gga_plz</title>
	<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
	<script src="http://localhost:9000/js/am-pagination.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		  rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>
<script>
	$(document).ready(function(){
		var pager = $('#ampaginationsm').pagination({

			maxSize: '${page.pageCount}',	    		// max page size
			totals: '${page.dbCount}',	// total pages
			page: '${page.reqPage}',		// initial page 현제 페이지 reqpage
			pageSize: '${page.pageSize}',			// max number items per page

			// custom labels		
			lastText: '&raquo;&raquo;',
			firstText: '&laquo;&laquo;',
			prevText: '&laquo;',
			nextText: '&raquo;',

			btnSize:'sm'	// 'sm'  or 'lg'		
		});

		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			jQuery('.showlabelsm').text('The selected page no: '+e.page);
			$(location).attr('href', "http://localhost:9000/admin_movie_list/" + e.page);
		});

	});
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
	section.moviemanager table {
		margin:auto;
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
	<div class="movie_manager_title">
		<img src="http://localhost:9000/images/adminmovietitle.png">
	</div>
	<section class="moviemanager">
		<table class="table" style="width: 90%;">
			<tr>
				<td colspan="7">
					<a class="addmoviebtn" href="http://localhost:9000/admin_movie_register">
						<button type="button"><img src="http://localhost:9000/images/addmoviebtn.png"></button></a>
					<br><br>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>영화ID</th>
				<th>영화 제목</th>
				<th>장르</th>
				<th>개봉일</th>
				<th>상영 시간</th>
				<th>관객수</th>
			</tr>
			<c:forEach var="movie" items="${movieList}">
				<tr>
					<td>${movie.rno}</td>
					<td>${movie.movieid}</td>
					<td><a href="/admin_movie_content/${movie.movieid}">${movie.movietitle}</a></td>
					<td>${movie.genre}</td>
					<td>${movie.moviedday}</td>
					<td>${movie.runtime}</td>
					<td>${movie.audience}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="7">
					<div id="ampaginationsm"></div>
				</td>
			</tr>
		</table>
	</section>
</div>
<!-- content -->


<!-- footer -->
<footer>
	<jsp:include page="../../footer.jsp" />
</footer>
<!-- footer -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> 부트스트랩 -->
</body>
</html>