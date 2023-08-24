<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - My예매 내역</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_javascript.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<style>
    .myOrderRow {
        display: flex;
        flex-wrap: wrap;
    }
</style>

</head>
<body>

		<header>
			<jsp:include page="../header.jsp" />
		</header>

	<div class= "content" >
		<section class= "myPageAllTicketSection">
			<div class= "myPageHeader">

				<img src="http://localhost:9000/images/mypagetitle.png">
			</div>
			</section>
		<section class="myPageAllTicketSection2">
		     <c:choose>
		     <c:when test="${not empty ticketlist}">
			<div class="myOrderHeader">
				<h1>My예매</h1>
	
			</div>
		     <div class="myOrderRow">
			 <c:forEach var="orderConDto" items="${ticketlist}">
				<div class="myOrderAdd3">
				<a class="myPageTicket2" data-oconid="${orderConDto.oconid}">
					<img src="http://localhost:9000/images/${orderConDto.movieorderposter}.jpg">
				</a>
				</div>
				   <script>
				   if (${loop.count} % 4 === 0 || ${loop.last}) {
		                var br = document.createElement("br");
		                document.querySelector(".myOrderRow").appendChild(br);
		            };
        </script>

			</c:forEach>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="allTicketBack">
			<a class="openMyPage2" id="allTicketBack"><img src="http://localhost:9000/images/backbtn.png"></a>
			</div>
			</div>		
		     </c:when>
		     <c:otherwise>

			<div class="myOrderHeader">
				<h1>My예매</h1>
			</div>	
			<div class="myOrderText">
			<br>
			<br>
			<br>
			<br>
			<br>
				<p>아직 예매한 영화가 없습니다. 
				영화를 예매하러 갈까요?</p>
				<a href="http://localhost:9000/order/" class="myPageHeader">
					<img src="http://localhost:9000/images/newmyPageHeader.png"></a>
			</div>		

	</c:otherwise>
		     </c:choose>
		</section>
	
		
	</div>

		<footer>
			<jsp:include page="../footer.jsp" />
		</footer>

</body>
</html>