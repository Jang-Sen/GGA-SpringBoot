<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA 결제 페이지</title>

<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
 <script src="http://localhost:9000/js/gga_javascript.js"></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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

.details-link {
	color: #444451;
	font-size: 12pt;
}
.details-link:hover{
	cursor: pointer;
}
.details {
	display: none;
	border: 1px solid #ccc;
	padding: 10px;
	margin-top: 5px;
	max-height: 100px;
	overflow-y: auto;
}
.paymethod {
	background-color: white;
	height: 35px;
	width: 100px;
	margin: 3px;
	border:1px solid lightgray;
	border-radius: 5px;
	color: gray;
}

.paymethodselected {
	background-color: cadetblue;
	border-radius: 5px;
	color: white;
}
</style>
<script>

	$(document).ready(function() {
		$('.details-link').on('click', function() {
			//const details = $(this).data('details');
			const detailsBox = $(this).next('.details');
			detailsBox.slideToggle();
			if (detailsBox.is(':visible')) {
				detailsBox.html()
			}
		});
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
						$(this).find('option[value="' + selectedIds[i] + '"]').prop('disabled', true).css('display', 'none');

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


		var paymethodcon = "";
		var oid = $('#oid').val();


		$('.paymethod').on('click', function() {
			$(this).toggleClass('paymethodselected');
			const otherPayMethods = $('.paymethod').not(this);

			// 다른 .paymethod 요소들에서 paymethodselected 클래스를 제거합니다.
			otherPayMethods.removeClass('paymethodselected');

			paymethodcon = $(this).data('id');

		});

		/*$('#paymentListBtn').click(function() {
			var finalAmount = $('#finalAmount').text();
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
			const p0Checkbox = document.querySelector('#p0');
			const p1Checkbox = document.querySelector('#p1');
			const p2Checkbox = document.querySelector('#p2');
			const p3Checkbox = document.querySelector('#p3');
			const p4Checkbox = document.querySelector('#p4');

			if (paymethodcon.length == 0) {
				alert("결제 수단을 선택해 주세요.");
			} else if (!p0Checkbox.checked) {
				alert("필수 항목에 동의해 주세요.");
				p0Checkbox.focus();
			} else if (!p1Checkbox.checked) {
				alert("GGA MOVIE 이용 약관에 동의해 주세요.");
				p1Checkbox.focus();
			} else if (!p2Checkbox.checked) {
				alert("개인정보 수집 및 이용에 동의해 주세요.");
				p2Checkbox.focus();
			} else if (!p3Checkbox.checked) {
				alert("개인정보 제 3자 제공에 동의해 주세요.");
				p3Checkbox.focus();
			} else if (!p4Checkbox.checked) {
				alert("전자결제대행 이용에 동의해 주세요.");
				p4Checkbox.focus();
			}else {

				var IMP = window.IMP;

				IMP.init("imp71285848");

				var today = new Date();
				var hours = today.getHours(); // 시
				var minutes = today.getMinutes(); // 분
				var seconds = today.getSeconds(); // 초
				var milliseconds = today.getMilliseconds();
				var makeMerchantUid = hours + minutes + seconds + milliseconds;

				var impuid = "";
				var merchantuid = "";


				IMP.request_pay({
					pg: paymethodcon,
					pay_method: 'card',
					merchant_uid: "IMP" + makeMerchantUid,
					name: 'GGA 상품 구매',
					amount: finalAmount,
					buyer_email: 'Iamport@chai.finance',
					buyer_name: '아임포트 기술지원팀',
					buyer_tel: '010-1234-5678',
					buyer_addr: '서울특별시 강남구 삼성동',
					buyer_postcode: '123-456'
				}, function (rsp) { // callback
					if (rsp.success) {
						console.log(rsp),
								impuid = rsp.imp_uid,
								merchantuid = rsp.merchant_uid,

								$.ajax({
									url: '/productorderlist',
									method: 'POST',
									data: productOrderDto,
									success: function (orderNumber) {
										window.location.href = '/productorderconlist/' + orderNumber;
									}
								});
					} else {
						console.log(rsp);
						alert("결제를 실패했습니다. 잠시후 다시 시도해 주세요.");
					}
				})

				/!*$.ajax({
					url: '/productorderlist',
					method: 'POST',
					data: productOrderDto,
					success: function(orderNumber) {
						window.location.href = '/productorderconlist/'+orderNumber;
					}
				});*!/
			}
		});*/
        $('#paymentListBtn').click(function() {
            var finalAmount = $('#finalAmount').text();
            var productOrderDto = {
                cidArray: [],
                couponidArray: [],
                qtyArray: [],
                pidArray: []};

            $('select[name="coupon"]').each(function() {
                productOrderDto.cidArray.push($(this).attr('id'));
                productOrderDto.couponidArray.push($(this).val());
                productOrderDto.qtyArray.push($(this).closest('tr').find('td[data-id]').data('id'));
                productOrderDto.pidArray.push($(this).closest('tr').find('input[name="pid"]').val());

            });
            const p0Checkbox = document.querySelector('#p0');
            const p1Checkbox = document.querySelector('#p1');
            const p2Checkbox = document.querySelector('#p2');
            const p3Checkbox = document.querySelector('#p3');
            const p4Checkbox = document.querySelector('#p4');

            if (paymethodcon.length == 0) {
                alert("결제 수단을 선택해 주세요.");
            } else if (!p0Checkbox.checked) {
                alert("필수 항목에 동의해 주세요.");
                p0Checkbox.focus();
            } else if (!p1Checkbox.checked) {
                alert("GGA MOVIE 이용 약관에 동의해 주세요.");
                p1Checkbox.focus();
            } else if (!p2Checkbox.checked) {
                alert("개인정보 수집 및 이용에 동의해 주세요.");
                p2Checkbox.focus();
            } else if (!p3Checkbox.checked) {
                alert("개인정보 제 3자 제공에 동의해 주세요.");
                p3Checkbox.focus();
            } else if (!p4Checkbox.checked) {
                alert("전자결제대행 이용에 동의해 주세요.");
                p4Checkbox.focus();
            }else {


                $.ajax({
                    url: '/productorderlist',
                    method: 'POST',
                    data: productOrderDto,
                    success: function(orderNumber) {
                        window.location.href = '/productorderconlist/'+orderNumber;
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
		<div id="paydiv">
			<h2>결제 수단</h2>
			<button type="button" class="paymethod" id="selectedcard" data-id="kcp">신용카드</button>
			<button type="button" class="paymethod" id="selectedkakaopay" data-id="kakaopay">
				<img src="http://localhost:9000/images/kakaopayimg.JPG">
			</button>
			<button type="button" class="paymethod" id="selectedpayco" data-id="payco">
				<img src="http://localhost:9000/images/paycoimg.JPG">
			</button>
			<button type="button" class="paymethod" id="selectedbank" data-id="tosspay">
				<img src="http://localhost:9000/images/tosspayimg.JPG">
			</button>

		</div>
		<hr>
		<div id="checkdiv">
			<h2>약관 동의</h2>
			<label>
				<input type="checkbox" id="check-all" onchange="toggleCheckboxes(this)"><a> 전체 동의하기</a>
			</label>
			<br>
			<label>
				<input type="checkbox" class="required-checkbox" id="p0">
				(필수) 만 14세 이상입니다.
			</label>
			<br>
			<label>
				<input type="checkbox" class="required-checkbox" id="p1" data-id="GGA MOVIE 이용 약관">
				(필수) GGA MOVIE 이용 약관
			</label>
			<a class="details-link" data-details="이용약관">자세히</a>
			<div class="details">
				이용약관

				제1장 총칙
				제1조 (목적)
				이 약관은 주식회사 GGA MOVIE(이하 “회사”)가 운영하는 사이버 몰에서 제공하는 인터넷 관련 서비스를 이용함에 있어 사이버 몰과 “이용자”의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

				제2조 (정의)
				① “몰”이란 회사가 재화 또는 용역(이하 “재화 등”)을 “이용자”에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 사이버몰을 말합니다.
				② “이용자”란 “몰”에 접속하여 이 약관에 따라 “회사”가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
				③ “회원”이라 함은 “몰”에 회원 가입을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
				④ “비회원”이란 회원으로 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
				⑤ “판매자”란 “회사”와 “인터넷 쇼핑몰 입점 계약”을 체결하고 “몰”에서 재화 등을 판매하는 자를 말합니다.
				제3조 (약관 등의 명시와 설명 및 개정)
				① “회사”는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 “이용자”가 쉽게 알 수 있도록 ”몰”의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 “이용자”가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
				② “회사”는 “이용자”가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 “이용자”가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 “이용자”의 확인을 구하여야 합니다.
				③ “회사”는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
				④ “회사”는 이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 “몰”의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지하고 “이용자”에게 통지합니다. 다만, “이용자”에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지 및 통지합니다. 이 경우 "회사“는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 “이용자”가 알기 쉽도록 표시합니다.
				⑤ “이용자”는 개정 약관이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전의 영업일까지 개정 전 약관조항에 따라 체결된 계약을 해지할 수 있고, 약관의 개정내용에 대하여 이의를 제기하지 아니하는 경우에는 약관의 개정을 승인한 것으로 봅니다.
				⑥ 회사는 제공하는 서비스 내의 개별 서비스에 대한 별도의 약관 또는 이용조건(이하 “타 약관”이라 한다)을 둘 수 있으며, 이 약관의 동의와는 별개로 회원에게 타 약관에 대한 동의를 받은 후 타 약관을 적용합니다. 이 경우 타 약관은 이 약관에 우선합니다.
				⑦ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.
				제4조(서비스의 제공 및 변경)
				① “회사”는 다음과 같은 업무를 수행합니다.
				1. 재화 등의 거래 및 정보 제공을 위한 플랫폼의 운영 및 개발 업무
				2. 재화 등의 정보 검색 지원 업무
				3. 재화 등의 구매 관련 지원 업무
				4. 대금의 결제 및 정산 관련 업무
				5. 기타 전자상거래와 관련하여 “회사”가 정하는 업무
				② “회사”는 재화 등의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 등의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 등의 내용을 게시한 곳에 즉시 공지합니다.
				③ “몰”이 제공하기로 “이용자”와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 “이용자”에게 통지 가능한 주소로 즉시 통지합니다.
				④ 제3항에 따라 서비스의 내용을 변경하여 “이용자”에게 손해가 발생한 경우 “회사”는 그 손해를 배상합니다. 다만, “회사”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
				제5조(서비스의 중단)
				① “회사”는 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
				② “회사”는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 “이용자” 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “회사”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
				제6조(회원가입)
				① “이용자”는 “회사”가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
				② “회사”는 제1항과 같이 회원으로 가입할 것을 신청한 “이용자” 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
				1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 합니다.
				2. 등록 내용에 허위, 기재 누락, 오기가 있는 경우
				3. 기타 가입신청자를 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
				③ 회원가입계약의 성립 시기는 “회사”의 승낙이 가입 신청자에게 도달한 시점으로 합니다.
				④ “회원”은 회원가입 시 등록한 사항에 변경이 있는 경우, 일정 기간 이내에 “회사”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.
				⑤ “회사”는 『영화 및 비디오물의 진흥에 관한 법률』, 『청소년 보호법』 및 『화학물질 관리법』 등 관련 법령에 따른 등급 및 연령제한 준수를 위하여 “이용자”의 서비스 이용 또는 상품 등 구매를 제한하거나, “이용자”에게 나이 및 본인 확인 등의 절차를 요구할 수 있습니다.
				제7조(회원 탈퇴 및 이용의 제한)
				① “회원”은 “회사”에 언제든지 탈퇴를 요청할 수 있으며 “회사”는 즉시 회원탈퇴를 승낙합니다.
				② “회원”이 다음 각 호의 사유에 해당하는 경우, “회사”는 회원자격을 제한 및 정지시킬 수 있습니다.
				1. 가입 신청 시에 허위 내용을 등록한 경우
				2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰” 이용에 관련하여 “회원”이 부담하는 채무를 기일에 지급하지 않는 경우
				3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
				4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
				③ “회사”가 회원 자격을 제한․정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “회사”는 회원자격을 상실시킬 수 있습니다.
				④ “회사”가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 “회원”에게 이를 통지하고, 회원등록 말소 전 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
				⑤ 제2항부터 제4항까지의 규정에도 불구하고, 다음의 각 호 중 어느 하나에 해당하는 경우 “회사”는 그 사실을 알게 된 날로부터 3일 내에 “회원” 및 “이용자”에게 그 위반 사실을 통보한 후 회원자격을 상실시키거나 “회사”의 서비스 이용을 영구히 제한할 수 있습니다.
				1. 공급받은 재화 등을 고의로 훼손하여 청약철회 등을 요구하는 경우
				2. 타인의 명의나 정보를 도용하여 서비스를 이용하는 경우
				3. 여신전문금융업법 등 관련 법령을 위반하여 비정상적인 결제를 하거나 기타 “회사”의 시스템을 비정상적으로 이용하는 경우
				4. 정당하지 않은 사유로 주문의 취소, 반품, 환불 등을 반복하여 “회사”의 업무를 방해하는 경우
				5. 범죄 또는 현금화 목적 등으로 대금 결제 방식을 악용하는 행위
				6. “회사”의 직원에게 폭언, 폭행 등 적정 범위를 벗어나 신체적, 정신적 고통을 유발할 수 있는 행위를 하는 경우
				7. 그 밖에 통상적이지 않은 방법으로 “몰”을 이용하여 “회사”의 업무와 다른 “회원” 및 “이용자”의 서비스 이용을 방해하여 그 권리와 이익을 현저히 침해하는 경우
				제8조(회원에 대한 통지)
				① “회사”는 “회원”에 대한 통지를 하는 경우, 회원이 “회사”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다. “회원”은 자신이 지정한 전자우편 주소에 변경이 생긴 경우 이를 “몰”에서 정한 방법 및 절차에 따라 이를 수정하여야 하며, “회원”이 이를 게을리하여 “회사”가 원래의 전자우편 주소로 통지를 한 경우 그러한 통지는 유효하게 도달된 것으로 봅니다.
				② “회사”는 불특정다수 회원에 대한 통지의 경우 1주일 이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
				제9조(“회사“의 의무)
				① “회사”는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화 등을 제공하는데 최선을 다하여야 합니다.
				② “회사”는 “이용자”가 안전하게 인터넷 서비스를 이용할 수 있도록 “이용자”의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
				③ “회사”는 회원으로부터 제기되는 의견이나 불만이 객관적으로 정당하다고 인정될 경우 회원의 불만을 해결하기 위해 노력하며, 그에 따른 보상을 할 수 있습니다.
				④ “회사”는 “이용자”가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
				제10조(회원의 ID 및 비밀번호에 대한 의무)
				① ID와 비밀번호에 관한 관리책임은 “회원”에게 있습니다.
				② “회원”은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
				③ “회원”이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “회사”에 통보하고 “회사”의 안내가 있는 경우에는 그에 따라야 합니다.
				제11조(“이용자”의 의무)
				① 이용자는 이 약관의 규정, 회사의 이용정책, 이용안내 사항 및 관련 법령 등을 준수하여야 합니다.
				②“이용자”는 다음 각 호의 행위를 하여서는 안 됩니다.
				1. 회원 가입의 신청 또는 변경 시 허위 내용을 등록하는 행위
				2. 타인의 정보를 도용하는 행위
				3. “몰”에 게시된 정보를 무단으로 변경하는 행위
				4. “회사”가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등을 송신 또는 게시하는 행위
				5. “회사” 또는 제3자의 저작권 등 지적재산권을 침해하는 행위
				6. “회사” 또는 제3자의 명예를 손상시키거나 업무를 방해하는 행위
				7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 “몰"에 공개 또는 게시하는 행위
				제12조(대금 지급방법)
				“몰”에서 구매한 재화 등의 대금 지급은 다음 각 호의 어느 하나의 방법으로 할 수 있습니다. 단, “회사”가 필요로 하는 경우 재화 등의 대금 지급 방법을 각 호의 방법 중 “회사”가 정한 방법으로 결정할 수 있습니다. “회사”는 “이용자”의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
				1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체
				2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
				3. 온라인무통장입금
				4. 전자화폐에 의한 결제 (휴대폰 결제, 온라인 결제서비스를 통한 결제 등)
				5. 수령 시 대금지급
				6. 무신사적립금 등 “몰”이 지급한 적립금에 의한 결제
				7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제
				8. 기타 전자적 지급 방법에 의한 대금 지급 등
				제13조(구매안전서비스의 제공)
				① “회사”는 “이용자”가 재화 등을 공급받기 전에 제12조제2호 및 제5호을 제외한 방법으로 재화 등의 대금을 지급하는 경우, 해당 결제 대금을 제3자에게 예치하고 공급이 완료된 후 “회사” 또는 “판매자”에게 지급하도록 하는 ‘구매안전 서비스’를 제공합니다.
				② “이용자”는 재화 등을 거래한 날부터 4영업일 이내에 그 사실을 “회사”에 통보해야 하며, 4영업일이 지나도록 정당한 사유 없이 거래한 사실을 통보하지 않는 경우 예치된 대금은 “회사”가 지정한 정산대행업체에게 지급될 수 있습니다.
				제14조(무신사 적립금)
				① "회사"는 "회원"이 구매 활동 · 구매후기 작성 · 이벤트 참여를 하거나, 출고지연 · 주문 후 품절 · 청약철회 등의 처리 지연을 당한 경우 ”회사”가 정한 기준에 따라 일정한 "무신사 적립금"을 부여할 수 있습니다.
				② "회원"은 “몰”에서 "상품"을 구매 시 다른 결제 수단과 함께 “무신사 적립금”을 사용할 수 있으며, “무신사 적립금”은 최대 상품금액의 7%까지 사용 가능합니다.
				③ "회사"는 "무신사 적립금"의 적립기준, 사용방법, 사용기한 및 제한 등을 상품, 회원등급 및 지급 사유 등에 따라 다르게 정할 수 있으며, "몰"의 화면에 별도로 게시하거나 통지합니다.
				④ “무신사 적립금”은 1) 사용기한이 먼저 도래하는 순서 2) 사용기한이 동일한 경우 적립일자가 빠른 순서대로 사용됩니다.
				⑤ "회원"은 "무신사 적립금"을 제3자에게 또는 다른 아이디로 양도할 수 없으며 유상으로 거래하거나 현금으로 전환할 수 없습니다.
				⑥ "회원"이 "회사"가 승인하지 않은 방법 또는 허위 정보 제공, 본 약관에 위배되는 등의 부정한 방법으로 "무신사 적립금"을 획득하거나, 부정한 목적이나 용도로 "무신사 적립금"을 사용하는 경우, “회사”는 "무신사 적립금"의 사용을 제한하거나 “회사”가 정한 방법으로 회수할 수 있으며, "무신사 적립금"을 사용한 구매신청을 취소하거나 "회원" 자격을 정지할 수 있습니다.
				⑦ "회원" 탈퇴 시 사용하지 않은 "무신사 적립금"은 즉시 소멸되며, 탈퇴 후 재가입하더라도 소멸된 "무신사 적립금"은 복구되지 아니합니다.
				제15조(개인정보보호)
				① “회사”는 “이용자”의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.
				② “회사”는 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.
				③ “회사”는 “이용자”의 개인정보를 수집•이용하는 때에는 “이용자”에게 그 목적을 고지하고 동의를 받습니다.
				④ “회사”는 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용•제공단계에서 “이용자”에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.
				⑤ “회사”가 제2항과 제3항에 의해 “이용자”의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 관련 법령이 규정한 사항을 미리 명시하거나 고지해야 하며 “이용자”는 언제든지 이 동의를 철회할 수 있습니다.
				⑥ “이용자”는 언제든지 “회사”가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “회사”는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다.
				⑦ “회사”는 개인정보 보호를 위하여 “이용자”의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 “이용자”의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 “이용자”의 손해에 대하여 모든 책임을 집니다.
				⑧ “회사”는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
				⑨ “회사”는 개인정보의 수집•이용•제공에 대해 “이용자”가 동의를 거절하는 경우 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집•이용•제공에 관한 “이용자”의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.
				제2장 통신판매서비스 제16조(구매신청 및 개인정보 제공 동의 등)
				“이용자”는 “몰” 상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “회사”는 “이용자”가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
				1. 재화 등의 검색 및 선택
				2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
				3. 약관 내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인
				4. 이 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
				5. 재화 등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
				6. 결제 방법의 선택 및 결제
				제17조(계약의 성립 등)
				① 재화 등의 매매계약은 “이용자”가 청약의 의사표시를 하고 이에 대해 “회사”가 승낙의 의사표시를 함으로써 체결됩니다.
				② “회사”는 제1항에 따른 승낙의 의사 표시는 “몰” 내에서 “이용자”에게 제공되는 팝업 기타 안내 화면, 전자문서 등을 통한 수신확인 통지의 방법으로 하며, 계약의 성립 시기는 수신확인 통지가 “이용자”에게 도달한 때로 합니다.
				③ “회사”의 승낙의 의사표시에는 “이용자”의 구매 신청에 대한 확인 및 판매 가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.
				④ 수신확인통지를 받은 “이용자”는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “회사”는 배송 시작 전에 “이용자”의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만, 이미 대금을 지불한 경우에는 제20조의 청약철회 등에 관한 규정에 따릅니다.
				⑤ 계약이 성립한 후 회사가 제6항 각 호의 사유를 발견한 경우 “회사”는 즉시 계약을 해제 또는 취소할 수 있으며, 계약 해제 또는 취소 시 회사는 회원이 상품 대금을 지급한 날로부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
				⑥ “회사”는 제16조에 따른 구매 신청에 대하여 다음 각 호에 해당하는 경우 구매 신청을 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
				1. 신청 내용에 허위, 기재 누락, 오기가 있는 경우
				2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 등을 구매하는 경우
				3. 제7조에 따라 회원 자격이 제한 또는 상실된 회원이 구매신청을 한 경우
				4. 기타 구매 신청에 승낙하는 것이 “회사”의 기술상 현저히 지장이 있다고 판단하는 경우
				제18조(재화 등의 공급)
				① “회사”는 ”이용자”가 청약을 한 날부터 7일 이내에 재화 등의 공급에 필요한 조치를 하여야 하고, “이용자”가 재화 등을 공급받기 전에 미리 재화 등의 대금을 전부 또는 일부 지급한 경우 “이용자”가 그 대금을 지급한 날부터 3영업일 이내에 재화 등의 공급에 필요한 조치를 취합니다.
				② “회사”는 “이용자”가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 안내합니다.
				제19조(환급) “회사”는 “이용자”가 청약을 한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 “이용자”에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. 제20조(청약철회 등)
				① “회사”와 재화 등의 구매에 관한 계약을 체결한 “이용자”는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 해당 계약에 대한 청약의 철회 및 계약의 해제(이하 “청약철회 등”)를 할 수 있습니다. 다만, 청약철회 등에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.
				② “이용자”는 다음 각 호의 어느 하나에 해당하는 경우에는 “회사”의 의사에 반하여 청약철회 등을 할 수 없습니다.
				1. “이용자”에게 책임 있는 사유로 재화 등이 멸실되거나 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외합니다)
				2. “이용자”의 사용 또는 일부 소비로 재화 등의 가치가 현저히 감소한 경우
				3. 시간이 지나 다시 판매하기 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
				4. 복제가 가능한 재화 등의 포장을 훼손한 경우
				5. 용역 또는 디지털콘텐츠의 제공이 개시된 경우. 다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 아니한 부분에 대하여는 그러하지 아니합니다.
				6. “이용자”의 주문에 따라 개별적으로 생산되는 재화 등으로 사전에 해당 거래에 대해 별도로 그 사실을 고지하고 소비자의 동의를 받은 경우
				③ “회사”가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명시하거나 시용 상품을 제공하는 등의 조치를 하지 않은 경우 제2항제2호부터 제5호의 규정에도 불구하고 “이용자”의 청약철회 등이 제한되지 않습니다.
				④ “이용자”는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 해당 재화 등을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
				제21조(청약철회 등의 효과)
				① “회사”는 “이용자”로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “회사”가 “이용자”에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
				② “회사”는 위 대금을 환급함에 있어서 “이용자”가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 해당 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
				③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 “이용자”가 부담합니다. “회사”는 “이용자”에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “회사”가 부담합니다.
				④ “이용자”가 재화 등을 제공받을 때 발송비를 부담한 경우에 “회사”는 청약철회 시 그 비용을 누가 부담하는지를 “이용자”가 알기 쉽도록 명확하게 표시합니다.
				제22조(긴급조치)
				① “회사”는 “이용자”가 위법, 불법, 타인의 권리 침해 그 밖에 부당한 목적을 위해 서비스를 이용한다고 판단하는 경우 그 “이용자”와 관련된 물품의 수취나 배송을 거절할 권리를 가집니다.
				② “회사”가 제공하는 재화 등이 관할 관청 또는 당국에 의해 제재를 받았을 때 "회사"는 해당 재화 등을 관할 관청 또는 당국에 인도하는 것을 원칙으로 합니다. 이로 인하여 “이용자”가 손해를 입었다고 할지라도 해당 손해에 대해서 "회사"는 일체의 책임을 지지 않으며 또한 “이용자”는 해당 물품에 대한 서비스 이용요금 및 관련비용 등의 지급의무를 면하지 아니합니다.
				③ "회사"의 주소로 배송된 물품에 악취, 액체 누수 등 그 밖에 정당한 사유가 있다고 인정이 되어 긴급을 필요로 하는 경우 "회사"는 “이용자”에게 해당 사실을 통지하고 해당 물품을 별도 장소로 이동 보관하는 등 임시조치를 취할 수 있습니다. 이로 인해 발생하는 추가비용은 “이용자”가 부담하여야 하며 또한 “이용자”에게 손해가 발생하더라도 해당 손해에 대하여 책임을 지지 않습니다.
				제3장 통신판매중개서비스 제23조(서비스의 이용 및 책임의 제한)
				① 통신판매중개서비스와 관련하여 “회사”는 통신판매중개자로서 “이용자”와 “판매자” 간의 자유로운 재화 등의 거래를 위한 시스템을 운영, 관리 및 제공하며 “이용자”는 재화 등을 구매하기 전에 반드시 “판매자”가 “몰” 내에 작성한 재화 등의 상세 내용과 거래 조건을 확인해야 합니다.
				② “회사”는 관련 법령에 따라 “회사”가 부담해야하는 책임 및 “몰”의 운영 및 관리 책임을 부담하고, “몰”에서의 “판매자”와 “이용자” 간의 재화 등의 거래와 관련하여 “이용자” 또는 “판매자”를 대리하지 아니하며, “이용자”와 “판매자” 간 재화 등의 거래에 대한 위험과 책임은 거래 당사자가 부담합니다.
				③ “회사”는 관련 법령에 따라 “회사"가 책임을 부담하는 경우를 제외하고는 “몰”에서의 “판매자”와 “이용자” 간의 상품 거래와 관련하여 거래당사자의 판매 의사 또는 구매 의사의 존부 및 진정성, 상품의 품질, 완전성, 안정성, 적법성 및 타인의 권리에 대한 비침해성, “판매자”가 제공하거나 등록한 정보 및 자료의 진실성 또는 적법성 등을 보증하지 아니하며, “이용자”와 “판매자” 간의 상품 거래에 관한 위험과 책임은 거래 당사자가 부담합니다.
				제24조(계약의 성립 등)
				① 통신판매중개서비스와 관련하여, 재화 등의 매매계약은 “이용자”가 “판매자”의 계약 조건에 응하여 청약의 표시를 하고 이에 대해 “판매자”가 승낙의 의사표시를 함으로써 체결됩니다.
				② 청약의 승낙 방법과 내용, 계약 성립의 시기, 의사의 불일치에 따른 조치 등은 제16조의 규정을 준용하며, 이 때 “회사”는 “판매자”로 봅니다.
				제25조(재화 등의 공급)
				① “회사”는 “이용자”의 대금 결제에 대한 확인 통지를 받은 날로부터 3영업일 이내에 “판매자”에게 배송에 필요한 조치를 취하도록 안내합니다.
				② 재화 등의 배송과 관련하여 “이용자”과 “판매자”, 배송업체, 금융기관 등 사이에 분쟁이 발생하는 경우 당사자들 간에 해결하는 것을 원칙으로 하며, 이와 관련하여 “회사”의 고의 또는 중대한 과실이 없는 한 “회사”는 어떠한 책임도 부담하지 않습니다.
				③ “이용자”가 재화 등의 배송완료일로부터 7일 이내에 교환 또는 반품에 대한 의사표시를 하지 않으면 “회사”는 “이용자”에게 해당 거래에 대하여 구매 확정의 의사가 있는 것으로 간주하고 배송상태를 자동으로 배송 완료로 전환할 수 있습니다. 단, “이용자”는 실제로 재화 등을 수령하지 못한 경우 미수취신고를 할 수 있습니다.
				제26조(청약철회 등)
				① “회사”는 “이용자”로부터 청약철회 등의 의사표시를 받은 경우 즉시 그 사실을 “판매자”에게 통보합니다.
				② 청약철회 등에 필요한 배송비 및 기타 비용은 귀책사유가 있는 당사자가 부담합니다. 이 경우 재화 등의 하자 또는 오배송으로 인한 철약철회 등은 “판매자”가 그 비용을 부담하고, “이용자”의 단순 변심으로 인한 청약철회 등은 “이용자”가 그 비용을 부담합니다.
				③ “이용자”의 청약철회 등의 신청에 대하여 “판매자”가 자신의 업무를 이행하지 않거나 이를 지연하는 경우 “회사”는 “이용자”의 청약철회 등이 제20조에 따라 정당한 것인지 확인하고, 정당한 경우 해당 거래를 취소하는 한편 결제대금을 “이용자”에게 환불할 수 있습니다.
				④ 이외에 청약철회의 조건, 제한의 사유 및 관련 표시 등은 제20조의 규정을 준용하며, 이 때, “회사”는 “판매자”로 봅니다.
				제27조(금지행위) “이용자”는 “회사”가 제공하는 서비스를 이용하지 아니하고 “판매자”와 직접 거래하는 행위를 할 수 없습니다. 이 경우 직접 거래를 통해 발생한 문제에 대한 책임은 거래 당사자에게 있으며, “회사”는 어떠한 책임도 부담하지 않습니다. 제28조(분쟁의 해결)
				① “회사”는 “이용자”가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치 · 운영합니다.
				② “회사”는 “이용자”로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 “이용자”에게 그 사유와 처리일정을 즉시 통보합니다.
				③ “회사”와 “이용자” 간에 발생한 전자상거래 분쟁과 관련하여 “이용자”의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시 · 도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
				④ “회사”는 “이용자”와 “판매자” 간에 발생하는 분쟁을 객관적이고 원활하게 조정하기 위해 분쟁조정기구를 운영합니다.
				⑤ “이용자”는 분쟁조정기구의 조정에 신의칙에 입각하여 성실히 응해야 합니다.
				제4장 기타 사항 제29조(저작권의 귀속 및 이용제한)
				① “회사“가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 ”회사“에 귀속합니다.
				② “이용자”는 “ 몰”을 이용함으로써 얻은 정보 중 “회사”에게 지적재산권이 귀속된 정보를 “회사”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
				③ “이용자”가 “회사”의 서비스를 이용하면서 작성한 상품평, Q＆A 등 게시물의 저작권은 해당 “이용자” 본인에게 있으며, 해당 게시물이 타인의 저작권 및 기타 지적재산권을 침해하는 경우 그에 대한 책임은 “이용자” 본인이 부담합니다.
				④ “회사”는 게시물이 다음 각 호의 어느 하나에 해당하는 경우, 사전 통보 없이 해당 게시물을 삭제하거나 다른 “이용자”가 볼 수 없도록 임시조치를 취할 수 있습니다. 단, “회사”는 게시물이 단순히 “회사” 또는 “판매자”에게 불리하다는 이유만으로 삭제 또는 임시조치를 취하지 않습니다.
				1. 대한민국 법령을 위반하는 내용을 포함하는 경우
				2. 관계법령에 의해 판매가 금지된 불법제품 또는 음란물을 게시하거나 광고하는 경우
				3. 허위 또는 과장광고의 내용을 포함하는 경우
				4. 타인의 권리, 명예, 신용 및 기타 정당한 권리를 침해하는 경우
				5. 직거래 유도 또는 다른 사이트의 링크를 게시하는 경우
				6. 정보통신기기의 오작동을 일으킬 수 있는 악성코드, 데이터 등을 포함하는 경우
				7. 사회 공공질서 및 미풍양속에 위배되는 경우
				8. “회사”가 제공하는 서비스의 원활한 운영을 방해하는 것으로 판단되는 경우
				9. 범죄행위와 관련된 내용을 포함하는 경우
				10. 정치, 경제적 분쟁을 야기하는 내용을 포함하는 경우
				⑤ “회사”는 제3항에 따라 “이용자”가 작성한 게시물을 “몰”에서 거래되는 상품의 판촉, 홍보 등을 위해 사용할 수 있으며, "회사"가 운영하는 웹 사이트 등에 복제,배포,전송,전시 할 수 있으며, 본질적인 내용을 변경하지 않는 범위 내에서 수정, 편집, 번역 할 수 있습니다. “회사”는 “이용자”의 게시물을 사용하는 경우 해당 “이용자”에게 그 사실을 통보합니다.
				제30조(재판권 및 준거법)
				① “회사”와 “이용자” 간에 발생한 전자상거래 분쟁에 관한 소송은 민사소송법에 따라 그 관할법원을 정합니다.
				② “회사”와 “이용자” 간에 제기된 전자상거래 소송에는 대한민국의 법률을 적용합니다.
				이 이용약관은 2022년 11월 7일 부터 시행합니다.</div>
			<br>
			<label>
				<input type="checkbox" class="required-checkbox" id="p2" data-id="개인정보 수집 및 이용">
				[필수] 개인정보 수집 및 이용 동의
			</label>
			<a class="details-link" data-details="개인정보 수집 및 이용 동의">자세히</a>
			<div class="details">(주)GGA MOVIE는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 처리하는데 최선을 다하고 있습니다. 아래의 내용을 확인 후 동의하여 주시기 바랍니다.
				유형	구분	수집 및 이용 목적	수집 및 이용 항목	보유 및 이용 기간
				필수	상품구매	• 서비스 및 상품 제공에 관한 계약 이행 및 요금정산
				• 고객 상담 및 불만, 민원 사무 처리
				• 판매자와 구매자간 거래의 원활한 진행, 본인 의사의 확인
				• 상품∙서비스 이용 실적 정보 통계∙분석
				• 상품∙서비스 개선 및 추천, 불법∙부정 이용 방지	구매자 정보(이름, 이메일, 휴대폰번호, 전화번호, 공동현관 비밀번호), 수령자 정보(이름, 전화번호, 휴대폰 번호, 주소)	• 이용 목적 달성 시 지체 없이 파기합니다.
				• 내부 방침에 의해 서비스 부정 이용 기록은 부정 가입 및 이용 방지를 위하여 최대 1년간 보관 후 파기합니다.
				• 단,관계 법령에 따라 일정 기간 보존해야 하는 경우 해당 기간 보관 후 파기합니다.
				고객 상담	구매자 정보(이름, 이메일, 휴대폰번호, 전화번호, 배송지 주소, 상품 구매정보) (상품 수령자 상담 시)수령자 정보(이름, 전화번호, 휴대폰번호, 배송지 주소)
				현금 환불 요청	환불계좌 정보(은행, 계좌번호, 예금주)필수적인 개인정보 수집 및 이용에 동의하지 않을 권리가 있습니다. 다만, 동의하지 않을 경우 서비스 이용이 제한됩니다.</div>
			<br>
			<label>
				<input type="checkbox" class="required-checkbox" id="p3" data-id="개인정보 제 3자 제공">
				[필수] 개인정보 제 3자 제공 동의
			</label>
			<a class="details-link" data-details="개인정보 제 3자 제공 동의">자세히</a>
			<div class="details">(주)GGA MOVICE는 서비스 및 상품을 구매하고자 할 경우 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래 이행을 위하여 판매자에게 아래와 같이 개인정보를 제공하고 있습니다. 아래의 내용을 확인 후 동의하여 주시기 바랍니다.
				유형	제공 받는 자	제공 목적	제공 항목	보유 및 이용 기간
				필수	주식회사 GGA MOVIE	• 주문 상품 및 서비스의 제공, 계약 이행
				• 고객 상담 및 불만, 민원 사무 처리	구매자 정보(아이디, 이름, 전화번호, 휴대폰 번호, 이메일, 상품 구매정보) 수령자 정보(이름, 전화번호, 휴대폰 번호, 배송지 주소)	• 상품 구매/배송/반품 서비스 처리 완료 후 180일간 보관 후 파기
				• 단,관계 법령에 따라 일정 기간 보관해야 하는 항목은 해당 기간 보관 후 파기합니다.필수적인 개인정보 수집 및 이용에 동의하지 않을 권리가 있습니다. 다만, 동의하지 않을 경우 서비스 이용이 제한됩니다.</div>
			<br>
			<label>
				<input type="checkbox" class="required-checkbox" id="p4" data-id="전자결제대행 이용">
				[필수] 전자결제대행 이용 동의
			</label>
			<a class="details-link" data-details="전자결제대행 이용 동의">자세히</a>
			<div class="details">[토스페이먼츠]
				전자금융거래 기본약관(이용자용)
				제1조 (목적)
				이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 토스페이먼츠 주식회사(이하 '회사'라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.
				제2조 (용어의 정의)
				이 약관에서 정하는 용어의 정의는 다음과 같습니다.
				① 전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 구성원과 직접 대면하거나 의사소통을 하지 아니하고 전산화된 방식으로 이를 이용하는 거래를 말합니다.
				② '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
				③ ‘결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
				④ '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.
				⑤ '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
				⑥ '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.
				⑦ '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
				제3조 (약관의 명시 및 변경)
				① 회사는 이용자가 전자지급결제대행 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
				② 회사는 이용자의 요청이 있는 경우 서면제공 방식 또는 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
				③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
				④ 이용자는 제3항의 규정에 따른 약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전의 영업일까지 전자금융거래의 계약을 해지할 수 있습니다. 전단의 기간 안에 이용자가 약관의 변경내용에 대하여 이의를 제기하지 아니하는 경우에는 약관의 변경을 승인한 것으로 봅니다.
				제4조 (전자지급결제대행서비스의 종류)
				회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
				① 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통한 신용카드 지불정보의 송,수신 및 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
				② 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
				③ 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
				④ 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'KT전화(ARS,폰빌)결제대행서비스', '상품권결제대행서비스'등이 있습니다.
				제5조 (결제대금예치서비스의 내용)
				① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
				② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
				③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
				④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
				⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
				제6조 (접근매체의 선정, 관리 등)
				① 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
				② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
				③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
				④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
				제7조 (회사의 책임)
				① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 접근매체를 제3자에게 대여하거나 그 사용을 위임한 경우 또는 양도나 담보의 목적으로 제공한 경우, 회사가 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 사고가 발생한 경우, 이용자가 제6조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				③ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
				제8조 (거래내용의 확인)
				① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 전자적양식, 모사전송, 서면 등의 방법으로 거래내용에 관한 서면을 교부합니다. 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 인터넷 등을 이용하여 즉시 그 사유를 알리고, 그 사유가 종료된 때부터 이용자가 거래내용을 확인할 수 있도록 하여야 합니다.
				② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 가맹점에 대한 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항은 제공하는 거래내용에서 제외됩니다.
				③ 이용자가 본조 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
				주소 : 서울특별시 강남구 테헤란로 131 한국지식재산센터 15층 토스페이먼츠 주식회사
				이메일 주소 : support@tosspayments.com
				전화번호 : 1544-7772
				제9조 (오류의 정정 등)
				① 이용자는 전자지급결제대행 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
				② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
				③ 이용자는 다음의 주소 및 전화번호로 본 조항상의 정정 요구를 할 수 있습니다.
				주소 : 서울특별시 강남구 테헤란로 131 한국지식재산센터 15층 토스페이먼츠 주식회사
				이메일 주소 : support@tosspayments.com
				전화번호: 1544 - 7772
				④ 회사는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 오류가 있음을 안 날부터 2주 이내에 오류의 원인과 처리 결과를 이용자에게 알려 드립니다.
				제10조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
				① 회사는 이용자가 전자지급결제대행 서비스 이용거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
				② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.
				제11조 (거래지시의 철회 제한)
				① 이용자가 전자지급거래를 한 경우, 지급의 효력은 ‘전자금융거래법’ 제13조 각호의 규정에 따릅니다.
				② 이용자는 ‘전자금융거래법’ 제13조 각호의 규정에 따라 지급의 효력이 발생하기전까지 거래지시를 철회할 수 있습니다. 단, 금융기관, 이동통신사 등의 규정에 의거 거래지시의 철회가 제한될 수 있습니다.
				③ 전자지급수단별 거래지시의 철회 방법 및 제한 등은 다음 각호와 같습니다.
				신용카드결제, 계좌이체결제, 가상계좌결제 : 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령에서 정한 바에 따라 재화의 구입 또는 용역의 이용 거래에서의 청약의 철회 등을 한 경우에 한하여 철회가 가능합니다.
				휴대폰결제, KT전화(ARS,폰빌)결제: 전 가호의 방법에 따른 청약철회 요청건 중 이동통신사의 규정에 의거 결제일 해당월 말일까지 발생한 거래건에 한하여 철회가 가능합니다.
				상품권결제: 전 가호의 방법에 따른 청약철회 요청 건 중 시스템 장애 등으로 정상적인 서비스를 이용하지 못한 경우에 한하여 결제일로부터 10일 이내 청약 철회가 가능합니다.
				제12조 (추심이체의 출금 동의 및 철회)
				① 회사는 이용자의 요청이 있는 경우 이용자의 계좌가 개설되어 있는 금융회사 등이 추심이체를 실행할 수 있도록 금융회사 등을 대신하여 전자금융거래법령 등 관련 법령에 따른 방법으로 출금에 대한 동의를 진행합니다.
				② 회사는 전 항에 따른 이용자의 동의 사항을 추심 이체를 실행하는 해당 금융회사 등에 제출합니다.
				③ 이용자는 이용자의 계좌의 원장에 출금기록이 끝나기 전까지 회사 또는 해당 금융회사 등에 제1항의 규정에 따른 동의의 철회를 요청할 수 있습니다.
				④ 전 항에도 불구하고 회사 또는 금융회사 등은 대량으로 처리하는 거래 또는 예약에 따른 거래 등의 경우에는 미리 이용자와 정한 약정에 따라 동의의 철회시기를 달리 정할 수 있습니다.
				⑤ 이용자가 제3항에 따라 출금 동의 철회를 요청한 경우, 이용자는 출금 동의 철회 요청 이후 발생한 출금에 대해서 제14조 제1항의 담당자에게 이의를 제기할 수 있습니다. 다만, 본 조항은 동의 철회요청 이전에 발생한 출금에 대해서는 적용되지 않습니다.
				제13조 (전자금융거래정보의 제공금지)
				회사는 전자지급결제대행서비스 및 결제대금예치서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공,누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, ‘금융실명 거래 및 비밀 보장에 관한 법률’ 제4조 제1항 단서의 규정에 따른 경우 그 밖의 다른 법률에서 정하는 바에 따른 경우에는 그러하지 아니합니다.
				제14조 (분쟁처리 및 분쟁조정)
				① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자지급결제대행 서비스 및 결제대금예치서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
				담당자 : 토스페이먼츠 RM(리스크)팀
				연락처 : 전화번호 1544-7772, 팩스 02-6919-2354
				이메일 : rm@tosspayments.com
				② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
				③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제35조 제1항의 규정에 따른 소비자원에 회사의 전자지급결제대행서비스 및 결제대금예치서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
				제15조 (회사의 안정성 확보 의무)
				회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
				제16조 (이용시간)
				① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 변경될 수 있습니다.
				② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.
				제17조 (약관외 준칙 및 관할)
				① 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
				② 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.



				[엔에이치엔한국사이버결제]
				전자금융거래 기본약관
				제1조 (목적)
				이 약관은 엔에이치엔한국사이버결제 주식회사(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
				제2조 (용어의 정의)
				이 약관에서 정하는 용어의 정의는 다음과 같습니다.
				1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
				2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
				3. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
				4. ‘가맹점’이라 함은 금융기관 또는 전자금융업자와의 계약에 따라 직불전자지급수단이나 선불전자지급수단 또는 전자화폐에 의한 거래에 있어서 이용자에게 재화 또는 용역을 제공하는 자로서 금융기관 또는 전자금융업자가 아닌 자를 말합니다.
				5. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
				6. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
				7. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
				8. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
				제3조 (약관의 명시 및 변경)
				① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
				② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
				③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 경우에는 즉시 공지합니다.
				④ 이용자가 변경된 약관사항에 동의하지 않는 경우에는 서비스의 이용이 불가하며 이용자는 이용 계약을 해지할 수 있습니다.
				제4조 (전자지급결제대행서비스의 종류)
				회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
				1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
				2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
				3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
				4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이 있습니다.
				제5조 (결제대금예치서비스의 내용)
				① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
				② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
				③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
				④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
				⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
				제6조 (이용시간)
				① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
				② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.
				제7조 (접근매체의 선정과 사용 및 관리)
				① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
				② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
				③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
				④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
				제8조 (거래내용의 확인)
				① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영 장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알려야 하며, 거래내용을 제공할 수 없는 기간은 서면교부 기간에 산입하지 아니합니다.
				② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록 회사가 전자금융거래의 대가로 받은 수수료, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및 조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 보존하고, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항을 제공합니다.
				③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
				주소: 서울시 구로구 디지털로26길 72(구로동, NHN한국사이버결제)
				이메일 주소: help@kcp.co.kr
				전화번호: 1544-8667
				제9조 (오류의 정정 등)
				① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
				② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때 에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안 날부터 2주 이내에 그 결과를 이용자에게 문서, 전화 또는 전자우편으로 알려 드립니다.
				제10조 (가맹점의 준수사항 등)
				① 가맹점은 직불전자지급수단이나 선불전자지급수단 또는 전자화폐(이하 "전자화폐등"이라 한다)에 의한 거래를 이유로 재화 또는 용역의 제공 등을 거절하거나 이용자를 불리하게 대우하여서는 아니 됩니다.
				② 가맹점은 이용자로 하여금 가맹점수수료를 부담하게 하여서는 아니 됩니다.
				③ 가맹점은 다음 각 호의 어느 하나에 해당하는 행위를 하여서는 아니 됩니다.
				1. 재화 또는 용역의 제공 등이 없이 전자화폐등에 의한 거래를 한 것으로 가장(가장)하는 행위
				2. 실제 매출금액을 초과하여 전자화폐등에 의한 거래를 하는 행위
				3. 다른 가맹점 이름으로 전자화폐등에 의한 거래를 하는 행위
				4. 가맹점의 이름을 타인에게 빌려주는 행위
				5. 전자화폐등에 의한 거래를 대행하는 행위
				④가맹점이 아닌 자는 가맹점의 이름으로 전자화폐등에 의한 거래를 하여서는 아니 됩니다.
				제11조 (가맹점 모집 등)
				① 회사는 가맹점을 모집하는 경우에는 가맹점이 되고자 하는 자의 영업여부 등을 확인하여야 합니다. 다만, 「여신전문금융업법」 제16조의2의 규정에 따라 이미 확인을 한 가맹점인 경우에는 그러하지 아니합니다.
				② 회사는 다음 각 호의 사항을 금융위원회가 정하는 방법에 따라 가맹점에 알려야 합니다.
				1. 가맹점수수료
				2. 제2항의 규정에 따른 가맹점에 대한 책임
				3. 전조 규정에 따른 가맹점의 준수사항
				③ 회사는 가맹점이 전조의 규정을 위반하여 형의 선고를 받거나 관계 행정기관으로부터 위반사실에 대하여 서면통보를 받는 등 대통령령이 정하는 사유에 해당하는 때에는 특별한 사유가 없는 한 지체 없이 가맹점계약을 해지하여야 합니다. ‘대통령령이 정하는 사유’라 함은 다음 각 호의 어느 하나에 해당하는 경우를 말합니다.
				1. 가맹점이 전자금융거래법 제 26조 또는 전조 제3항 제3호 내지 제5호를 위반하여 형을 선고받은 경우
				2. 가맹점이 전조 제1항, 제2항 또는 제3항 제3호 내지 제5호를 위반한 사실에 관하여 관계 행정기관으로부터 서면통보가 있는 경우
				3. 관계 행정기관으로부터 해당 가맹점의 폐업사실을 서면으로 통보 받은 경우
				제12조 (회사의 책임)
				① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다.
				③ 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서 이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지 아니합니다.
				④ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제 2조 제 1항 제 1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 다음과 같은 경우 회사는 이용자에 대하여 일부 또는 전부에 대하여 책임을 지지 않습니다.
				1. 회사가 접근매체에 따른 확인 외에 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 전자금융거래법 제9조 제1항 제3호에 따른(이하 ‘사고’라 한다)사고가 발생한 경우.
				2. 이용자가 동항 제 1호의 추가적인 보안조치에서 사용되는 매체, 수단 또는 정보에 대하여 다음과 같은 행위를 하여 사고가 발생하는 경우
				가. 누설, 누출 또는 방치한 행위
				나. 제 3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위
				제13조 (전자지급거래계약의 효력)
				① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
				② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
				제14조 (거래지시의 철회)
				① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 다음의 주소, 전자우편 및 연락처에 연락을 취함으로써 거래지시를 철회할 수 있습니다.
				주소: 서울시 구로구 디지털로26길 72(구로동, NHN한국사이버결제)
				이메일 주소: help@kcp.co.kr
				전화번호: 1544-8667
				② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
				③ 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제5조에서 정한 바에 따라 결제대금을 반환받을 수 있습니다.
				제15조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
				① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
				② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.
				제16조 (전자금융거래정보의 제공금지)
				회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, 통신비밀보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 의하여 적법한 절차에 따르는 경우에는 그러하지 아니합니다.
				제17조 (계약해지 및 이용제한)
				① 이용자는 서비스 홈페이지 또는 고객센터를 통하여 서비스 계약을 해지할 수 있습니다.
				② 회사는 이용자가 본 약관의 의무를 이행하지 않을 경우 사전 통지 없이 즉시 서비스 이용계약을 해지하거나 서비스 이용을 제한할 수 있습니다. 회사의 조치에 대하여 이의가 있는 경우에는 서비스 홈페이지 또는 고객센터를 통하여 이의신청을 할 수 있습니다.
				③ 전 항의 이의가 정당하다고 판단되는 경우 회사는 서비스의 이용을 즉시 재개합니다.
				제18조 (분쟁처리 및 분쟁조정)
				① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
				담당자: RM팀
				연락처(전화번호, 전자우편주소) : 070-5075-8041, minwon@kcp.co.kr
				② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
				③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제33조의 규정에 따른 한국소비자원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
				제19조 (회사의 안정성 확보 의무)
				회사는 전자금융거래가 안전하게 처리될 수 있도록 선량한 관리자로서의 주의를 다하며 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
				제20조 (약관 외 준칙 및 관할)
				① 회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.
				② 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
				③ 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
				부칙 < 제 1 호, 2006.12.26. >
				본 약관은 2007년 1월 1일부터 시행한다

				부칙 < 제 2 호, 2011.01.17. >
				본 약관은 2011년 02월 21일부터 시행한다.
				(제 2조 4항 신설, 제 8조 2항 일부 개정, 제 10조 신설, 제11조 신설)

				부칙 < 제 3 호, 2015.10.14. >
				본 약관은 2015 10월 14일부터 시행한다
				(제 17조 제1항 일부 개정, 제 12조 제 5항 신설)

				부칙 < 제 4 호, 2016.04.08. >
				본 약관은 2016년 4월 26일부터 시행한다
				(제 1조 일부 개정, 제 8조 제 3항 일부 개정)

				부칙 < 제 5 호, 2016.11.11. >
				본 약관은 2016 11월 21일부터 시행한다
				(제 17조 신설, 제3조 제3항 및 제4항, 제9조 제2항, 제14조 제1항, 제16조, 제18조 제3항 일부 개정)

				부칙 < 제 6 호, 2016.11.28. >
				본 약관은 2016 11월 28일부터 시행한다
				(제12조 제1항 삭제, 제6조 제2항, 제8조 제1항 및 제2항, 제9조 제2항, 제19조 개정, 제20조 제1항 신설)



				부칙 < 제 7 호, 2018.01.19. >
				본 약관은 2018년 02월 22일부터 시행한다
				(제12조 제1항, 제2항 일부 개정)

				부칙 < 제 8 호, 2018.07.23. >
				본 약관은 2018년 07월 31일부터 시행한다
				(제18조 제1항 일부 개정)

				부칙 < 제 9 호, 2018.11.15. >
				본 약관은 2018년 12월 20일부터 시행한다
				(제8조 제3항, 제14조 제1항 개정)

				부칙 < 제 10 호, 2019.05.21. >
				본 약관은 2019년5월 31일부터 시행한다
				(제8조 제3항, 제14조 제1항 개정)



				[헥토파이낸셜]
				전자금융거래 이용약관
				제1조 (목적)
				이 약관은 헥토파이낸셜(주) (이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스, 선불전자지급수단의 발행 및 관리 서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
				제2조 (용어의 정의)
				이 약관에서 정하는 용어의 정의는 다음과 같으며, 본 조에서 정한 것을 제외하고는 전자금융거래법 등 관련법령이 정한 바에 의합니다.
				1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스, 선불전자지급수단의 발행 및 관리 서비스 및 결제대금예치서비스 등(이하 '전자금융거래 서비스' 또는 ‘서비스’라고 합니다)을 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
				2. ‘전자지급수단’이라 함은 선불전자지급수단, 신용카드 등 전자금융거래법 제2조 제11호에서 정하는 전자적 방법에 따른 지급수단을 말합니다.
				3. ‘전자지급거래’라 함은 지급인이 전자지급수단을 이용하여 수취인에게 자금을 이동하게 하는 전자금융거래를 통칭합니다.
				4. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
				5. ‘선불전자지급수단’이라 함은 회사가 운영하는 웹사이트 및 제휴사 서비스 등에서 재화 또는 용역(이하 ‘재화 등’이라고 합니다)을 구매할 수 있는 헥토파이낸셜 머니 등과 같이 회사가 발행 당시 미리 회원에게 공지한 전자금융거래법 상 선불전자지급수단을 말합니다.
				6. ‘충전’이라 함은 선불전자지급수단의 일정액을 확보하기 위해 회사가 지정한 지불수단을 통해 선불전자지급수단을 구매하거나, 회사 또는 회사가 지정한 제3자의 서비스 등(이하 ‘서비스 등’이라 합니다)에서의 활동을 통해 선불전자지급수단을 적립 받는 것을 말합니다.
				7. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
				8. '자동이체서비스'라 함은 ‘전자지급결제대행서비스’의 지급결제수단을 이용하여 이용자가 약정한 일자에 물품 및 용역대금의 납부가 자동으로 이루어지도록 하는 서비스를 말합니다.
				9. '자동이체납부기관' (이하 “납부기관”이라 한다)이라 함은 이용자와 상품 또는 용역의 공급 계약을 맺고 ‘회사’를 통해 자동이체서비스 대금을 받는 자를 말합니다.
				10. '이용자'라 함은 본 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
				11. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다 ), '전자서명법' 상의 인증서 , 회사에 등록된 이용자번호 , 이용자의 생체정보 , 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제 2 조 제 10 호에서 정하고 있는 것을 말합니다.
				12. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
				13. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
				제3조 (약관의 명시 및 변경)
				① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
				② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
				③ 회사가 이 약관을 변경하고자 하는 경우에는 변경 1개월 전에 그 내용을 서비스 화면 또는 홈페이지 등 전자적 장치에 게시하고 이용자에게 전자 우편 혹은 PUSH, 알림톡 등을 통지하여야 합니다. 다만, 이용자가 이의를 제기할 경우 회사는 이용자에게 적절한 방법으로 약관 변경내용을 통지하였음을 확인해 주어야 합니다.
				④ 제3항에도 불구하고 법령의 개정으로 인하여 긴급하게 약관을 변경한 때에는 변경된 약관을 서비스 화면 또는 홈페이지에 1개월 이상 게시하고 이용자에게 전자 우편 혹은 PUSH, 알림톡 등을 통해 사후 통지합니다.
				⑤ 회사는 제3항의 공지를 할 경우 "이용자가 변경에 동의하지 아니한 경우 공지한 날로부터 30일 이내에 계약을 해지할 수 있으며, 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 본다"라는 취지의 내용을 고지하거나 통지합니다.
				제4조 (전자지급 결제대행서비스의 종류)
				회사가 제공하는 전자지급 결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
				1. 신용카드 결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
				2. 계좌이체 대행서비스: 이용자의 지급지시 또는 출금동의에 따라 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 이용자의 계좌에서 원하는 계좌로 이체하는 서비스를 말하며, 간편현금결제서비스, 간편계좌이체서비스 등도 이에 해당합니다.
				3. 가상계좌 서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
				4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이 있습니다.
				제5조 (선불전자지급수단의 충전 및 이용)
				① 이용자는 계좌출금, 기타 회사가 정하는 지불수단으로 선불전자지급수단을 구매하거나, 서비스 등에서의 활동으로 회사 또는 회사의 제휴사로부터 적립 받아 선불전자지급수단을 충전할 수 있습니다.
				② 회사가 지정한 지불 수단을 통한 선불전자지급수단 구매는 제1항에서 규정하는 지불 수단별로 지정된 금액으로 충전을 할 수 있으며, 지불 수단에 따라 자체 제한금액이 있을 수 있습니다.
				③ 이용자는 회사가 정한 기한 및 이용방법에 따라 선불전자지급수단을 이용할 수 있으며, 회사는 그 구체적인 사항을 본 약관 또는 선불전자지급수단 관련 서비스 페이지를 통해 공지합니다.
				④ 이용자는 서비스 등에서 재화 등을 구매할 때 선불전자지급수단을 지불 수단으로 사용할 수 있습니다.
				⑤ 선불전자지급수단은 재화 등의 구매완료 시점에 즉시 차감됩니다.
				⑥ 이용자가 선불전자지급수단을 사용하는 경우 서비스 등에서 적립 받은 무상의 선불전자지급수단(이하 ‘적립선불’이라고 합니다), 이용자가 구매한 선불전자지급수단(이하 ‘구매선불’이라고 합니다)의 순서로 차감합니다.
				⑦ 이용자가 선불전자지급수단을 사용한 재화 등의 구매를 취소하는 경우 회사는 재화 등 구매시 사용한 선불전자지급수단을 재충전하는 것을 원칙으로 합니다.
				제6조 (선불전자지급수단의 유효기간 및 환불)
				① 개별 선불전자지급수단을 마지막으로 이용한 날 로부터 일백이십(120) 개월이 경과하는 동안 해당 선불전자지급수단을 한번도 적립하거나 사용하지 않은 경우 이용자가 충전한 해당 선불전자지급수단은 자동소멸됩니다.
				② 회사는 전항에 따른 선불전자지급수단의 유효기간이 도래하기 7일전 통지를 포함하여 3회 이상 이용자에게 유효기간의 도래, 유효기간의 연장 가능여부와 방법 등을 이메일 등의 방법으로 통지하여야 한다.
				③ 이용자는 회사에게 유효기간 내에는 유효기간의 연장을 요청할 수 있고, 요청을 받은 회사는 특별한 사유가 없는 한 유효기간을 3개월 연장한다.
				④ 본 약관에 대한 동의를 철회하는 경우 적립선불은 소멸되어 환급이 불가능합니다.
				⑤ 이용자는 보유 중인 선불전자지급수단의 환급을 회사에 요구할 경우 구매선불 전액을 환급 받을 수 있습니다. 다만, 회사로부터 무상 제공받은 적립선불의 경우 환급 대상에서 제외됩니다.
				⑥ 다음 각 호의 경우에는 구매선불의 잔액 전부를 환급합니다.
				1. 천재지변 등의 사유로 서비스 등에서 재화 또는 용역을 제공하기 곤란하여 선불전자지급수단을 사용하지 못하게 된 경우
				2. 선불전자지급수단의 결함으로 서비스 등에서 재화 또는 용역을 제공하지 못하는 경우
				3. 이용자가 구매선불 잔액의 환급을 요청하는 경우
				4. 본 약관에 대한 동의를 철회하는 경우
				⑦ 현금 환급은 이용자로부터 환급 신청이 접수된 후 이용자의 입금사실을 확인한 시점에서 제칠(7)영업일 이내에 이용자가 지정한 계좌로 현금 입금됩니다.
				⑧ 이용자는 회사에서 정한 기한 및 이용방법에 따라 선불전자지급수단을 이용할 수 있으며, 회사는 환급 등 구체적인 사항을 개별 선불전자지급수단의 고객센터 페이지를 통해 안내합니다.
				제7조 (선불전자지급수단의 금지사항 및 이용한도)
				① 이용자는 선불전자지급수단을 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
				② 회사는 선불전자지급수단에 대해 실지명의 당 최고 200만원을 그 보유 한도로 합니다. 단 보유 한도는 회사의 정책에 따라 감액될 수 있습니다.
				제8조 (결제대금예치서비스의 내용)
				① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본 조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
				② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
				③ 회사는 이용자가 재화 등을 공급받은 날부터 3 영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
				④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급 받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
				⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리, 의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
				제9조 (서비스 이용시간 및 제한사유)
				① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
				② 회사는 다음 각호 중 어느 하나에 해당하는 사유가 있는 경우 서비스의 제공을 일시적으로 중단하거나 제한할 수 있습니다.
				1. 컴퓨터 등 정보통신설비의 보수, 업그레이드, 점검, 교체, 고장, 통신장애, 해킹 등으로 정상적인 서비스 제공이 어려운 경우
				2. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우
				3. 이용자의 전산조작이나 업무처리의 오류 등으로 서비스 제공이 어려운 경우
				4. 천재지변, 국가비상사태 등 기타 불가항력적 사유가 발생한 경우
				③ 회사는 본 조 제2항의 사유로 서비스 중단이 불가피한 경우 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사후에 고지하거나 통지할 수 있습니다.
				제10조 (접근매체의 선정과 사용 및 관리)
				① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
				② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
				③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
				④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
				제11조 (거래내용의 확인)
				① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알려야하며, 거래내용을 제공할 수 없는 기간은 서면교부 기간에 산입하지 아니합니다.
				② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록, 회사가 전자금융거래의 대가로 받은 수수료, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및 조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용 시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 합니다.
				③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
				- 주소: (06220)서울시 강남구 테헤란로34길 6 태광타워 9~10층 헥토파이낸셜
				- 이메일 주소: pg@hecto.co.kr
				- 전화번호: 1600-5220
				제12조 (오류의 정정 등)
				① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
				② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
				제13조(착오송금에 관한 사항)
				① 이용자가 착오로 수취금융회사, 수취계좌번호 등을 잘못 기재하거나 입력하여 수취인에게 선불전자지급수단 등의 자금이 이동(이하 ‘착오송금’이라 합니다.)된 경우, 회사에 통지하여 회사 또는 수취 금융회사 등을 통해 수취인에게 연락하여 착오 송금액 반환을 요청할 수 있습니다.
				② 회사는 수취인에 대한 연락 사실, 수취인의 반환의사 유무, 수취인이 반환의사가 없는 경우 그 사유 등 이용자 요청사항에 대한 처리결과 또는 관련 처리 진행상황을 이용자가 전항의 ‘착오송금’ 발생사실을 회사에 통지한 날로부터 15일 이내에 이용자에게 알려야 합니다.
				③ 회사 또는 수취 금융회사를 통한 착오송금 반환 요청에도 수취인이 반환하지 않는 경우, 이용자는 ｢예금자보호법｣ 제5장(착오송금 반환지원)에 따라 예금보험공사에 착오송금 반환지원 제도 이용을 신청할 수 있습니다.(개정 ｢예금자보호법｣ 시행일인 ’21.7.6. 이후 발생한 착오송금에 대해 신청 가능) 단, 연락처를 통한 송금, SNS회원간 송금 거래 등 예금보험공사가 수취인의 실지명의를 취득할 수 없는 거래는 반환지원 신청이 제한됩니다.
				④ 회사는 예금보험공사가 착오송금 반환지원 업무의 원활한 수행을 위해 회사에 착오송금 수취인의 반환불가 사유, 실지명의, 주소 및 연락처, 착오송금 발생 현황 등의 자료를 요청하는 경우 정당한 사유가 없으면 이에 따라야 합니다.
				⑤ 이용자가 예금보험공사를 통해 착오송금 반환지원을 신청한 내역이 다음 각 호에 해당하는 경우 관련 법령에 따라 예금보험공사의 지원 절차가 중단될 수 있습니다.
				1. 이용자가 거짓이나 부정한 방법으로 반환지원을 신청한 경우
				2. 착오송금이 아님이 객관적인 자료로 확인되는 경우
				3. 신청일 이전 반환지원을 신청한 착오송금과 관련된 소송 등이 진행 중이거나 완료된 경우
				4. 그 밖에 예금보험위원회가 인정하는 경우
				제14조 (회사의 책임)
				① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우에는 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				③ 회사는 전자금융거래를 위한 전자적 장치 또는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률' 제2조 제1항 제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
				④ 회사는 관련 법령에서 정한 바에 따라 이용자의 정보를 관리하여야 하며, 이에 대한 세부적인 내용은 "회사"의 '개인정보보호방침'에 정한 바에 의합니다. 회사는 서비스 제공과 관련하여 알고 있는 이용자의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 관계법령에 의한 수사상의 목적으로 관계기관으로부터 요구 받은 경우나 정보통신윤리위원회의 요청이 있는 경우 등 법률의 규정에 따른 적법한 절차에 의한 경우에는 그러하지 않습니다.
				제15조 (전자지급거래계약의 효력)
				① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
				② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
				제16조 (거래지시 등의 철회)
				① 이용자는 전자지급거래에 관한 지급의 효력이 발생하기 전까지 거래지시 및 출금동의를 철회할 수 있습니다.
				② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때 (iii) 출금동의의 경우 수취인의 거래지시에 따라 지급인의 계좌의 원장에 출금기록이 끝난 때 (Ⅳ) 선불전자지급수단의 경우 이용자의 거래 지시된 금액의 정보가 수취인이 지정한 전자적 장치에 도달한 때를 말합니다.
				③ 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법에 따라 결제대금을 반환 받을 수 있습니다.
				제17조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
				① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
				② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제11조 제2항에서 정한 바에 따릅니다.
				제18조 (전자금융거래정보의 제공금지)
				회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 관계법령에 의하거나 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, 금융기관 또는 공공기관이 회사에게 이용자 거래정보를 요청할 경우 식별 불가능하게 처리하여 제공할 수 있습니다.
				제19조 (계약해지 및 이용제한)
				① 이용자는 회사의 전자금융거래 서비스를 해지하고자 할 경우, 회사가 정한 방법으로 해지신청을 하여야 합니다. 회사는 소정의 해지절차를 거쳐 이용계약을 해지합니다.
				② 회사는 이용자가 다음 각호의 어느 하나에 해당할 경우 사전 통지 없이 즉시 서비스 이용계약을 해지하거나 서비스 이용을 제한할 수 있습니다. 회사의 조치에 대하여 이의가 있는 경우에는 회사 홈페이지 또는 고객센터를 통하여 이의신청을 할 수 있습니다.
				1. 본 약관 제7조 제2항 또는 제3항의 의무를 이행하지 않을 경우
				2. 이용자가 본 약관을 위반한 사실이 밝혀진 경우
				3. 정당한 권한 없이 타인의 명의로 가입 또는 결제를 신청한 경우
				4. 회사의 서비스를 부정한 용도로 이용한 경우
				5. 신종 금융사기를 통해 개인정보 유출 사고가 발생한 경우
				6. 서비스 운영을 고의로 방해하는 경우
				7. 이용자가 관계법령 및 금융기관, 기타 결제수단 발행업자 또는 통신판매업자의 약관을 위반한 경우
				8. 관계법령이나 감독규정, 감독기관의 지침, 회사의 약관과 지침 등에 의해 서비스 제공이 현저히 어려운 경우
				③ 회사는 전 항의 이의가 정당하다고 판단되는 경우 회사는 서비스의 이용을 즉시 재개합니다.
				④ 회사는 이용자가 아래 각 호의 사유에 해당하는 경우 해당 이용자에게 전자우편 또는 기타 유효한 수단을 통해 통보하고, 이용 자격을 박탈하거나 선불전자지급수단의 사용을 일시적으로 제한할 수 있습니다.
				1. 회원 가입시 등록한 개인정보의 전부 또는 일부가 허위임이 밝혀지는 경우
				2. 타인의 명의나 개인정보를 도용하여 회원 가입 후 선불전자지급수단을 이용하는 경우
				3. 타인의 결제정보 등을 도용하거나 부정한 행위로 거래를 하는 경우
				4. 이용자의 접근매체를 매매하거나 양도하는 경우
				5. 결제수단을 제공하는 사업자가 지정한 방식으로 이용요금을 납부하지 않고 장기 연체하는 경우
				6. 다른 이용자의 선불전자지급수단 사용을 방해하거나, 회사의 선불전자지급수단 제공에 지장을 초래하는 경우
				7. 회사가 정한 기간 내에 사용제한 사유를 해소하지 못한 경우
				8. 기타 선불전자지급수단 관련한 법령을 위반하는 경우
				⑤ 제4항에 해당하는 회원은 해당 사유를 해소한 이후 회사의 승낙에 따라 선불전자지급수단을 다시 사용할 수 있습니다.
				제20조 (분쟁처리 및 분쟁조정)
				① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
				- 담당자: 고객센터
				- 전화번호: 1600-5220
				- 전자우편주소: in.help@hecto.co.kr
				② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
				③ 이용자는 회사의 분쟁처리 및 분쟁조정에 불만이 있는 경우 '금융감독기구의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자보호법' 제31조 제1항의 규정에 따른 소비자보호원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
				제21조 (회사의 안정성 확보 의무)
				회사는 는 전자금융거래가 안전하게 처리될 수 있도록 선량한 관리자로서의 주의를 다하며, 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
				제22조 (약관외 준칙 및 관할)
				① 회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.
				② 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
				③ 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
				[부칙] 본 약관은 2022년 09월 01일부터 시행한다.
				이전 약관은 홈페이지 (www.hectofinancial.co.kr) 에서 확인 가능합니다.



				[KICC]
				전자금융거래 기본약관
				제1조 (목적)
				이 약관은 한국정보통신 주식회사(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
				제2조 (용어의 정의)
				이 약관에서 정하는 용어의 정의는 다음과 같습니다.
				1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스 (이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
				2. '전자지급수단’이라 함은 전자자금이체, 직불전자지급수단, 선불전자지급수단, 전자화폐, 신용카드, 전자채권 그 밖에 전자적 방법에 따른 지급 수단을 말합니다.
				3. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
				4. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인
				시점까지 결제대금을 예치하는 서비스를 말합니다.
				5. '구매결정기간'이라 함은 이용자가 물품의 배송이 완료된 날로부터 본인이 구매하고자 하는 물품과 일치하는지 확인하는 3영업일의 기간을 말합니다.
				6. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
				7. '판매자'라 함은 재화 등을 공급하기 위해 예치대금을 확인하고 구매자의 환불 요청에 대하여 승인하는 자를 말하며 『전자상거래 등에서의 소비자 보호에 관한 법률』 제2조 제3호의 통신판매업자를 포함합니다.
				8. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), 『전자서명법』상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 『전자금융거래법』 제2조 제10호에서 정하고 있는 것을 말합니다.
				9. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
				10. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
				11. '정보통신망'이라 함은 전기통신설비를 이용하거나 전기통신설비와 컴퓨터 및 컴퓨터의 이용기술을 활용하여 정보를 수집·가공·검색·송신 또는 수신하는 정보통신체제를 말합니다.
				제 3조 (약관의 명시 및 변경)
				① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
				② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
				③ 회사가 이 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 또는 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 경우에는 변경 후 즉시 공지합니다.
				④ 회사는 제3항의 공지를 할 경우 “이용자가 변경에 동의하지 아니하는 경우, 회사가 공지한 날로부터 30일 이내에 계약을 해지할 수 있으며, 해지의 의사표시를 하지 아니한 경우 동의한 것으로 본다.”라는 내용을 포함합니다.
				제4조 (전자지급결제대행서비스의 종류)
				회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
				1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
				2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
				3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
				4. 간편결제서비스 : 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드, 계좌이체인 경우로서, 정보를 매번 입력할 필요 없이 관련 정보의 한번 등록만으로 상품 결제가 가능한 서비스를 말합니다. 단, 간편결제서비스 신청 시 회사가 정하는 이용자의 본인확인
				절차가 반드시 필요하며, 회사의 인증 및 승낙이 있어야 서비스를 이용할 수 있습니다.
				5. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스', '포인트결제대행서비스' 등이 있습니다.
				제5조 (결제대금예치서비스의 개시 및 종료 등)
				① 결제대금예치서비스 이용을 위한 별도의 회원가입 절차는 필요하지 않으며, 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본 조 및 제6조에서도 같습니다)가 판매자에게 물품 구매 시 동 서비스를 이용한 결제의사를 표시, 완료한 때 정당한 서비스 신청이 이루어진 것으로 합니다. 이 경우, 동 서비스의 수수료는 회사가 별도로 정하는 바에 따릅니다.
				② 이용자의 서비스 신청에 따른 회사의 결제대금예치서비스 제공 및 책임의 개시 시기는 이용자의 구매 관련 정보가 판매자 등을 통해 회사에 전달되고 대금결제가 다음 각 호와 같이 이루어진 시점으로 합니다.
				1. 현금 거래의 경우, 거래 대금이 사전에 이용자에게 고지된 회사 계좌로 입금된 시점
				2. 신용카드 거래의 경우, 카드사로부터 카드 승인정보를 회사가 수취하는 시점
				3. 기타 결제수단의 경우, 결제대금의 입금이나 결제를 회사가 인지하는 시점
				③ 결제대금예치서비스는 다음 각 호의 1에 해당하는 때에 종료됩니다.
				1. 이용자가 결제 후 주문한 물품에 대하여 정상적으로 수령을 완료하고 판매자에게 대금 지급하도록 구매 승인을 완료하였음을 회사가 인지한 후 판매자에게 대금을 지급한 시점
				2. 이용자가 구매결정기간 내에 판매자에게 대금지급 여부에 대한 의사표시를 회사 앞으로 통지하지 아니하여 회사가 판매자에게 물품대금을 지급한 시점
				3. 이용자가 구매결정기간 내에 구매거절이나 취소의사를 통지하고, 판매자가 반품된 물품에 대한 수령을 완료하여 반품에 대한 이의가 없음을 통지하여 회사가 정상적으로 구매취소(반품)된 것으로 보고 거래대금을 이용자에게 환불한 시점
				④ 이용자가 결제대금예치서비스를 통한 결제 후 물품 발송 이전에 해당 판매자 등을 통해 구매 취소한 경우, 회사는 이용자가 서비스를 자동 취소한 것으로 간주하여 처리하며 이에 대하여 회사는 책임지지 아니합니다.
				제6조 (결제대금예치서비스의 내용)
				① 이용자는 재화 등을 공급받은 사실을 재화 등을 공급받은 후 구매결정기간 내에 회사에 통보하여야 합니다. 단, 구매를 거절코자 하는 경우, 이용자는 구매결정기간 내에 구매물품에 대한 판매자 앞 대금지급 거절의사를 회사가 사전에 정한 방법에 따라 회사에게 통보하여야 합니다.
				② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
				③ 회사는 이용자가 재화 등을 공급받은 날부터 구매결정기간이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
				④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급할 사유가 발생한 경우에는 그 결제대금을 이용자에게 환급하며, 구체적인 방법은 다음 각 호에 따릅니다.
				1. 이용자의 구매거절 의사 통지 및 이에 대한 판매자의 환불 승인이 완료된 경우에 회사는 해당 익영업일(은행영업일 기준) 이용자의 결제 수단에 따라, 현금결제의 경우에는 이용자가 지정한 계좌로 환불 처리하며 신용카드 및 기타결제수단의 경우에는 취소 처리합니다.
				2. 이용자는 구매거절 후 수령한 물품에 대해 판매자에게 반송처리 시 안전하게 반송될 수 있도록 하여야 하며, 만일 이용자의 귀책 사유로 물품이 훼손된 경우에는 제1호에도 불구하고 이용자와 판매자 간 상호 협의하여 처리하여야 합니다.
				⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
				제7조 (이용시간)
				① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 서비스의 특성 또는 금융기관이나 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
				② 회사는 정보통신설비의 보수, 점검 등 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다.
				다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 서비스를 중단할 수 있습니다.
				제8조 (접근매체의 선정과 사용 및 관리)
				① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
				② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
				③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
				④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
				제9조 (거래내용의 확인)
				① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용 (이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다) 을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영 장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알리며, 거래내용을 제공할 수 없는 기간은 서면교부 기간에 산입하지 아니합니다.
				② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및 조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하고 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항을 제공합니다.
				③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
				- 주소: 서울특별시 중구 세종대로 39 대한상공회의소7층 한국정보통신주식회사
				- 이메일 주소: easypay@kicc.co.kr
				- 전화번호: 1600-1234
				제10조 (오류의 정정 등)
				① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
				② 회사는 전 항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 문서, 전화 또는 전자우편으로 알려 드립니다.
				제11조 (회사의 책임)
				① 회사는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 제8조 제2항을 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본 조 제1항 단서에 해당하거나 법인(『중소기업기본법』 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				③ 회사는 전자금융거래를 위한 전자적 장치 또는 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 제2조 제1항 제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 다음 각 호와 같은 경우 회사는 이용자에 대하여 책임을 지지 않습니다.
				1. 회사가 접근매체에 따른 확인 외에 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 『전자금융거래법』 제9조 제1항 제3호에 따른 사고가 발생한 경우
				2. 이용자가 제1호의 추가적인 보안조치에서 사용되는 매체, 수단 또는 정보에 대하여 다음과 같은 행위를 하여 사고가 발생하는 경우
				가. 누설, 누출 또는 방치한 행위
				나. 제3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위
				제12조 (전자지급거래계약의 효력)
				① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
				② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
				제13조 (거래지시의 철회)
				① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 다음의 주소, 전자우편 및 연락처에 연락을 취함으로써 거래지시를 철회할 수 있습니다.
				- 주소 : 서울특별시 중구 세종대로39 대한상공회의소 7층 한국정보통신주식회사
				- 이메일 주소 : easypay@kicc.co.kr
				- 전화번호 : 1600-1234
				② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
				③ 이용자는 지급의 효력이 발생한 경우에는 『전자상거래 등에서의 소비자보호에 관한 법률』 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제6조에서 정한 바에 따라 결제대금을 반환 받을 수 있습니다.
				제14조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
				① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
				② 전 항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제9조 제2항에서 정한 바에 따릅니다.
				제15조 (전자금융거래정보의 제공금지)
				회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 다만, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보보호법』, 『신용정보의 이용 및 보호에 관한 법률』 등 관련 법령에 근거한 적법한 절차에 따르는 경우에는 그러하지 아니합니다.
				제16조 (계약해지 및 이용 제한)
				① 이용자는 서비스 홈페이지 또는 고객센터를 통하여 서비스 계약을 해지할 수 있습니다.
				② 회사는 이용자가 본 약관의 의무를 이행하지 않을 경우 사전 통지 없이 즉시 서비스 이용계약을 해지하거나 서비스 이용을 제한할 수 있습니다. 회사의 조치에 대하여 이의가 있는 경우에는 서비스 홈페이지 또는 고객센터를 통하여 이의신청을 할 수 있습니다.
				③ 전 항의 이의가 정당하다고 판단되는 경우 회사는 서비스의 이용을 즉시 재개합니다.
				제17조 (분쟁처리 및 분쟁조정)
				① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
				- 담당자: PG 사업본부 RM 담당
				- 전화번호 : 02)368-0916
				- 전자우편주소 : easypay@kicc.co.kr
				② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
				③ 이용자는 『금융위원회의 설치 등에 관한 법률』 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 『소비자기본법』 제60조의 규정에 따른 한국소비자원의 소비자분쟁조정위원회에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
				제18조 (회사의 안정성 확보 의무)
				회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
				제19조 (약관 외 준칙 및 관할)
				① 회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.
				② 이 약관에서 정하지 아니한 사항에 대하여는 『전자금융거래법』, 『전자상거래 등에서의 소비자보호에 관한 법률』, 『방문판매 등에 관한 법률』, 『여신전문금융업법』 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
				③ 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
				부칙
				본 약관은 2021년 3월 15일부터 적용됩니다.[토스페이먼츠]
				전자금융거래 기본약관(이용자용)
				제1조 (목적)
				이 약관은 전자지급결제대행서비스 및 결제대금예치서비스를 제공하는 토스페이먼츠 주식회사(이하 '회사'라 합니다)와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함으로써 전자금융거래의 안정성과 신뢰성을 확보함에 그 목적이 있습니다.
				제2조 (용어의 정의)
				이 약관에서 정하는 용어의 정의는 다음과 같습니다.
				① 전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 구성원과 직접 대면하거나 의사소통을 하지 아니하고 전산화된 방식으로 이를 이용하는 거래를 말합니다.
				② '전자지급결제대행 서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
				③ ‘결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
				④ '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자지급결제대행 서비스를 이용하는 자를 말합니다.
				⑤ '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 금융기관 또는 전자금융업자에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
				⑥ '거래지시'라 함은 이용자가 전자금융거래계약에 따라 금융기관 또는 전자금융업자에게 전자금융거래의 처리를 지시하는 것을 말합니다.
				⑦ '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
				제3조 (약관의 명시 및 변경)
				① 회사는 이용자가 전자지급결제대행 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
				② 회사는 이용자의 요청이 있는 경우 서면제공 방식 또는 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
				③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 지급결제정보 입력화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
				④ 이용자는 제3항의 규정에 따른 약관의 변경내용이 게시되거나 통지된 후부터 변경되는 약관의 시행일 전의 영업일까지 전자금융거래의 계약을 해지할 수 있습니다. 전단의 기간 안에 이용자가 약관의 변경내용에 대하여 이의를 제기하지 아니하는 경우에는 약관의 변경을 승인한 것으로 봅니다.
				제4조 (전자지급결제대행서비스의 종류)
				회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
				① 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통한 신용카드 지불정보의 송,수신 및 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
				② 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
				③ 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
				④ 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'KT전화(ARS,폰빌)결제대행서비스', '상품권결제대행서비스'등이 있습니다.
				제5조 (결제대금예치서비스의 내용)
				① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
				② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
				③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
				④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
				⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
				제6조 (접근매체의 선정, 관리 등)
				① 회사는 전자지급결제대행 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
				② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
				③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
				④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
				제7조 (회사의 책임)
				① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 접근매체를 제3자에게 대여하거나 그 사용을 위임한 경우 또는 양도나 담보의 목적으로 제공한 경우, 회사가 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 사고가 발생한 경우, 이용자가 제6조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외한다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				③ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
				제8조 (거래내용의 확인)
				① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 전자적양식, 모사전송, 서면 등의 방법으로 거래내용에 관한 서면을 교부합니다. 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 인터넷 등을 이용하여 즉시 그 사유를 알리고, 그 사유가 종료된 때부터 이용자가 거래내용을 확인할 수 있도록 하여야 합니다.
				② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 가맹점에 대한 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항은 제공하는 거래내용에서 제외됩니다.
				③ 이용자가 본조 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
				주소 : 서울특별시 강남구 테헤란로 131 한국지식재산센터 15층 토스페이먼츠 주식회사
				이메일 주소 : support@tosspayments.com
				전화번호 : 1544-7772
				제9조 (오류의 정정 등)
				① 이용자는 전자지급결제대행 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
				② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
				③ 이용자는 다음의 주소 및 전화번호로 본 조항상의 정정 요구를 할 수 있습니다.
				주소 : 서울특별시 강남구 테헤란로 131 한국지식재산센터 15층 토스페이먼츠 주식회사
				이메일 주소 : support@tosspayments.com
				전화번호: 1544 - 7772
				④ 회사는 스스로 전자금융거래에 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 오류가 있음을 안 날부터 2주 이내에 오류의 원인과 처리 결과를 이용자에게 알려 드립니다.
				제10조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
				① 회사는 이용자가 전자지급결제대행 서비스 이용거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
				② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.
				제11조 (거래지시의 철회 제한)
				① 이용자가 전자지급거래를 한 경우, 지급의 효력은 ‘전자금융거래법’ 제13조 각호의 규정에 따릅니다.
				② 이용자는 ‘전자금융거래법’ 제13조 각호의 규정에 따라 지급의 효력이 발생하기전까지 거래지시를 철회할 수 있습니다. 단, 금융기관, 이동통신사 등의 규정에 의거 거래지시의 철회가 제한될 수 있습니다.
				③ 전자지급수단별 거래지시의 철회 방법 및 제한 등은 다음 각호와 같습니다.
				신용카드결제, 계좌이체결제, 가상계좌결제 : 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령에서 정한 바에 따라 재화의 구입 또는 용역의 이용 거래에서의 청약의 철회 등을 한 경우에 한하여 철회가 가능합니다.
				휴대폰결제, KT전화(ARS,폰빌)결제: 전 가호의 방법에 따른 청약철회 요청건 중 이동통신사의 규정에 의거 결제일 해당월 말일까지 발생한 거래건에 한하여 철회가 가능합니다.
				상품권결제: 전 가호의 방법에 따른 청약철회 요청 건 중 시스템 장애 등으로 정상적인 서비스를 이용하지 못한 경우에 한하여 결제일로부터 10일 이내 청약 철회가 가능합니다.
				제12조 (추심이체의 출금 동의 및 철회)
				① 회사는 이용자의 요청이 있는 경우 이용자의 계좌가 개설되어 있는 금융회사 등이 추심이체를 실행할 수 있도록 금융회사 등을 대신하여 전자금융거래법령 등 관련 법령에 따른 방법으로 출금에 대한 동의를 진행합니다.
				② 회사는 전 항에 따른 이용자의 동의 사항을 추심 이체를 실행하는 해당 금융회사 등에 제출합니다.
				③ 이용자는 이용자의 계좌의 원장에 출금기록이 끝나기 전까지 회사 또는 해당 금융회사 등에 제1항의 규정에 따른 동의의 철회를 요청할 수 있습니다.
				④ 전 항에도 불구하고 회사 또는 금융회사 등은 대량으로 처리하는 거래 또는 예약에 따른 거래 등의 경우에는 미리 이용자와 정한 약정에 따라 동의의 철회시기를 달리 정할 수 있습니다.
				⑤ 이용자가 제3항에 따라 출금 동의 철회를 요청한 경우, 이용자는 출금 동의 철회 요청 이후 발생한 출금에 대해서 제14조 제1항의 담당자에게 이의를 제기할 수 있습니다. 다만, 본 조항은 동의 철회요청 이전에 발생한 출금에 대해서는 적용되지 않습니다.
				제13조 (전자금융거래정보의 제공금지)
				회사는 전자지급결제대행서비스 및 결제대금예치서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공,누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, ‘금융실명 거래 및 비밀 보장에 관한 법률’ 제4조 제1항 단서의 규정에 따른 경우 그 밖의 다른 법률에서 정하는 바에 따른 경우에는 그러하지 아니합니다.
				제14조 (분쟁처리 및 분쟁조정)
				① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자지급결제대행 서비스 및 결제대금예치서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
				담당자 : 토스페이먼츠 RM(리스크)팀
				연락처 : 전화번호 1544-7772, 팩스 02-6919-2354
				이메일 : rm@tosspayments.com
				② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
				③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제35조 제1항의 규정에 따른 소비자원에 회사의 전자지급결제대행서비스 및 결제대금예치서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
				제15조 (회사의 안정성 확보 의무)
				회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
				제16조 (이용시간)
				① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 변경될 수 있습니다.
				② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.
				제17조 (약관외 준칙 및 관할)
				① 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
				② 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.



				[엔에이치엔한국사이버결제]
				전자금융거래 기본약관
				제1조 (목적)
				이 약관은 엔에이치엔한국사이버결제 주식회사(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
				제2조 (용어의 정의)
				이 약관에서 정하는 용어의 정의는 다음과 같습니다.
				1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
				2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
				3. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
				4. ‘가맹점’이라 함은 금융기관 또는 전자금융업자와의 계약에 따라 직불전자지급수단이나 선불전자지급수단 또는 전자화폐에 의한 거래에 있어서 이용자에게 재화 또는 용역을 제공하는 자로서 금융기관 또는 전자금융업자가 아닌 자를 말합니다.
				5. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
				6. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
				7. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
				8. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
				제3조 (약관의 명시 및 변경)
				① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
				② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
				③ 회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 경우에는 즉시 공지합니다.
				④ 이용자가 변경된 약관사항에 동의하지 않는 경우에는 서비스의 이용이 불가하며 이용자는 이용 계약을 해지할 수 있습니다.
				제4조 (전자지급결제대행서비스의 종류)
				회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
				1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
				2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
				3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
				4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이 있습니다.
				제5조 (결제대금예치서비스의 내용)
				① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
				② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
				③ 회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
				④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
				⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
				제6조 (이용시간)
				① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
				② 회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시없이 서비스를 중단할 수 있습니다.
				제7조 (접근매체의 선정과 사용 및 관리)
				① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
				② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
				③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
				④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
				제8조 (거래내용의 확인)
				① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영 장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알려야 하며, 거래내용을 제공할 수 없는 기간은 서면교부 기간에 산입하지 아니합니다.
				② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록 회사가 전자금융거래의 대가로 받은 수수료, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및 조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 보존하고, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항을 제공합니다.
				③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
				주소: 서울시 구로구 디지털로26길 72(구로동, NHN한국사이버결제)
				이메일 주소: help@kcp.co.kr
				전화번호: 1544-8667
				제9조 (오류의 정정 등)
				① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
				② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때 에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안 날부터 2주 이내에 그 결과를 이용자에게 문서, 전화 또는 전자우편으로 알려 드립니다.
				제10조 (가맹점의 준수사항 등)
				① 가맹점은 직불전자지급수단이나 선불전자지급수단 또는 전자화폐(이하 "전자화폐등"이라 한다)에 의한 거래를 이유로 재화 또는 용역의 제공 등을 거절하거나 이용자를 불리하게 대우하여서는 아니 됩니다.
				② 가맹점은 이용자로 하여금 가맹점수수료를 부담하게 하여서는 아니 됩니다.
				③ 가맹점은 다음 각 호의 어느 하나에 해당하는 행위를 하여서는 아니 됩니다.
				1. 재화 또는 용역의 제공 등이 없이 전자화폐등에 의한 거래를 한 것으로 가장(가장)하는 행위
				2. 실제 매출금액을 초과하여 전자화폐등에 의한 거래를 하는 행위
				3. 다른 가맹점 이름으로 전자화폐등에 의한 거래를 하는 행위
				4. 가맹점의 이름을 타인에게 빌려주는 행위
				5. 전자화폐등에 의한 거래를 대행하는 행위
				④가맹점이 아닌 자는 가맹점의 이름으로 전자화폐등에 의한 거래를 하여서는 아니 됩니다.
				제11조 (가맹점 모집 등)
				① 회사는 가맹점을 모집하는 경우에는 가맹점이 되고자 하는 자의 영업여부 등을 확인하여야 합니다. 다만, 「여신전문금융업법」 제16조의2의 규정에 따라 이미 확인을 한 가맹점인 경우에는 그러하지 아니합니다.
				② 회사는 다음 각 호의 사항을 금융위원회가 정하는 방법에 따라 가맹점에 알려야 합니다.
				1. 가맹점수수료
				2. 제2항의 규정에 따른 가맹점에 대한 책임
				3. 전조 규정에 따른 가맹점의 준수사항
				③ 회사는 가맹점이 전조의 규정을 위반하여 형의 선고를 받거나 관계 행정기관으로부터 위반사실에 대하여 서면통보를 받는 등 대통령령이 정하는 사유에 해당하는 때에는 특별한 사유가 없는 한 지체 없이 가맹점계약을 해지하여야 합니다. ‘대통령령이 정하는 사유’라 함은 다음 각 호의 어느 하나에 해당하는 경우를 말합니다.
				1. 가맹점이 전자금융거래법 제 26조 또는 전조 제3항 제3호 내지 제5호를 위반하여 형을 선고받은 경우
				2. 가맹점이 전조 제1항, 제2항 또는 제3항 제3호 내지 제5호를 위반한 사실에 관하여 관계 행정기관으로부터 서면통보가 있는 경우
				3. 관계 행정기관으로부터 해당 가맹점의 폐업사실을 서면으로 통보 받은 경우
				제12조 (회사의 책임)
				① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그러하지 아니합니다.
				③ 회사는 이용자로부터의 거래지시가 있음에도 불구하고 천재지변, 회사의 귀책사유가 없는 정전, 화재, 통신장애 기타의 불가항력적인 사유로 처리 불가능하거나 지연된 경우로서 이용자에게 처리 불가능 또는 지연사유를 통지한 경우(금융기관 또는 결제수단 발행업체나 통신판매업자가 통지한 경우를 포함합니다)에는 이용자에 대하여 이로 인한 책임을 지지 아니합니다.
				④ 회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제 2조 제 1항 제 1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 다음과 같은 경우 회사는 이용자에 대하여 일부 또는 전부에 대하여 책임을 지지 않습니다.
				1. 회사가 접근매체에 따른 확인 외에 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 전자금융거래법 제9조 제1항 제3호에 따른(이하 ‘사고’라 한다)사고가 발생한 경우.
				2. 이용자가 동항 제 1호의 추가적인 보안조치에서 사용되는 매체, 수단 또는 정보에 대하여 다음과 같은 행위를 하여 사고가 발생하는 경우
				가. 누설, 누출 또는 방치한 행위
				나. 제 3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위
				제13조 (전자지급거래계약의 효력)
				① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
				② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
				제14조 (거래지시의 철회)
				① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 다음의 주소, 전자우편 및 연락처에 연락을 취함으로써 거래지시를 철회할 수 있습니다.
				주소: 서울시 구로구 디지털로26길 72(구로동, NHN한국사이버결제)
				이메일 주소: help@kcp.co.kr
				전화번호: 1544-8667
				② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
				③ 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제5조에서 정한 바에 따라 결제대금을 반환받을 수 있습니다.
				제15조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
				① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
				② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.
				제16조 (전자금융거래정보의 제공금지)
				회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, 통신비밀보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 의하여 적법한 절차에 따르는 경우에는 그러하지 아니합니다.
				제17조 (계약해지 및 이용제한)
				① 이용자는 서비스 홈페이지 또는 고객센터를 통하여 서비스 계약을 해지할 수 있습니다.
				② 회사는 이용자가 본 약관의 의무를 이행하지 않을 경우 사전 통지 없이 즉시 서비스 이용계약을 해지하거나 서비스 이용을 제한할 수 있습니다. 회사의 조치에 대하여 이의가 있는 경우에는 서비스 홈페이지 또는 고객센터를 통하여 이의신청을 할 수 있습니다.
				③ 전 항의 이의가 정당하다고 판단되는 경우 회사는 서비스의 이용을 즉시 재개합니다.
				제18조 (분쟁처리 및 분쟁조정)
				① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
				담당자: RM팀
				연락처(전화번호, 전자우편주소) : 070-5075-8041, minwon@kcp.co.kr
				② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
				③ 이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제33조의 규정에 따른 한국소비자원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
				제19조 (회사의 안정성 확보 의무)
				회사는 전자금융거래가 안전하게 처리될 수 있도록 선량한 관리자로서의 주의를 다하며 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
				제20조 (약관 외 준칙 및 관할)
				① 회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.
				② 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
				③ 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
				부칙 < 제 1 호, 2006.12.26. >
				본 약관은 2007년 1월 1일부터 시행한다

				부칙 < 제 2 호, 2011.01.17. >
				본 약관은 2011년 02월 21일부터 시행한다.
				(제 2조 4항 신설, 제 8조 2항 일부 개정, 제 10조 신설, 제11조 신설)

				부칙 < 제 3 호, 2015.10.14. >
				본 약관은 2015 10월 14일부터 시행한다
				(제 17조 제1항 일부 개정, 제 12조 제 5항 신설)

				부칙 < 제 4 호, 2016.04.08. >
				본 약관은 2016년 4월 26일부터 시행한다
				(제 1조 일부 개정, 제 8조 제 3항 일부 개정)

				부칙 < 제 5 호, 2016.11.11. >
				본 약관은 2016 11월 21일부터 시행한다
				(제 17조 신설, 제3조 제3항 및 제4항, 제9조 제2항, 제14조 제1항, 제16조, 제18조 제3항 일부 개정)

				부칙 < 제 6 호, 2016.11.28. >
				본 약관은 2016 11월 28일부터 시행한다
				(제12조 제1항 삭제, 제6조 제2항, 제8조 제1항 및 제2항, 제9조 제2항, 제19조 개정, 제20조 제1항 신설)



				부칙 < 제 7 호, 2018.01.19. >
				본 약관은 2018년 02월 22일부터 시행한다
				(제12조 제1항, 제2항 일부 개정)

				부칙 < 제 8 호, 2018.07.23. >
				본 약관은 2018년 07월 31일부터 시행한다
				(제18조 제1항 일부 개정)

				부칙 < 제 9 호, 2018.11.15. >
				본 약관은 2018년 12월 20일부터 시행한다
				(제8조 제3항, 제14조 제1항 개정)

				부칙 < 제 10 호, 2019.05.21. >
				본 약관은 2019년5월 31일부터 시행한다
				(제8조 제3항, 제14조 제1항 개정)



				[헥토파이낸셜]
				전자금융거래 이용약관
				제1조 (목적)
				이 약관은 헥토파이낸셜(주) (이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스, 선불전자지급수단의 발행 및 관리 서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
				제2조 (용어의 정의)
				이 약관에서 정하는 용어의 정의는 다음과 같으며, 본 조에서 정한 것을 제외하고는 전자금융거래법 등 관련법령이 정한 바에 의합니다.
				1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스, 선불전자지급수단의 발행 및 관리 서비스 및 결제대금예치서비스 등(이하 '전자금융거래 서비스' 또는 ‘서비스’라고 합니다)을 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
				2. ‘전자지급수단’이라 함은 선불전자지급수단, 신용카드 등 전자금융거래법 제2조 제11호에서 정하는 전자적 방법에 따른 지급수단을 말합니다.
				3. ‘전자지급거래’라 함은 지급인이 전자지급수단을 이용하여 수취인에게 자금을 이동하게 하는 전자금융거래를 통칭합니다.
				4. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
				5. ‘선불전자지급수단’이라 함은 회사가 운영하는 웹사이트 및 제휴사 서비스 등에서 재화 또는 용역(이하 ‘재화 등’이라고 합니다)을 구매할 수 있는 헥토파이낸셜 머니 등과 같이 회사가 발행 당시 미리 회원에게 공지한 전자금융거래법 상 선불전자지급수단을 말합니다.
				6. ‘충전’이라 함은 선불전자지급수단의 일정액을 확보하기 위해 회사가 지정한 지불수단을 통해 선불전자지급수단을 구매하거나, 회사 또는 회사가 지정한 제3자의 서비스 등(이하 ‘서비스 등’이라 합니다)에서의 활동을 통해 선불전자지급수단을 적립 받는 것을 말합니다.
				7. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
				8. '자동이체서비스'라 함은 ‘전자지급결제대행서비스’의 지급결제수단을 이용하여 이용자가 약정한 일자에 물품 및 용역대금의 납부가 자동으로 이루어지도록 하는 서비스를 말합니다.
				9. '자동이체납부기관' (이하 “납부기관”이라 한다)이라 함은 이용자와 상품 또는 용역의 공급 계약을 맺고 ‘회사’를 통해 자동이체서비스 대금을 받는 자를 말합니다.
				10. '이용자'라 함은 본 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
				11. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다 ), '전자서명법' 상의 인증서 , 회사에 등록된 이용자번호 , 이용자의 생체정보 , 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제 2 조 제 10 호에서 정하고 있는 것을 말합니다.
				12. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
				13. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
				제3조 (약관의 명시 및 변경)
				① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
				② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
				③ 회사가 이 약관을 변경하고자 하는 경우에는 변경 1개월 전에 그 내용을 서비스 화면 또는 홈페이지 등 전자적 장치에 게시하고 이용자에게 전자 우편 혹은 PUSH, 알림톡 등을 통지하여야 합니다. 다만, 이용자가 이의를 제기할 경우 회사는 이용자에게 적절한 방법으로 약관 변경내용을 통지하였음을 확인해 주어야 합니다.
				④ 제3항에도 불구하고 법령의 개정으로 인하여 긴급하게 약관을 변경한 때에는 변경된 약관을 서비스 화면 또는 홈페이지에 1개월 이상 게시하고 이용자에게 전자 우편 혹은 PUSH, 알림톡 등을 통해 사후 통지합니다.
				⑤ 회사는 제3항의 공지를 할 경우 "이용자가 변경에 동의하지 아니한 경우 공지한 날로부터 30일 이내에 계약을 해지할 수 있으며, 계약해지의 의사표시를 하지 아니한 경우에는 변경에 동의한 것으로 본다"라는 취지의 내용을 고지하거나 통지합니다.
				제4조 (전자지급 결제대행서비스의 종류)
				회사가 제공하는 전자지급 결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
				1. 신용카드 결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
				2. 계좌이체 대행서비스: 이용자의 지급지시 또는 출금동의에 따라 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 이용자의 계좌에서 원하는 계좌로 이체하는 서비스를 말하며, 간편현금결제서비스, 간편계좌이체서비스 등도 이에 해당합니다.
				3. 가상계좌 서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
				4. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스' 등이 있습니다.
				제5조 (선불전자지급수단의 충전 및 이용)
				① 이용자는 계좌출금, 기타 회사가 정하는 지불수단으로 선불전자지급수단을 구매하거나, 서비스 등에서의 활동으로 회사 또는 회사의 제휴사로부터 적립 받아 선불전자지급수단을 충전할 수 있습니다.
				② 회사가 지정한 지불 수단을 통한 선불전자지급수단 구매는 제1항에서 규정하는 지불 수단별로 지정된 금액으로 충전을 할 수 있으며, 지불 수단에 따라 자체 제한금액이 있을 수 있습니다.
				③ 이용자는 회사가 정한 기한 및 이용방법에 따라 선불전자지급수단을 이용할 수 있으며, 회사는 그 구체적인 사항을 본 약관 또는 선불전자지급수단 관련 서비스 페이지를 통해 공지합니다.
				④ 이용자는 서비스 등에서 재화 등을 구매할 때 선불전자지급수단을 지불 수단으로 사용할 수 있습니다.
				⑤ 선불전자지급수단은 재화 등의 구매완료 시점에 즉시 차감됩니다.
				⑥ 이용자가 선불전자지급수단을 사용하는 경우 서비스 등에서 적립 받은 무상의 선불전자지급수단(이하 ‘적립선불’이라고 합니다), 이용자가 구매한 선불전자지급수단(이하 ‘구매선불’이라고 합니다)의 순서로 차감합니다.
				⑦ 이용자가 선불전자지급수단을 사용한 재화 등의 구매를 취소하는 경우 회사는 재화 등 구매시 사용한 선불전자지급수단을 재충전하는 것을 원칙으로 합니다.
				제6조 (선불전자지급수단의 유효기간 및 환불)
				① 개별 선불전자지급수단을 마지막으로 이용한 날 로부터 일백이십(120) 개월이 경과하는 동안 해당 선불전자지급수단을 한번도 적립하거나 사용하지 않은 경우 이용자가 충전한 해당 선불전자지급수단은 자동소멸됩니다.
				② 회사는 전항에 따른 선불전자지급수단의 유효기간이 도래하기 7일전 통지를 포함하여 3회 이상 이용자에게 유효기간의 도래, 유효기간의 연장 가능여부와 방법 등을 이메일 등의 방법으로 통지하여야 한다.
				③ 이용자는 회사에게 유효기간 내에는 유효기간의 연장을 요청할 수 있고, 요청을 받은 회사는 특별한 사유가 없는 한 유효기간을 3개월 연장한다.
				④ 본 약관에 대한 동의를 철회하는 경우 적립선불은 소멸되어 환급이 불가능합니다.
				⑤ 이용자는 보유 중인 선불전자지급수단의 환급을 회사에 요구할 경우 구매선불 전액을 환급 받을 수 있습니다. 다만, 회사로부터 무상 제공받은 적립선불의 경우 환급 대상에서 제외됩니다.
				⑥ 다음 각 호의 경우에는 구매선불의 잔액 전부를 환급합니다.
				1. 천재지변 등의 사유로 서비스 등에서 재화 또는 용역을 제공하기 곤란하여 선불전자지급수단을 사용하지 못하게 된 경우
				2. 선불전자지급수단의 결함으로 서비스 등에서 재화 또는 용역을 제공하지 못하는 경우
				3. 이용자가 구매선불 잔액의 환급을 요청하는 경우
				4. 본 약관에 대한 동의를 철회하는 경우
				⑦ 현금 환급은 이용자로부터 환급 신청이 접수된 후 이용자의 입금사실을 확인한 시점에서 제칠(7)영업일 이내에 이용자가 지정한 계좌로 현금 입금됩니다.
				⑧ 이용자는 회사에서 정한 기한 및 이용방법에 따라 선불전자지급수단을 이용할 수 있으며, 회사는 환급 등 구체적인 사항을 개별 선불전자지급수단의 고객센터 페이지를 통해 안내합니다.
				제7조 (선불전자지급수단의 금지사항 및 이용한도)
				① 이용자는 선불전자지급수단을 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
				② 회사는 선불전자지급수단에 대해 실지명의 당 최고 200만원을 그 보유 한도로 합니다. 단 보유 한도는 회사의 정책에 따라 감액될 수 있습니다.
				제8조 (결제대금예치서비스의 내용)
				① 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본 조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
				② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
				③ 회사는 이용자가 재화 등을 공급받은 날부터 3 영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
				④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급 받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
				⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리, 의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
				제9조 (서비스 이용시간 및 제한사유)
				① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
				② 회사는 다음 각호 중 어느 하나에 해당하는 사유가 있는 경우 서비스의 제공을 일시적으로 중단하거나 제한할 수 있습니다.
				1. 컴퓨터 등 정보통신설비의 보수, 업그레이드, 점검, 교체, 고장, 통신장애, 해킹 등으로 정상적인 서비스 제공이 어려운 경우
				2. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우
				3. 이용자의 전산조작이나 업무처리의 오류 등으로 서비스 제공이 어려운 경우
				4. 천재지변, 국가비상사태 등 기타 불가항력적 사유가 발생한 경우
				③ 회사는 본 조 제2항의 사유로 서비스 중단이 불가피한 경우 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애보국, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사후에 고지하거나 통지할 수 있습니다.
				제10조 (접근매체의 선정과 사용 및 관리)
				① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
				② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
				③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
				④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
				제11조 (거래내용의 확인)
				① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알려야하며, 거래내용을 제공할 수 없는 기간은 서면교부 기간에 산입하지 아니합니다.
				② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록, 회사가 전자금융거래의 대가로 받은 수수료, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및 조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용 시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 합니다.
				③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
				- 주소: (06220)서울시 강남구 테헤란로34길 6 태광타워 9~10층 헥토파이낸셜
				- 이메일 주소: pg@hecto.co.kr
				- 전화번호: 1600-5220
				제12조 (오류의 정정 등)
				① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
				② 회사는 전항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날 또는 오류가 있음을 안 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
				제13조(착오송금에 관한 사항)
				① 이용자가 착오로 수취금융회사, 수취계좌번호 등을 잘못 기재하거나 입력하여 수취인에게 선불전자지급수단 등의 자금이 이동(이하 ‘착오송금’이라 합니다.)된 경우, 회사에 통지하여 회사 또는 수취 금융회사 등을 통해 수취인에게 연락하여 착오 송금액 반환을 요청할 수 있습니다.
				② 회사는 수취인에 대한 연락 사실, 수취인의 반환의사 유무, 수취인이 반환의사가 없는 경우 그 사유 등 이용자 요청사항에 대한 처리결과 또는 관련 처리 진행상황을 이용자가 전항의 ‘착오송금’ 발생사실을 회사에 통지한 날로부터 15일 이내에 이용자에게 알려야 합니다.
				③ 회사 또는 수취 금융회사를 통한 착오송금 반환 요청에도 수취인이 반환하지 않는 경우, 이용자는 ｢예금자보호법｣ 제5장(착오송금 반환지원)에 따라 예금보험공사에 착오송금 반환지원 제도 이용을 신청할 수 있습니다.(개정 ｢예금자보호법｣ 시행일인 ’21.7.6. 이후 발생한 착오송금에 대해 신청 가능) 단, 연락처를 통한 송금, SNS회원간 송금 거래 등 예금보험공사가 수취인의 실지명의를 취득할 수 없는 거래는 반환지원 신청이 제한됩니다.
				④ 회사는 예금보험공사가 착오송금 반환지원 업무의 원활한 수행을 위해 회사에 착오송금 수취인의 반환불가 사유, 실지명의, 주소 및 연락처, 착오송금 발생 현황 등의 자료를 요청하는 경우 정당한 사유가 없으면 이에 따라야 합니다.
				⑤ 이용자가 예금보험공사를 통해 착오송금 반환지원을 신청한 내역이 다음 각 호에 해당하는 경우 관련 법령에 따라 예금보험공사의 지원 절차가 중단될 수 있습니다.
				1. 이용자가 거짓이나 부정한 방법으로 반환지원을 신청한 경우
				2. 착오송금이 아님이 객관적인 자료로 확인되는 경우
				3. 신청일 이전 반환지원을 신청한 착오송금과 관련된 소송 등이 진행 중이거나 완료된 경우
				4. 그 밖에 예금보험위원회가 인정하는 경우
				제14조 (회사의 책임)
				① 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우에는 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우에는 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				③ 회사는 전자금융거래를 위한 전자적 장치 또는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률' 제2조 제1항 제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
				④ 회사는 관련 법령에서 정한 바에 따라 이용자의 정보를 관리하여야 하며, 이에 대한 세부적인 내용은 "회사"의 '개인정보보호방침'에 정한 바에 의합니다. 회사는 서비스 제공과 관련하여 알고 있는 이용자의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 관계법령에 의한 수사상의 목적으로 관계기관으로부터 요구 받은 경우나 정보통신윤리위원회의 요청이 있는 경우 등 법률의 규정에 따른 적법한 절차에 의한 경우에는 그러하지 않습니다.
				제15조 (전자지급거래계약의 효력)
				① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
				② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
				제16조 (거래지시 등의 철회)
				① 이용자는 전자지급거래에 관한 지급의 효력이 발생하기 전까지 거래지시 및 출금동의를 철회할 수 있습니다.
				② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때 (iii) 출금동의의 경우 수취인의 거래지시에 따라 지급인의 계좌의 원장에 출금기록이 끝난 때 (Ⅳ) 선불전자지급수단의 경우 이용자의 거래 지시된 금액의 정보가 수취인이 지정한 전자적 장치에 도달한 때를 말합니다.
				③ 이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법에 따라 결제대금을 반환 받을 수 있습니다.
				제17조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
				① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
				② 전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제11조 제2항에서 정한 바에 따릅니다.
				제18조 (전자금융거래정보의 제공금지)
				회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 관계법령에 의하거나 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 단, 금융기관 또는 공공기관이 회사에게 이용자 거래정보를 요청할 경우 식별 불가능하게 처리하여 제공할 수 있습니다.
				제19조 (계약해지 및 이용제한)
				① 이용자는 회사의 전자금융거래 서비스를 해지하고자 할 경우, 회사가 정한 방법으로 해지신청을 하여야 합니다. 회사는 소정의 해지절차를 거쳐 이용계약을 해지합니다.
				② 회사는 이용자가 다음 각호의 어느 하나에 해당할 경우 사전 통지 없이 즉시 서비스 이용계약을 해지하거나 서비스 이용을 제한할 수 있습니다. 회사의 조치에 대하여 이의가 있는 경우에는 회사 홈페이지 또는 고객센터를 통하여 이의신청을 할 수 있습니다.
				1. 본 약관 제7조 제2항 또는 제3항의 의무를 이행하지 않을 경우
				2. 이용자가 본 약관을 위반한 사실이 밝혀진 경우
				3. 정당한 권한 없이 타인의 명의로 가입 또는 결제를 신청한 경우
				4. 회사의 서비스를 부정한 용도로 이용한 경우
				5. 신종 금융사기를 통해 개인정보 유출 사고가 발생한 경우
				6. 서비스 운영을 고의로 방해하는 경우
				7. 이용자가 관계법령 및 금융기관, 기타 결제수단 발행업자 또는 통신판매업자의 약관을 위반한 경우
				8. 관계법령이나 감독규정, 감독기관의 지침, 회사의 약관과 지침 등에 의해 서비스 제공이 현저히 어려운 경우
				③ 회사는 전 항의 이의가 정당하다고 판단되는 경우 회사는 서비스의 이용을 즉시 재개합니다.
				④ 회사는 이용자가 아래 각 호의 사유에 해당하는 경우 해당 이용자에게 전자우편 또는 기타 유효한 수단을 통해 통보하고, 이용 자격을 박탈하거나 선불전자지급수단의 사용을 일시적으로 제한할 수 있습니다.
				1. 회원 가입시 등록한 개인정보의 전부 또는 일부가 허위임이 밝혀지는 경우
				2. 타인의 명의나 개인정보를 도용하여 회원 가입 후 선불전자지급수단을 이용하는 경우
				3. 타인의 결제정보 등을 도용하거나 부정한 행위로 거래를 하는 경우
				4. 이용자의 접근매체를 매매하거나 양도하는 경우
				5. 결제수단을 제공하는 사업자가 지정한 방식으로 이용요금을 납부하지 않고 장기 연체하는 경우
				6. 다른 이용자의 선불전자지급수단 사용을 방해하거나, 회사의 선불전자지급수단 제공에 지장을 초래하는 경우
				7. 회사가 정한 기간 내에 사용제한 사유를 해소하지 못한 경우
				8. 기타 선불전자지급수단 관련한 법령을 위반하는 경우
				⑤ 제4항에 해당하는 회원은 해당 사유를 해소한 이후 회사의 승낙에 따라 선불전자지급수단을 다시 사용할 수 있습니다.
				제20조 (분쟁처리 및 분쟁조정)
				① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
				- 담당자: 고객센터
				- 전화번호: 1600-5220
				- 전자우편주소: in.help@hecto.co.kr
				② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
				③ 이용자는 회사의 분쟁처리 및 분쟁조정에 불만이 있는 경우 '금융감독기구의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자보호법' 제31조 제1항의 규정에 따른 소비자보호원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
				제21조 (회사의 안정성 확보 의무)
				회사는 는 전자금융거래가 안전하게 처리될 수 있도록 선량한 관리자로서의 주의를 다하며, 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
				제22조 (약관외 준칙 및 관할)
				① 회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.
				② 이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
				③ 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
				[부칙] 본 약관은 2022년 09월 01일부터 시행한다.
				이전 약관은 홈페이지 (www.hectofinancial.co.kr) 에서 확인 가능합니다.



				[KICC]
				전자금융거래 기본약관
				제1조 (목적)
				이 약관은 한국정보통신 주식회사(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
				제2조 (용어의 정의)
				이 약관에서 정하는 용어의 정의는 다음과 같습니다.
				1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스 (이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
				2. '전자지급수단’이라 함은 전자자금이체, 직불전자지급수단, 선불전자지급수단, 전자화폐, 신용카드, 전자채권 그 밖에 전자적 방법에 따른 지급 수단을 말합니다.
				3. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
				4. '결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인
				시점까지 결제대금을 예치하는 서비스를 말합니다.
				5. '구매결정기간'이라 함은 이용자가 물품의 배송이 완료된 날로부터 본인이 구매하고자 하는 물품과 일치하는지 확인하는 3영업일의 기간을 말합니다.
				6. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
				7. '판매자'라 함은 재화 등을 공급하기 위해 예치대금을 확인하고 구매자의 환불 요청에 대하여 승인하는 자를 말하며 『전자상거래 등에서의 소비자 보호에 관한 법률』 제2조 제3호의 통신판매업자를 포함합니다.
				8. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), 『전자서명법』상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 『전자금융거래법』 제2조 제10호에서 정하고 있는 것을 말합니다.
				9. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
				10. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
				11. '정보통신망'이라 함은 전기통신설비를 이용하거나 전기통신설비와 컴퓨터 및 컴퓨터의 이용기술을 활용하여 정보를 수집·가공·검색·송신 또는 수신하는 정보통신체제를 말합니다.
				제 3조 (약관의 명시 및 변경)
				① 회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
				② 회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
				③ 회사가 이 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 또는 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다. 다만, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 경우에는 변경 후 즉시 공지합니다.
				④ 회사는 제3항의 공지를 할 경우 “이용자가 변경에 동의하지 아니하는 경우, 회사가 공지한 날로부터 30일 이내에 계약을 해지할 수 있으며, 해지의 의사표시를 하지 아니한 경우 동의한 것으로 본다.”라는 내용을 포함합니다.
				제4조 (전자지급결제대행서비스의 종류)
				회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.
				1. 신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송,수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
				2. 계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
				3. 가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
				4. 간편결제서비스 : 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드, 계좌이체인 경우로서, 정보를 매번 입력할 필요 없이 관련 정보의 한번 등록만으로 상품 결제가 가능한 서비스를 말합니다. 단, 간편결제서비스 신청 시 회사가 정하는 이용자의 본인확인
				절차가 반드시 필요하며, 회사의 인증 및 승낙이 있어야 서비스를 이용할 수 있습니다.
				5. 기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', 'ARS결제대행서비스', '상품권결제대행서비스', '교통카드결제대행서비스', '포인트결제대행서비스' 등이 있습니다.
				제5조 (결제대금예치서비스의 개시 및 종료 등)
				① 결제대금예치서비스 이용을 위한 별도의 회원가입 절차는 필요하지 않으며, 이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본 조 및 제6조에서도 같습니다)가 판매자에게 물품 구매 시 동 서비스를 이용한 결제의사를 표시, 완료한 때 정당한 서비스 신청이 이루어진 것으로 합니다. 이 경우, 동 서비스의 수수료는 회사가 별도로 정하는 바에 따릅니다.
				② 이용자의 서비스 신청에 따른 회사의 결제대금예치서비스 제공 및 책임의 개시 시기는 이용자의 구매 관련 정보가 판매자 등을 통해 회사에 전달되고 대금결제가 다음 각 호와 같이 이루어진 시점으로 합니다.
				1. 현금 거래의 경우, 거래 대금이 사전에 이용자에게 고지된 회사 계좌로 입금된 시점
				2. 신용카드 거래의 경우, 카드사로부터 카드 승인정보를 회사가 수취하는 시점
				3. 기타 결제수단의 경우, 결제대금의 입금이나 결제를 회사가 인지하는 시점
				③ 결제대금예치서비스는 다음 각 호의 1에 해당하는 때에 종료됩니다.
				1. 이용자가 결제 후 주문한 물품에 대하여 정상적으로 수령을 완료하고 판매자에게 대금 지급하도록 구매 승인을 완료하였음을 회사가 인지한 후 판매자에게 대금을 지급한 시점
				2. 이용자가 구매결정기간 내에 판매자에게 대금지급 여부에 대한 의사표시를 회사 앞으로 통지하지 아니하여 회사가 판매자에게 물품대금을 지급한 시점
				3. 이용자가 구매결정기간 내에 구매거절이나 취소의사를 통지하고, 판매자가 반품된 물품에 대한 수령을 완료하여 반품에 대한 이의가 없음을 통지하여 회사가 정상적으로 구매취소(반품)된 것으로 보고 거래대금을 이용자에게 환불한 시점
				④ 이용자가 결제대금예치서비스를 통한 결제 후 물품 발송 이전에 해당 판매자 등을 통해 구매 취소한 경우, 회사는 이용자가 서비스를 자동 취소한 것으로 간주하여 처리하며 이에 대하여 회사는 책임지지 아니합니다.
				제6조 (결제대금예치서비스의 내용)
				① 이용자는 재화 등을 공급받은 사실을 재화 등을 공급받은 후 구매결정기간 내에 회사에 통보하여야 합니다. 단, 구매를 거절코자 하는 경우, 이용자는 구매결정기간 내에 구매물품에 대한 판매자 앞 대금지급 거절의사를 회사가 사전에 정한 방법에 따라 회사에게 통보하여야 합니다.
				② 회사는 이용자로부터 재화 등을 공급받은 사실을 통보받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
				③ 회사는 이용자가 재화 등을 공급받은 날부터 구매결정기간이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
				④ 회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급할 사유가 발생한 경우에는 그 결제대금을 이용자에게 환급하며, 구체적인 방법은 다음 각 호에 따릅니다.
				1. 이용자의 구매거절 의사 통지 및 이에 대한 판매자의 환불 승인이 완료된 경우에 회사는 해당 익영업일(은행영업일 기준) 이용자의 결제 수단에 따라, 현금결제의 경우에는 이용자가 지정한 계좌로 환불 처리하며 신용카드 및 기타결제수단의 경우에는 취소 처리합니다.
				2. 이용자는 구매거절 후 수령한 물품에 대해 판매자에게 반송처리 시 안전하게 반송될 수 있도록 하여야 하며, 만일 이용자의 귀책 사유로 물품이 훼손된 경우에는 제1호에도 불구하고 이용자와 판매자 간 상호 협의하여 처리하여야 합니다.
				⑤ 회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리,의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
				제7조 (이용시간)
				① 회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 서비스의 특성 또는 금융기관이나 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다.
				② 회사는 정보통신설비의 보수, 점검 등 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다.
				다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 서비스를 중단할 수 있습니다.
				제8조 (접근매체의 선정과 사용 및 관리)
				① 회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
				② 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
				③ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
				④ 회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
				제9조 (거래내용의 확인)
				① 회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용 (이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다) 을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다. 다만, 전자적 장치의 운영 장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 즉시 이용자에게 전자문서 전송(전자우편을 이용한 전송을 포함합니다)의 방법으로 그러한 사유를 알리며, 거래내용을 제공할 수 없는 기간은 서면교부 기간에 산입하지 아니합니다.
				② 회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록, 이용자의 출금 동의에 관한 사항, 전자금융거래의 신청 및 조건의 변경에 관한 사항, 건당 거래금액이 1만원을 초과하는 전자금융거래에 관한 기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하고 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항을 제공합니다.
				③ 이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
				- 주소: 서울특별시 중구 세종대로 39 대한상공회의소7층 한국정보통신주식회사
				- 이메일 주소: easypay@kicc.co.kr
				- 전화번호: 1600-1234
				제10조 (오류의 정정 등)
				① 이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
				② 회사는 전 항의 규정에 따른 오류의 정정요구를 받은 때 또는 스스로 오류가 있음을 안 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 문서, 전화 또는 전자우편으로 알려 드립니다.
				제11조 (회사의 책임)
				① 회사는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만, 이용자가 제8조 제2항을 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				② 회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 본 조 제1항 단서에 해당하거나 법인(『중소기업기본법』 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
				③ 회사는 전자금융거래를 위한 전자적 장치 또는 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 제2조 제1항 제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만, 다음 각 호와 같은 경우 회사는 이용자에 대하여 책임을 지지 않습니다.
				1. 회사가 접근매체에 따른 확인 외에 보안강화를 위하여 전자금융거래 시 요구하는 추가적인 보안조치를 이용자가 정당한 사유 없이 거부하여 『전자금융거래법』 제9조 제1항 제3호에 따른 사고가 발생한 경우
				2. 이용자가 제1호의 추가적인 보안조치에서 사용되는 매체, 수단 또는 정보에 대하여 다음과 같은 행위를 하여 사고가 발생하는 경우
				가. 누설, 누출 또는 방치한 행위
				나. 제3자에게 대여하거나 그 사용을 위임한 행위 또는 양도나 담보의 목적으로 제공한 행위
				제12조 (전자지급거래계약의 효력)
				① 회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
				② 회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
				제13조 (거래지시의 철회)
				① 이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 다음의 주소, 전자우편 및 연락처에 연락을 취함으로써 거래지시를 철회할 수 있습니다.
				- 주소 : 서울특별시 중구 세종대로39 대한상공회의소 7층 한국정보통신주식회사
				- 이메일 주소 : easypay@kicc.co.kr
				- 전화번호 : 1600-1234
				② 전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
				③ 이용자는 지급의 효력이 발생한 경우에는 『전자상거래 등에서의 소비자보호에 관한 법률』 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제6조에서 정한 바에 따라 결제대금을 반환 받을 수 있습니다.
				제14조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
				① 회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
				② 전 항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제9조 제2항에서 정한 바에 따릅니다.
				제15조 (전자금융거래정보의 제공금지)
				회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다. 다만, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보보호법』, 『신용정보의 이용 및 보호에 관한 법률』 등 관련 법령에 근거한 적법한 절차에 따르는 경우에는 그러하지 아니합니다.
				제16조 (계약해지 및 이용 제한)
				① 이용자는 서비스 홈페이지 또는 고객센터를 통하여 서비스 계약을 해지할 수 있습니다.
				② 회사는 이용자가 본 약관의 의무를 이행하지 않을 경우 사전 통지 없이 즉시 서비스 이용계약을 해지하거나 서비스 이용을 제한할 수 있습니다. 회사의 조치에 대하여 이의가 있는 경우에는 서비스 홈페이지 또는 고객센터를 통하여 이의신청을 할 수 있습니다.
				③ 전 항의 이의가 정당하다고 판단되는 경우 회사는 서비스의 이용을 즉시 재개합니다.
				제17조 (분쟁처리 및 분쟁조정)
				① 이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
				- 담당자: PG 사업본부 RM 담당
				- 전화번호 : 02)368-0916
				- 전자우편주소 : easypay@kicc.co.kr
				② 이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
				③ 이용자는 『금융위원회의 설치 등에 관한 법률』 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 『소비자기본법』 제60조의 규정에 따른 한국소비자원의 소비자분쟁조정위원회에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
				제18조 (회사의 안정성 확보 의무)
				회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.
				제19조 (약관 외 준칙 및 관할)
				① 회사와 이용자 사이에 개별적으로 합의한 사항이 이 약관에 정한 사항과 다를 때에는 그 합의사항을 이 약관에 우선하여 적용합니다.
				② 이 약관에서 정하지 아니한 사항에 대하여는 『전자금융거래법』, 『전자상거래 등에서의 소비자보호에 관한 법률』, 『방문판매 등에 관한 법률』, 『여신전문금융업법』 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
				③ 회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.
				부칙
				본 약관은 2021년 3월 15일부터 적용됩니다.</div>
		</div>
		<hr>

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

		function toggleCheckboxes(source) {
			const requiredCheckboxes = document.getElementsByClassName('required-checkbox');
			for (let i = 0; i < requiredCheckboxes.length; i++) {
				requiredCheckboxes[i].checked = source.checked;
			}
		}
	</script>
</body>
</html>