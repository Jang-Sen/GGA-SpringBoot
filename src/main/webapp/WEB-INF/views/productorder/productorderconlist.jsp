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

.form-inline {
	display: flex;
	align-items: center;
}
.form-group {
	margin-left: 60px;
	margin-right: 70px;
}





</style>
<script>
	$(document).ready(function() {

		$('.detailsTable').hide();

		$('#viewDetailsBtn').on('click', function() {
			$('.detailsTable').toggle();
		});


		const productNames = [];

		$('.previousName').each(function() {
			const productName = $(this).text();
			productNames.push(productName);
		});
		productNames.forEach(function(productName, index) {
			let finalName = '';
			if (productNames.length == 1) {
				finalName = productName;
			} else {
				finalName = productName + ' 외 ' + (productNames.length-1) + '개';
			}

			$('.productFinalName').eq(index).text(finalName);
		});

		let totalPayment = 0;

		// previousPrice 클래스를 갖는 요소들의 값을 모두 더합니다.
		$('.previousPrice').each(function() {
			const price = parseInt($(this).text().replace(/[^0-9]/g, ''));
			totalPayment += price;
		});

		const finalPriceElement = $('.productFinalPrice');
		finalPriceElement.text('최종 결제 금액: ' + totalPayment + ' 원');


		$('#productSearchDate, #productSearchDateWeek, #productSearchDateMonth, #productSearchDateThreeMonth').click(function (){
			let startDate = $('#startDate').val();
			let endDate = $('#endDate').val();


			if (startDate == ''){
				alert("시작 날짜를 검색해주세요");
			} else {
				$.ajax({
					url: '/product_date_search/'+startDate+'/'+endDate,
					success: function (result){
						if (result.length >= 1){
							let productOrderTableBody = $('#productOrderTableBody');
							productOrderTableBody.empty();

							for (let i = 0; i < result.length; i++) {
								let product = result[i];
								let row = $('<tr>');
								row.append($('<td>').append(
										$('<img>').attr('src', 'http://localhost:9000/upload/' + product.gsfile)
								));
								row.append($('<td>').text(product.pname));
								row.append($('<td>').text(product.couponname != null ? product.couponname : '사용한 쿠폰이 없습니다'));
								row.append($('<td>').text(product.qty));
								row.append($('<td>').text(product.finalprice));
								row.append($('<td>').text(product.poid));
								row.append($('<td>').text(product.podate));
								productOrderTableBody.append(row);
							}

						} else {
							alert("검색결과 없습니다");
						}

					}
				});
			}

		});
	});
</script>
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
		<table class="table table-bordered-none" style="width: 100%;">
			<tr>
				<th>상품명</th>
				<th>결제 금액</th>
				<th>주문 번호</th>
				<th>상세보기</th>
			</tr>
			<tr>
				<td class="productFinalName"></td>
				<td class="productFinalPrice"></td>
				<td class="productFinalPoid">${productOrderDto[0].poid}</td>
				<td><button type="button" class="btn btn-secondary" id="viewDetailsBtn">상세보기</button></td>
			</tr>

		</table><br>
		<table class="table table-bordered detailsTable"  style="width: 100%;">
			<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>사용한 쿠폰명</th>
					<th>수량</th>
					<th>결제 금액</th>
					<th>주문 번호</th>
					<th>구매 일자</th>
			</tr>
			<c:forEach var="productOrderDto" items="${productOrderDto}">
			<tr>
				<td><img src="http://localhost:9000/upload/${productOrderDto.gsfile}" style="max-width: 70%; max-height: 200px; border: none;"></td>
				<td class="previousName">${productOrderDto.pname}</td>
				<td>
					<c:choose>
						<c:when test="${productOrderDto.couponname != null}"><span style="color: blue;">${productOrderDto.couponname}</span></c:when>
						<c:otherwise><span style="color: red;">사용한 쿠폰이 없습니다</span></c:otherwise>
					</c:choose>
				</td>
				<td>${productOrderDto.qty}</td>
				<td class="priceContent">
					<c:choose>
						<c:when test="${productOrderDto.couponname != null}">
							<p style="color: gray; text-decoration: line-through; margin: 0px; padding: 0px;" >${productOrderDto.pprice*productOrderDto.qty} 원</p>
							<p style="color: blue; margin: 0px; padding: 0px;" class="previousPrice">${productOrderDto.pprice*productOrderDto.qty - productOrderDto.discount} 원</p></c:when>
						<c:otherwise><span style="color: red;" class="previousPrice">${productOrderDto.pprice*productOrderDto.qty - productOrderDto.discount} 원</span></c:otherwise>
					</c:choose>
				</td>
				<td class="productOrderPoid">${productOrderDto.poid}</td>
				<td>${productOrderDto.podate}</td>
			</tr>
			</c:forEach>
		</table>


		<%--<br><br><br><br><br><br><br>
		<div class="myreview_header">
			<h1>My상품구매내역 목록</h1>
		</div>

		<form name="searchForm" action="product_date_search" method="POST" >
			<div class="form-inline">
				<div class="form-group">
					<label for="startDate">시작 날짜:</label>
					<input type="date" id="startDate" name="startDate" class="form-control" style="width: 200px;">
				</div>
				<div class="form-group">
					<label for="endDate">종료 날짜:</label>
					<input type="date" id="endDate" name="endDate" class="form-control" style="width: 200px;" value="<%= java.time.LocalDate.now() %>">
				</div>
				<button type="button" id="productSearchDate" class="btn btn-outline-secondary">검색</button>
			</div>
			<div class="form-group">
				<button type="button" id="productSearchDateWeek" class="btn btn-outline-secondary" onclick="setDateRange(7)">일주일 전</button>
				<button type="button" id="productSearchDateMonth" class="btn btn-outline-secondary" onclick="setDateRange(30)">한달 전</button>
				<button type="button" id="productSearchDateThreeMonth" class="btn btn-outline-secondary" onclick="setDateRange(90)">3개월 전</button>
			</div>
		</form>

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
			<tbody id="productOrderTableBody">
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
				<td>
					<c:choose>
						<c:when test="${productList.couponname != null}">
							<p style="color: gray; text-decoration: line-through; margin: 0px; padding: 0px;" >${productList.pprice*productList.qty} 원</p>
							<p style="color: blue; margin: 0px; padding: 0px;" class="previousPrice1">${productList.pprice*productList.qty - productList.discount} 원</p></c:when>
						<c:otherwise><span style="color: red;" class="previousPrice1">${productList.pprice*productList.qty - productList.discount} 원</span></c:otherwise>
					</c:choose>
				</td>
				<td>${productList.poid}</td>
				<td>${productList.podate}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</section>
	</div>--%>
	<!-- content -->


	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
	<script>
		function setDateRange(days) {
			const today = new Date();
			const startDate = new Date(today);
			startDate.setDate(startDate.getDate() - days);

			const startDateValue = startDate.toISOString().split('T')[0];
			const endDateValue = today.toISOString().split('T')[0];

			document.getElementById("startDate").value = startDateValue;
			document.getElementById("endDate").value = endDateValue;
		}
	</script>
</body>
</html>