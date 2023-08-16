<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css">
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_javascript.js"></script> <!-- gga_javascript.js -->
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<script src="http://localhost:9000/js/modal_jquery.js"></script>
<script src="http://localhost:9000/js/gga_mypage_boardMaster.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>

<style>
@media (min-width: 768px) {
  .container {
    width: 750px;
  }
}

.grayscale {
	filter: grayscale(1);
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
	margin:auto;
	text-align: center;
	vertical-align: middle;
}

.productordercon table tr td:nth-child(5){
	width : 120px;
}

.productordercon h1{
	font-size:20pt;
}

.form-inline {
	display: flex;
	align-items: center;
}
.form-group {
	margin-left: 60px;
	margin-right: 70px;
}

.myproductorder_text{
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-left: 150px;
}

.myproductorder_text img{
	width: 140px;
}

#ampaginationsm {
	height:30px;
}
#naverGuide {
	font-size: 12pt;
	color: gray;
}
table#boardMaster tr td:nth-child(2) a{
	text-decoration-line: none;
}

</style>
	<script>
		document.addEventListener('DOMContentLoaded', function () {
			// "mypage_ticket" 클래스를 가진 모든 <a> 요소들을 선택합니다.
			const mypageTickets = document.querySelectorAll('.mypage_ticket');

			// 현재 날짜를 타임스탬프로 가져옵니다.
			const currentDate = new Date().getTime();

			mypageTickets.forEach(function (ticket) {
				// 각 요소의 "data-date" 속성 값을 가져옵니다. (형식: "YYYY-MM-DD")
				const ticketDate = new Date(ticket.getAttribute('data-date')).getTime();

				// "data-date" 값을 현재 날짜와 비교하여 이전이라면 그레이스케일 효과를 적용합니다.
				if (ticketDate < currentDate) {
					// 해당 <a> 요소에 있는 이미지를 선택하고 "grayscale" 클래스를 추가합니다.
					const ticketImage = ticket.querySelector('img');
					ticketImage.classList.add('grayscale');
				}
			});
		});

	$(document).ready(function (){
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

								let td = $('<td>');

								if (product.couponname != null) {
									let p1 = $('<p>').attr('style', 'color: gray; text-decoration: line-through; margin: 0px; padding: 0px;').text(product.pprice * product.qty + ' 원');
									let p2 = $('<p>').attr('style', 'color: blue; margin: 0px; padding: 0px;').addClass('previousPrice1').text((product.pprice * product.qty - product.discount) + ' 원');
									td.append(p1);
									td.append(p2);
								} else {
									let span = $('<span>').attr('style', 'color: red;').addClass('previousPrice1').text((product.pprice * product.qty - product.discount) + ' 원');
									td.append(span);
								}

								row.append(td);;

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
</head>
<body>
	<!-- Header -->
		<header>
			<jsp:include page="../header.jsp" />
		</header>
	<!-- Header -->
	<!-- Content -->
<c:if test="${sessionScope.svo != null}">
	<div class= "content" >
		<section class= "mypage">
			<div class= "mypage_header">
				<img src="http://localhost:9000/images/mypagetitle.png">
			</div>
			<br>
				<div class="mypage_menu_info">
					<span>${sessionScope.svo.name}님</span> <!-- el태그 memberVo.mid -->
					<input type="hidden" id="mypageNameCheck" value="${sessionScope.svo.name}"> <!-- 본인확인용 -->
					<input type="hidden" id="mypageSuccess" value="${svo.id}"> <!-- 본인확인용 -->
					<c:choose>
						<c:when test="${svo.naverLoginResult == 0}">
<%--							<a href= "http://localhost:9000/mypage_update/${svo.id}">내 정보 수정</a> <!-- el태그 memberVo.mid -->--%>
							<a href="#" class="mypageModal">내 정보 수정</a>
							<a href= "http://localhost:9000/mycoupon">내 쿠폰함</a>
						</c:when>
						<c:otherwise>
							<a href= "http://localhost:9000/join">내 정보 수정 (GGA 회원 전용)</a>
							<span id="naverGuide">* 클릭 시 회원 전환 화면으로 넘어갑니다. (통합 회원 전환 시 할인쿠폰 5종이 지급 됩니다!!)</span>
						</c:otherwise>
					</c:choose>

				</div>
		</section>
		<section class="myorder">
		     <c:choose>
		     <c:when test="${not empty ticketlist}">
			<div class="myorder_header">
				<h1>My예매</h1>
				<a href="http://localhost:9000/mypage_allticket" class="myorder_all"><h5>전체보기</h5></a>
			</div>
			 <c:forEach var="orderconVo" items="${ticketlist}" end="3"> 
				<div class="myorder_add2">
				<a class="mypage_ticket" data-oconid="${orderconVo.oconid}" data-date="${orderconVo.odate}">
					<img src="http://localhost:9000/images/${orderconVo.movieorderposter}.jpg">
				</a>
				</div>			
			</c:forEach> 
		     </c:when>
		     <c:otherwise>
		
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
				영화를 예매하러 갈까요? <br>(네이버 회원은 통합 회원으로 전환 시 확인 가능합니다)</p>
				<a id="mypagegoorder" class="orderbtn">
					<img src="http://localhost:9000/images/neworderbtn.png"></a>
			</div>		

	</c:otherwise>
		     </c:choose>
		</section>
		<section class="myreview">
			<div class="myreview_header" id="myreview_header_json" data-id="${sessionScope.svo.id}">
				<h1>My리뷰</h1>
			</div>
			
			<%-- <table class="table table-bordered" style="width: 90%;">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일자</th>
				</tr>
			 
				<c:forEach var="boardMaster" items="${boardMaster}">
				<tr>
					<td>${boardMaster.rno}</td>
					<td><a href="board_content.do?bid=${boardMaster.mid }">[${boardMaster.movieName}]${boardMaster.btitle}</a></td>
					<td>${boardMaster.bhits}</td>
					<td>${boardMaster.bdate}</td>
				</tr>
				</c:forEach> --%>
				
				<!-- <tr>
					<td colspan="5">
					<p>아직 작성한 리뷰가 없습니다. 리뷰를 쓰러 갈까요?</p>
						<a href="board_write.do" class="writebtn">
							<img src="http://localhost:9000/images/writebtn.png">
						</a>
					</td>
				</tr> -->
				<!-- <tr>
					<td colspan="5">
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span></a>
							</li>
							    <li class="page-item"><a class="page-link" href="#">1</a></li>
							    <li class="page-item"><a class="page-link" href="#">2</a></li>
							    <li class="page-item"><a class="page-link" href="#">3</a></li>
							    <li class="page-item">
							 <a class="page-link" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					  </ul>
					</nav>
					</td>
				</tr> -->
			<!-- </table> -->
		</section>
		<div class="container">
		<hr>
			<section class="productordercon">
				<div class="myreview_header">
					<h1>My상품구매내역 목록</h1>
				</div>

				<c:choose>
				<c:when test="${not empty productOrderList}">
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
						<c:forEach var="productList" items="${productOrderList}">
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
				</c:when>
				<c:otherwise>
					<div class="myproductorder_text">
						<br>
						<br>
						<br>
						<br>
						<br>
						<p>아직 구매한 상품이 없습니다.
							상품을 구매하러 갈까요? <br>(네이버 회원은 통합 회원으로 전환 시 확인 가능합니다)</p>
						<a href="http://localhost:9000/store/combo" class="orderbtn">
							<img src="http://localhost:9000/images/buybtn.png"></a>
					</div>

				</c:otherwise>
				</c:choose>


			</section>
		</div>
	</div>
	<!-- Content -->

	<div class="modal-bg"></div>
	<div class="modal-wrap">
		<span id="mypageModalGuide">*내 정보 수정 전 본인 확인이 필요합니다!</span>
		<span id="mypageModalTitle">비밀번호 입력</span>
		<input type="password" name="mypagePassCheck" id="mypagePassCheck">
		<button type="button" class="modalConfirm">확인</button>
		<button type="button" class="modalClose">닫기</button>


	</div>
	
</c:if>
<c:if test="${sessionScope.svo == null}">
  <script>
    // 세션이 null인 경우 리다이렉트 실행
    window.location.href = 'http://localhost:9000/login';
  </script>
</c:if>
	<!-- Footer -->
		<footer>
			<jsp:include page="../footer.jsp" />
		</footer>
	<!-- Footer -->
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