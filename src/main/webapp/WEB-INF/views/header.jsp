<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
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
		        	<a href="http://localhost:9000">
		        	<img src="http://localhost:9000/images/newlogo.png"></a>
		      	</div>
		      	
		      	<div class="header_menu">
		      	<c:choose>
<%--		      	<c:when test="${ sessionDto.loginResult == null || sessionDto.loginResult == 0}">--%>
					<c:when test="${svo.id == null || svo.id == 'none'}">
			      	<ul>
				        <li>
				        	<a href="http://localhost:9000/login">로그인</a>
				        </li>
						<li>
							<a href="http://localhost:9000/join">회원가입</a>
						</li>
						<li>
							<a href="http://localhost:9000/login">마이페이지</a>
						</li>
					</ul>
		      	</c:when>
		      	<c:otherwise>
			      	<ul>
			      		<li id="header_name">
			      			${ svo.name } 님 환영합니다.
			      		</li>
						<li>
							<a href="http://localhost:9000/logout">로그아웃</a>
						</li>
						<li>
							<a href="http://localhost:9000/mypage/${svo.id}/">마이페이지</a>
						</li>
					<c:if test="${ svo.id == 'admin' }">
						<li>
							<a href="http://localhost:9000/admin/index">관리자</a>
						</li>
					</c:if>
			      	</ul>
		      	</c:otherwise>
		      	</c:choose>
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
				            	>리   뷰</a></li>
				            <li><a class="dropdown-item" href="http://localhost:9000/faq"
				            	>FAQ</a></li>
				     </ul>
				     </li>
				      <li><a href="http://localhost:9000/coronation">
				      대관문의</a></li>
				      <li><a href="http://localhost:9000/store/combo">
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