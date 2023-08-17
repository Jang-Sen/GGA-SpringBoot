<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
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

.joinevent{

	background-image:url("http://localhost:9000/images/joinevent.jpg");
	background-repeat: no-repeat;
	background-size: 900px 1200px;
	height: 1200px;
}
.gohomebtn{
	margin-left: 60px;
	margin-top: 30px;
}
.gohomebtn img{

	margin-left: 60px;
	margin-top: 30px;
}
.joineventbtn{
/*	margin-left: 400px;
	margin-top: 1000px;*/

}
.joineventbtn img{
	margin-left: 330px;
	margin-top: 1100px;

}

</style>

<body>
	<!-- header -->
		<jsp:include page="header.jsp" />
	<!-- header -->
	
	
	<!-- content -->
	<div class="container">
	<div class="joinevent">
		<a href="http://localhost:9000/join" class="joineventbtn"><img src="http://localhost:9000/images/joineventbtn.jpg"></a>
	</div>
		<a href="http://localhost:9000/" class="gohomebtn"><img src="http://localhost:9000/images/gohomebtn.png"></a>
	</div>
	<!-- content -->

	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>