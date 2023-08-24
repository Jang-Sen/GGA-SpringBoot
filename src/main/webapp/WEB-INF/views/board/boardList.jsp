<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA 리뷰</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css">
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_board_list.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 

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
section.board table {
		margin:auto;
}
section.board table tr td a {
	color: darkgreen;
	text-decoration: none;
	transition: color 0.3s;
}
section.board table tr td a:hover {
	color: blue;
}

table tr:last-child {
	border:1px solid white;
}

table tr:last-child nav ul {
	margin-top:30px;
	justify-content:center;
}

table tr{
	vertical-align: middle;
}

table td:nth-child(2){
	text-align:left;
}
div.boardTitle img {
	width:160px;
}

img {
	width:95px;
	height:40px;
}


section.board div.boardSearch1 input {
	position:relative;
	height:30px;width:160px;
	border-radius: 5px;
	opacity:80%;
	border:lightgray 1px solid;
}
section.board div.boardSearch1 {
	float:left;
	position:relative;
	margin-top:32px;
	left:50px; top:0px;
}

.boardBtn1, .boardBtn2{
	border-color:white;
	height:25px;
	background: white;
	border-radius:5px;
	color: black;
	font-size:14px;
	width:60px;
	padding-top:3px;
	position:relative;
}

section.board div.boardSearch button:hover {
	background: powderblue;
}

</style>

<body>

	<header>
		<jsp:include page="../header.jsp" />
	</header>

	<div class="container text-center">
	<div class="boardTitle">
		<img src="http://localhost:9000/images/comtitle.png">
	</div>
		<section class="board">
			<div class="boardSearch1">
				<input type="text" name = "btitle" placeholder=" 게시물 검색" id="btitle" >
				<button type="submit" id="btnBoardSearch" class = "boardBtn1"><p>검색</p></button>
				<a href="/boardList"><button type="submit" class = "boardBtn2"><p>처음으로</p></button></a>
			</div>
			<div class="board_choose">
						<c:choose>
							<c:when test="${svo.id == null }">
								<a href="http://localhost:9000/login" class="writebtncancel">
									<img src="http://localhost:9000/images/writebtn.png">
								</a>
							</c:when>
							<c:otherwise>
								<a href="/boardWrite" class="writebtn">
									<img src="http://localhost:9000/images/writebtn.png">
								</a>
							</c:otherwise>
						</c:choose>
			</div>
		</section>
	</div>

	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>