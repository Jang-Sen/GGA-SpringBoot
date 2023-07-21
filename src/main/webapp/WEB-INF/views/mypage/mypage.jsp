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
	width : 200px;
}

.productordercon h1{
	font-size:20pt;
}
#ampaginationsm {
	height:30px;
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
					<a href= "http://localhost:9000/mypage_update">내 정보 수정</a> <!-- el태그 memberVo.mid -->
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
				영화를 예매하러 갈까요?</p>
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
					<td><a href="board_content?bid=${boardMaster.mid }">[${boardMaster.movieName}]${boardMaster.btitle}</a></td>
					<td>${boardMaster.bhits}</td>
					<td>${boardMaster.bdate}</td>
				</tr>
				</c:forEach> --%>
				
				<!-- <tr>
					<td colspan="5">
					<p>아직 작성한 리뷰가 없습니다. 리뷰를 쓰러 갈까요?</p>
						<a href="board_write" class="writebtn">
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
						<h1>My상품구매내역</h1>
				</div>
				<table class="table table-bordered" style="width: 90%;">
					<tr>
							<th>이미지</th>
							<th>상품명</th>
							<th>수량</th>
							<th>결제 금액</th>
							<th>주문 번호</th>
							<th>구매 일자</th>
					</tr>
					<c:forEach var="productOrderVo" items="${polist}">
					<tr>
						<td><img src="http://localhost:9000/images/${productOrderVo.gfile}"></td>
						<td>${productOrderVo.pname}</td>
						<td>${productOrderVo.qty}</td>
						<td>${productOrderVo.totalprice}</td>
						<td>${productOrderVo.poid}</td>
						<td>${productOrderVo.podate}</td>
					</tr>
					</c:forEach>
				</table>
			</section>
		</div>
	</div>
	<!-- Content -->
	
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
</body>
</html>