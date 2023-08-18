<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/gga_javascript.js"></script> <!-- gga_javascript.js -->
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
.section2{
	display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: stretch;
    flex-basis: 0;
    flex-grow: 1;
    max-width: 100%;
    padding: 10px;
}

.section4{
    margin-top: 20px;
}
.admin_index_btn1 {
  display: flex;
  justify-content: center;
}

.admin_index_btn1 img {
  width: 300px;
  margin: auto;
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
	<div class="admin_index_title">
	<img src="http://localhost:9000/images/adminmaintitle.png">
	</div>
		<div class="section1">
			<div class="admin_index_btn">
				<a href="/admin_member_list/1"><img src="http://localhost:9000/images/memberedit.png"></a>
				<a href="http://localhost:9000/admin_board_list"><img src="http://localhost:9000/images/reviewedit.png"></a>
			<br>
				<a href="http://localhost:9000/admin_notice_list"><img src="http://localhost:9000/images/noticeedit.png"></a>
				<a href="http://localhost:9000/movie_list/1"><img src="http://localhost:9000/images/movieedit.png"></a>
			<br>
			</div>
			<div class="admin_index_btn1">
				<a href="http://localhost:9000/admin_product_list/1"><img src="http://localhost:9000/images/storeedit.png"></a>
			</div>
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