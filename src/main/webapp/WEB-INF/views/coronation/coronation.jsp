<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>대관문의</title>
	<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/test_gga/css/mycgv.css" type="text/css">
</head>
<style>

.size{
	width : 80px;
}

</style>

<body>

		<jsp:include page="../header.jsp" />

	<div class="container">
		<div class="askTitle">
		<img src="http://localhost:9000/images/ask.png">
		</div>
		<section class="coron1">
		</section>
			<div class="coronDetail">
				<img src="http://localhost:9000/images/corondetail.png">
			</div>
		<section class="coron2">
		<form name = "coronationForm">
			<div class="coronInput">
				<ul>
				<li>
					<label>이름</label>
					<input type="text" id="cname">
				</li>
				<li>
					<label>연락처</label>
					<input type="text" id="cphone1"> - 
					<input type="text" id="cphone2"> - 
					<input type="text" id="cphone3">
				</li>
				<li>
					<label>총 인원수</label>
					<input type="text" id="csize">명
				</li>
				<li>
					<label>문의내용</label>
					<textarea name="coronContent" placeholder="* 200자 이내 작성"></textarea>
				</li>
				</ul>
			</div>
			</form>
		</section>
		<section class="coron_3">
		</section>
	</div>
	<div id="coron_btn">
		<section class="enroll">
			<a href = "http://localhost:9000">
			<button type ="submit" id = "btnConfirm" class="coronBtn"><img src="http://localhost:9000/images/qnabtn.png"></button></a>
		</section>
	</div>


	<jsp:include page="../footer.jsp" />


</body>
</html>