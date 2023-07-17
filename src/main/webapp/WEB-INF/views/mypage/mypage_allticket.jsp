<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_javascript.js"></script> <!-- gga_javascript.js -->
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<style>
    .myorder_row {
        display: flex;
        flex-wrap: wrap;
    }
    .myorder_add2 {
        width: calc(100% / 4); /* 4개씩 배치할 경우 동적으로 너비 할당 */
    }
</style>

</head>
<body>
	<!-- Header -->
		<header>
			<jsp:include page="../header.jsp" />
		</header>
	<!-- Header -->
	<!-- Content -->
	<div class= "content" >
		<section class= "mypage2">
			<div class= "mypage_header">
				<img src="http://localhost:9000/images/mypagetitle.png">
			</div>
			</section>
		<section class="myorder2">
		     <c:choose>
		     <c:when test="${not empty ticketlist}">
			<div class="myorder_header">
				<h1>My예매</h1>
	
			</div>
		     <div class="myorder_row">
			 <c:forEach var="orderconVo" items="${ticketlist}"> 
				<div class="myorder_add3">
				<a class="mypage_ticket2" data-oconid="${orderconVo.oconid}">
					<img src="http://localhost:9000/images/${orderconVo.movieorderposter}.jpg">
				</a>
				</div>
				   <script>
				   if (${loop.count} % 4 === 0 || ${loop.last}) {
		                var br = document.createElement("br");
		                document.querySelector(".myorder_row").appendChild(br);
		            };
        </script>
				<%--  <c:if test="${loop.count % 4 == 0}">
 			     	  <!-- 4개의 항목이 출력되면 다음 행으로 개행 -->
 			   	   <br>
   				 </c:if> --%>	
			</c:forEach>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="allticket_back">
			<a class="openmypage2" id="allticket_back"><img src="http://localhost:9000/images/backbtn.png"></a>
			</div>
			</div>		
		     </c:when>
		     <c:otherwise>
			<%-- <% }else { %> --%>	
			<div class="myorder_header">
				<h1>My예매</h1>
			</div>	
			<div class="myorder_text">
			<br>
			<br>
			<br>
			<br>
			<br>
				<p>아직 예매한 영화가 없습니다. 
				영화를 예매하러 갈까요?</p>
				<a href="http://localhost:9000/order/" class="orderbtn">
					<img src="http://localhost:9000/images/neworderbtn.png"></a>
			</div>		
			<%-- <% } %> --%>
	</c:otherwise>
		     </c:choose>
		</section>
	
		
	</div>
	<!-- Content -->
	<!-- Footer -->
		<footer>
			<jsp:include page="../footer.jsp" />
		</footer>
	<!-- Footer -->
</body>
</html>