<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gga_plz 네이버헤더</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
	<script src="http://localhost:9000/js/naver_login.js"></script> <!-- gga_jquery.js -->
<script src="http://localhost:9000/js/gga_searchContent.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- 부트스트랩 -->
</head>

<style>
#header_name{
	color: lightYellow;
}

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
</style>

<body>
	<!-- header -->
	<header>
		<div class="container">
			<div class="header_section1">
		      	<div class="header_logo">
		        	<a href="http://localhost:9000/">
		        	<img src="http://localhost:9000/images/newlogo.png"></a>
		      	</div>
		      	
		      	<div class="header_menu">
					<ul>
						<li id="hearder_name">
							<a href="" id="loginValue"></a>
						</li>
						<li>
							<a href="" id="joinValue"></a>
						</li>
						<li>
							<a href="" id="mypageValue"></a>
						</li>
					</ul>
				</div>
			</div>
			<div class="header_section2">
				<div class="header_menu2">
					<ul>
						  <li><a href="http://localhost:9000/movie_menu">
							영화</a></li>
						  <li><a href="http://localhost:9000/order">예매</a></li>
						  <li class="dropdown">
						  <a class="dropdown-toggle-split" href="#" role="button"
							 data-bs-toggle="dropdown" aria-expanded="false">
							 게시판</a>
							  <ul class="dropdown-menu">
								<li><a class="dropdown-item" href="http://localhost:9000/notice_list"
									>공지사항</a></li>
								<li><a class="dropdown-item" href="http://localhost:9000/board_list"
									>커뮤니티</a></li>
								<li><a class="dropdown-item" href="http://localhost:9000/faq"
									>FAQ</a></li>
						 </ul>
						 </li>
						  <li><a href="http://localhost:9000/coronation">
						  대관문의</a></li>
						  <li><a href="http://localhost:9000/store">
						  스토어</a></li>
					</ul>
				</div>
			</div>
				      <div class="mov_search">
				          <input type="text" placeholder="검색어를 입력해 주세요." id="searchContent">
				          <button type="submit" id="btnSearch"><p>검색</p></button>
				      </div>
			</div>
		</div>
	</header>
	<!-- header -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>