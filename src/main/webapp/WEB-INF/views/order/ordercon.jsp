<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 결제 내역</title>

	<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
	<script src="http://localhost:9000/js/gga_javascript.js"></script>
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
</style>

<body>
<!-- header -->
<header>
	<jsp:include page="../header.jsp" />
</header>
<!-- header -->


<!-- content -->
<div class="container">
	<div class="orderConTitle">
		<img src="http://localhost:9000/images/ordercontitle.png">
		<!-- <img src="http://localhost:9000/images/ticket2.png"> -->
	</div>

	<div class="ticketConBack1">
		<label>제목 :</label>
		<p class="ticketConTitle">${orderConDto.movieordertitle}</p><br>
		<label>날짜 :</label>
		<p class="ticketConDate">${orderConDto.odate}</p><br>
		<label>시간 :</label>
		<p class="ticketConTime">${orderConDto.otime}</p><br>
		<label>가격 :</label>
		<p class="ticketConPrice">${orderConDto.price}</p><br>
		<label>좌석 :</label>
		<p class="ticketOrderSeat">${orderConDto.seat}</p>
		<label>예매번호 :</label>
		<p class="ticketOrderNum">${orderConDto.oconid}</p><br>

	</div>

	<div class="ticketConBack2">
		<label>이름 :</label>
		<p class="ticketConName">${orderConDto.oname}</p><br>
		<label>차량번호 :</label>
		<p class="ticketConCarNum">${orderConDto.ocarnum}</p><br>
		<label>Email :</label>
		<p class="ticketConEmail">${orderConDto.oemail}</p><br>
		<label>전화번호 :</label>
		<p class="ticketNumber">${orderConDto.ophone}</p><br>

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