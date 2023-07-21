<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gga_plz</title>

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

.productordercon td img{
	width: 170px;
}

.productordercon table{
	text-align: center;
	vertical-align: middle;
}

.productordercon table tr td:nth-child(5){
	width : 120px;
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
	<section class="productordercon">
		<div class="myreview_header">
				<h1>My상품구매내역</h1>
		</div>
		<table class="table table-bordered" style="width: 90%;">
			<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>사용한 쿠폰명</th>
					<th>수량</th>
					<th>결제 금액</th>
					<th>주문 번호</th>
					<th>구매 일자</th>
			</tr>
<%--			<c:forEach var="productOrderVo" items="${list}">--%>
			<tr>
				<td><img src="http://localhost:9000/upload/${productOrderDto.gsfile}"></td>
				<td>${productOrderDto.pname}</td>
				<td>
					<c:choose>
						<c:when test="${productOrderDto.couponname != null}">${productOrderDto.couponname}</c:when>
						<c:otherwise>사용한 쿠폰이 없습니다</c:otherwise>
					</c:choose>
				</td>
				<td>${productOrderDto.qty}</td>
				<td>${productOrderDto.finalprice}</td>
				<td>${productOrderDto.poid}</td>
				<td>${productOrderDto.podate}</td>
			</tr>
<%--			</c:forEach>--%>
		</table>

		<div class="myreview_header">
			<h1>My상품구매내역 목록</h1>
		</div>
		<table class="table table-bordered" style="width: 90%;">
			<tr>
				<th>이미지</th>
				<th>상품명</th>
				<th>사용한 쿠폰명</th>
				<th>수량</th>
				<th>결제 금액</th>
				<th>주문 번호</th>
				<th>구매 일자</th>
			</tr>
			<c:forEach var="productList" items="${list}">
			<tr>
				<td><img src="http://localhost:9000/upload/${productList.gsfile}"></td>
				<td>${productList.pname}</td>
				<td>
					<c:choose>
						<c:when test="${productList.couponname != null}">${productList.couponname}</c:when>
						<c:otherwise>사용한 쿠폰이 없습니다</c:otherwise>
					</c:choose>
				</td>
				<td>${productList.qty}</td>
				<td>${productList.finalprice}</td>
				<td>${productList.poid}</td>
				<td>${productList.podate}</td>
			</tr>
			</c:forEach>
		</table>
	</section>
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