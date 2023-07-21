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
.disabled-coupon {
	color: red;
}
</style>
<script>

	$(document).ready(function() {
		/*$('#applyCouponBtn').click(function() {
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
		});*/

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


		/*$('#paymentBtn').click(function() {
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
		});*/

		/*$('#productcartBtn').click(function (){
			window.open('/productorderlistwindow', 'zz',target='_parent');
		});*/

		function hideOption() {
			const couponSelect = document.getElementById('couponSelect');
			const selectedValue = couponSelect.value;

			if (selectedValue === '') {
				for (let i = 1; i < couponSelect.options.length; i++) {
					couponSelect.options[i].style.display = 'block';
				}
			} else {
				couponSelect.options[2].style.display = 'none';
			}
		}

		/*$('select[name="coupon"]').click(function (){
			var cid = $(this).attr('id');
			let prc = $('td#'+cid).text();
			let dprc = $(this).val();

			if ($(this).val() == "") {
				alert("쿠폰을 선택해주세요");
			} else {
				alert($(this).val());
			}
		});*/

		/*$('select[name="coupon"]').change(function() {
			var cid = $(this).attr('id');
			var prc = $('td#' + cid).text();
			var dprc = $(this).val();
			var couponDiscountElement = $(this).closest('tr').find('.couponDiscount');

			if ($(this).val() == "") {
				couponDiscountElement.text('');
			} else {
				var finalPrice = parseFloat(prc) - parseFloat(dprc);
				couponDiscountElement.text(finalPrice).css('color', 'red');
			}

			var selects = $('select[name="coupon"]');
			selects.not(this).find('option').prop('disabled', false);
			var selectedValue = $(this).val();
			if (selectedValue !== "") {
				selects.not(this).find('option[value="' + selectedValue + '"]').prop('disabled', true);
			}
		});*/

		$('select[name="coupon"]').change(function() {
			var cid = $(this).attr('id');
			var prc = $('td#' + cid).text();
			var dprc = $(this).val();
			var couponDiscountElement = $(this).closest('tr').find('.couponDiscount');

			if ($(this).val() == "") {
				couponDiscountElement.text($('td#' + cid).text()).css('color', 'black');
			} else {
				var displayText = parseFloat(prc) - parseFloat($(this).find('option:selected').text().split(' ')[1]);
				couponDiscountElement.text(displayText).css('color', 'blue');
			}

			var selectedValue = $(this).val();
			var selectedIds = $('select[name="coupon"] option:selected').map(function() {
				return $(this).val();
			}).get();

			$('select[name="coupon"]').each(function() {
				var optionValues = $(this).find('option').map(function() {

					return $(this).val();
				}).get();

				$(this).find('option').prop('disabled', false).css('color', 'black');

				for (var i = 0; i < selectedIds.length; i++) {
					if (selectedIds[i] !== "" && optionValues.includes(selectedIds[i]) && selectedIds[i] !== $(this).val()) {
						$(this).find('option[value="' + selectedIds[i] + '"]').prop('disabled', true).css('color', 'red');

					}


				}

			});
			/*var output = "<input type='hidden' name='cidArray' value='"+$(this).attr("id")+"'/>";
			$("form[name='productorderForm']").append(output);*/
		});

		$('#applyCouponBtn').click(function() {
			var totalAmount = 0;
			$('.couponDiscount').each(function() {
				var discount = $(this).text();
				if (discount !== '') {
					totalAmount += parseFloat(discount);
				}
			});
			$('#finalAmount').text(totalAmount + ' 원');

			var totalProductPrice = parseFloat($('#totalProductPrice').text());
			var finalAmount = totalProductPrice - totalAmount;
			$('#couponDiscount').text(finalAmount + ' 원');
			$('#finalAmount').text(totalProductPrice - finalAmount + ' 원');
		});


		/*$('#paymentListBtn').click(function() {
			var productOrderDto = [];
			$('select[name="coupon"]').each(function() {
				var cidArray = $(this).attr('id');
				var couponidArray = $(this).val();

				productOrderDto.push({
					cidArray : cidArray ,
					couponidArray : couponidArray
				});
			});

			alert(JSON.stringify(productOrderDto));

			$.ajax({
				url: '/productorderlist',
				method: 'POST',
				data: JSON.stringify(productOrderDto),
				contentType: 'application/json',
				success: function(response) {
				}
			});
		});*/

		$('#paymentListBtn').click(function() {
			var productOrderDto = {
				cidArray: [],
				couponidArray: [],
				qtyArray: [],
				pidArray: []
			};

			$('select[name="coupon"]').each(function() {
				productOrderDto.cidArray.push($(this).attr('id'));
				productOrderDto.couponidArray.push($(this).val());
				productOrderDto.qtyArray.push($(this).closest('tr').find('td[data-id]').data('id'));
				productOrderDto.pidArray.push($(this).closest('tr').find('input[name="pid"]').val());

			});

			$.ajax({
				url: '/productorderlist',
				method: 'POST',
				data: productOrderDto,
				success: function(orderNumber) {
					window.location.href = '/productorderconlist/'+orderNumber;
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


			<img src="http://localhost:9000/images/storetitle.png"><br><br><br>
		<h2>상품 정보</h2>
		<hr style="border-top-width: 4px;">
		<c:forEach var="productDto" items="${list}">
			<table class="table" style="border-bottom: 10px #90A4AE;">
				<tbody>
				<tr>
					<td class="col-md-6 text-center">
						<img src="http://localhost:9000/upload/${productDto.gsfile}" style="max-width: 50%; max-height: 300px; border: none;">
					</td>
					<td class="col-md-6">

						<p style="margin-bottom: 10px; margin-top: 30px; margin-left: 100px;">상품 이름: <span style="float: right;">${productDto.pname}</span></p>
						<p style="margin-bottom: 10px; margin-left: 100px;">상품 가격: <span style="float: right;">${productDto.pprice} 원</span></p>
						<p style="margin-bottom: 10px; margin-left: 100px;">주문 수량:<span style="float: right;"> ${productDto.qty}개</span></p>
						<hr style="margin-left: 100px;">
						<p style="margin-bottom: 10px; margin-left: 100px;">상품 할인: <span style="float: right;">0 원</span></p>
						<p style="margin-bottom: 10px; margin-left: 100px;">주문 금액:<span style="float: right;"> ${productDto.pprice * productDto.qty} 원</span></p>
					</td>
				</tr>
				</tbody>
			</table>

			<c:set var="totalProductPrice" value="${totalProductPrice + (productDto.pprice * productDto.qty)}" />
		</c:forEach>
			<div class="row">
				<br><br>
				<h2>MY 쿠폰</h2>
				<br><br><br>
				<p style="padding-left: 610px;">총 상품 가격:<span style="float: right;" id="totalProductPrice">${totalProductPrice}  원</span></p><br><br>
				<p style="padding-left: 610px;">총 주문 금액:<span style="float: right;">${totalProductPrice}  원</span></p>
				<p style="padding-left: 610px;">상품 할인:<span style="float: right;" id="couponDiscount"> 0 원</span></p><br><br>
				<p style="padding-left: 610px;">
					쿠폰 할인:<span style="float: right;">  <a href="#" class="btn btn-secondary" data-bs-toggle="modal"  data-bs-target="#productModal" id="productcartBtn" style="width: 150px">쿠폰 조회/적용</a>
					<button type="button" class="btn btn-secondary" id="cancelCouponBtn" style="width: 80px; display: none">취소</button>
					&nbsp;&nbsp;<span id="addCouponName"></span><input type="hidden" id="couponid" value=""></span>
				</p>
				<p style="padding-left: 610px;">최종 금액:<span style="float: right;"> <span id="finalAmount">${totalProductPrice} 원</span></span></p>

			</div>
			<hr><br>
		<%--<form name="productorderForm" action="/productorderconlist" method="post">--%>
			<div class="row">
				<div class="col-12 text-center">
					<button type="submit" class="btn btn-secondary" style="width: 100px; height: 50px;" id="paymentListBtn">결제하기</button>
				</div>
			</div>
		<%--</form>--%>



	</section>
	</div>
	<!-- content -->

	<!-- 상품 팝업 모달 -->
	<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="couponModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="productModalLabel">쿠폰 조회/적용</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 쿠폰 조회/적용 내용 -->
					<h5>MY 구매 목록</h5>
					<div style="margin: auto;"><p style="color: #777777">* 쿠폰 중복 사용 불가 *</p></div>
					<table class="table text-center" style="font-size: 16px">
						<thead>
						<tr>
							<th>이미지</th>
							<th>상품명</th>
							<th>가격</th>
							<th>수량</th>
							<th>상품 가격</th>
							<th>적용</th>
							<th>할인 금액</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="productDto" items="${list}">
							<tr>
								<td><img style="width: 100px;" src="http://localhost:9000/upload/${productDto.gsfile}"></td>
								<input type="hidden" name="pid" id="pid" value="${productDto.pid}">
								<td>${productDto.pname}</td>
								<td>${productDto.pprice}</td>
								<td data-id="${productDto.qty}">${productDto.qty}</td>
								<td id="${productDto.cid}"> ${productDto.pprice * productDto.qty}</td>
								<td>
									<select name="coupon" id="${productDto.cid}" class="form-control couponSelect"<%-- onchange="handleCouponSelection(this)"--%>>
										<option value="">쿠폰 선택</option>
										<c:forEach var="coupon" items="${couponList}">
											<option value="${coupon.couponid}">${coupon.couponname} (${coupon.discount} 원 할인)</option>
										</c:forEach>
									</select>
								</td>
									<%--<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#couponModal" id="couponBtn" style="width: 100px" data-bs-dismiss="">쿠폰 적용</button>--%>
								<td class="couponDiscount">${productDto.pprice * productDto.qty}</td>
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




	<!--쿠폰 팝업 모달 -->
	<%--<div class="modal fade" id="couponModal" tabindex="-1" role="dialog" aria-labelledby="couponModalLabel" aria-hidden="true">
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
						<input type="hidden" &lt;%&ndash;id="sessionID"&ndash;%&gt; value="${sessionScope.svo.id}">
						<button type="button" class="btn btn-secondary" &lt;%&ndash;id="applyCouponBtn"&ndash;%&gt; data-bs-dismiss="modal">적용</button>
					</div>
				</div>
			</div>
		</div>
	</div>
--%>


	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>
	<!-- footer -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script> <!-- 부트스트랩 -->

	<script>
		function handleCouponSelection(select) {
			// 선택된 select 태그의 값을 가져옵니다.
			var selectedValue = select.value;

			// 모든 select 태그를 순회하면서 중복된 값을 가진 태그를 비활성화합니다.
			var selects = document.getElementsByClassName('couponSelect');
			for (var i = 0; i < selects.length; i++) {
				if (selects[i] !== select && selects[i].value === selectedValue) {
					selects[i].value = '';
					selects[i].classList.add('disabled-coupon');
				} else {
					selects[i].classList.remove('disabled-coupon');
				}
			}

		}
	</script>
</body>
</html>