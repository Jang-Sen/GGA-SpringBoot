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

.productorder img{
	width: 50%;
}

.productorder p{
	font-size: 20px;
}
</style>
<script>

	$(document).ready(function() {
		$('#applyCouponBtn').click(function() {
			let couponid = $('input[name="couponid"]:checked').val();
			let couponName = $('input[name="couponid"]:checked').closest('tr').find('td:first').text();
			let couponDiscount = $('input[name="couponid"]:checked').closest('tr').find('td:nth-child(3)').text();
			let expectedAmount = $('input[name="couponid"]:checked').closest('tr').find('td:nth-child(4)').text();
			var id = document.getElementById('sessionID').value;
			$.ajax({
				url: '/coupon_update/'+id+'/'+couponid,
				success: function (result){
					// 쿠폰 사용 적용 버튼 숨기고, 쿠폰 사용 취소 버튼 표시
					$('#couponBtn').hide();
					$('#cancelCouponBtn').show();
					$('#addCouponName').show();


					// 최종 금액 업데이트
					let discountedPrice = ${productDto.pprice} - couponDiscount;
					$('#finalAmount').text(discountedPrice + ' 원');
					$('#addCouponName').text(couponName);
					$('#couponid').val(couponid);
				}
			});
		});

		$('#cancelCouponBtn').click(function() {

			let couponid = $('input[name="couponid"]:checked').val();
			let couponName = $('input[name="couponid"]:checked').closest('tr').find('td:first').text();
			let couponDiscount = $('input[name="couponid"]:checked').closest('tr').find('td:nth-child(3)').text();
			let expectedAmount = $('input[name="couponid"]:checked').closest('tr').find('td:nth-child(4)').text();
			var id = document.getElementById('sessionID').value;
			$.ajax({
				url: '/coupon_updateCancel/'+id+'/'+couponid,
					success: function (result){
					// 쿠폰 사용 취소 버튼 숨기고, 쿠폰 사용 적용 버튼 표시
					$('#cancelCouponBtn').hide();
					$('#couponBtn').show();
					$('#addCouponName').hide();

					// 최종 금액 초기화
					$('#finalAmount').text(${productDto.pprice} + ' 원');
					$('#couponid').val("");
					}
			});
		});


		$('#paymentBtn').click(function() {
			var pid = $('#pid').val();
			var couponid = $('#couponid').val();
			var finalAmount = $('#finalAmount').text();
			let couponName = $('input[name="couponid"]:checked').closest('tr').find('td:first').text();

			$.ajax({
				url: '/product_order',
				type: 'POST',
				data: {
					pid: pid,
					couponid: couponid,
					finalAmount: finalAmount,
					couponName: couponName
				},
				success: function(orderNumber) {
					window.location.href = '/productordercon/'+orderNumber;
				}
			});
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
	<section class="productorder">


			<img src="http://localhost:9000/images/storetitle.png">
			<hr style="border-top-width: 4px;"><br>
			<div class="row">
				<div class="col-md-6 text-center">
					<br>
					<img src="http://localhost:9000/upload/${productDto.gsfile}">
				</div>
				<div class="col-md-6">
					<h2>상품 정보</h2>
					<br>
					<input type="hidden" id="pid" value="${productDto.pid}">
					<p>상품 이름: ${productDto.pname}</p>
					<p>상품 가격: ${productDto.pprice} 원</p>
					<p>주문 수량: 1개</p>
					<p>상품 할인: 0 원</p>
					<p>주문 금액: ${productDto.pprice} 원</p><br>
				</div>
			</div>
			<div class="row">
				<hr><br><br>
				<h2>MY 쿠폰</h2>
				<br><br><br>
				<p>상품 가격: ${productDto.pprice} 원</p><br><br>
				<p>상품 할인: 0 원</p><br><br>
				<p>주문 금액: ${productDto.pprice} 원</p>
				<p>
					쿠폰 할인:  <a href="#" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#couponModal" id="couponBtn" style="width: 150px">쿠폰 조회/적용</a>
					<button type="button" class="btn btn-secondary" id="cancelCouponBtn" style="width: 80px; display: none">취소</button>
					&nbsp;&nbsp;<span id="addCouponName"></span><input type="hidden" id="couponid" value="">
				</p>
				<p>최종 금액: <span id="finalAmount">${productDto.pprice} 원</span></p>
				<%--<p>쿠폰 할인:
					<button type="button" class="btn btn-secondary" id="couponBtn" style="width: 150px"
							data-bs-toggle="modal" data-bs-target="#couponModal">쿠폰 조회/적용</button>

				</p>
				<p>최종 금액: ${productDto.pprice} 원</p>--%>
			</div>
			<hr><br>
			<div class="row">
				<div class="col-12 text-center">
					<button type="button" class="btn btn-secondary" style="width: 100px; height: 50px;" id="paymentBtn">결제하기</button>
				</div>
			</div>


	</section>
	</div>
	<!-- content -->


	<!-- 쿠폰 팝업 모달 -->
	<div class="modal fade" id="couponModal" tabindex="-1" role="dialog" aria-labelledby="couponModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="couponModalLabel">쿠폰 조회/적용</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 쿠폰 조회/적용 내용 -->
					<h5>MY 쿠폰</h5>
					<table class="table text-center" style="font-size: 16px">
						<thead>
						<tr>
							<th>쿠폰명</th>
							<th>적용 가능 수량</th>
							<th>할인 가격</th>
							<th>예상 금액</th>
							<th>적용</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="coupon" items="${couponList}">
						<tr>
							<td>${coupon.couponname}</td>
							<td>1</td>
							<td>${coupon.discount}</td>
							<td style="color: cornflowerblue">
								<c:out value="${productDto.pprice - coupon.discount}" />원</td>
							<td>
								<div class="form-check">
									<input class="form-check-input" type="radio" id="${coupon.couponid}" name="couponid" value="${coupon.couponid}">
									<label class="form-check-label" for="${coupon.couponid}"></label>
								</div>
							</td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="text-center">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<input type="hidden" id="sessionID" value="${sessionScope.svo.id}">
						<button type="button" class="btn btn-secondary" id="applyCouponBtn" data-bs-dismiss="modal">적용</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
	<!-- footer -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>