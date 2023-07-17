<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GGA MOVIE</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!-- <script src="http://localhost:9000/js/gga_javascript.js"></script> -->  <!-- gga_javascript.js -->
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
	<div class="order_title">
		<img src="http://localhost:9000/images/ordertitle.png">
	</div>



	<div class="ticket_bac1">
		<article class="cont-select">
			<button class="btn-select">영화를 선택해 주세요.</button>
			<ul class="list-member">
				<li><button type="button" class="orderseltitle" value="MOVIE_0001" data-poster="darknight">다크 나이트 라이즈</button></li>
				<li><button type="button" class="orderseltitle" value="MOVIE_0002" data-poster="door">스즈메의 문단속</button></li>
				<li><button type="button" class="orderseltitle" value="MOVIE_0003" data-poster="dune">듄</button></li>
				<li><button type="button" class="orderseltitle" value="MOVIE_0004" data-poster="inception">인셉션</button></li>
				<li><button type="button" class="orderseltitle" value="MOVIE_0007" data-poster="ringsking">반지의 제왕: 왕의 귀환</button></li>
				<li><button type="button" class="orderseltitle" value="MOVIE_0009" data-poster="slamdunk">더 퍼스트 슬램덩크</button></li>
			</ul>
		</article>

		<input type="date" value="today" min="2023-04-01" max="2023-08-31"
			   id="orderdate" name="orderdate">

		<article class="time-select">
			<button class="btn-timeselect">시간</button>
			<ul class="list-ordertime">
				<li><button type="button" class="orderseltime">10:00</button></li>
				<li><button type="button" class="orderseltime">12:00</button></li>
				<li><button type="button" class="orderseltime">14:00</button></li>
				<li><button type="button" class="orderseltime">17:30</button></li>
			</ul>
		</article>
	</div>
	<form name="orderForm" action="/orderProc" method="post">
		<input type="hidden" name="movieid" id="movieid">
		<input type="hidden" name="movieordertitle" id="movieordertitle">
		<input type="hidden" name="odate" id="odate">
		<input type="hidden" name="otime" id="otime">
		<input type="hidden" name="oid" id="oid" value="${oid}">
		<input type="hidden" name="movieorderposter" id="movieorderposter">
		<input type="hidden" name="id" id="orderid" value="${sessionScope.svo.id}">

		<div class="ticket_bac2">
			<ul>
				<li>
					<label><span class="material-symbols-outlined">person</span>  : </label>
					<input type="text" id ="oname" name="oname" class="ticket_name" placeholder=" 이름">
				</li>
				<li>
					<label><span class="material-symbols-outlined">garage</span>  : </label>
					<input type="text" name="ocarnum" id="ocarnum" class="ticket_name" placeholder=" 차량번호">
				</li>
				<li>
					<label><span class="material-symbols-outlined">mail</span>  : </label>
					<input type="text" name="oemail" id="oemail" class="ticket_name" placeholder=" Email">
				</li>
				<li>
					<label><span class="material-symbols-outlined">call</span>  : </label>
					<input type="text" name="ophone" id="ophone" class="ticket_name" placeholder=" 전화번호">
				</li>


			</ul>
		</div>

		<!-- 		<button type="button" name="orderformbtn" id="orderformbtn">좌석 선택</button>
         -->
		<div class="ticket_button" name="orderformbtn" id="orderformbtn">
			<img src="http://localhost:9000/images/seatselbtn.png">
		</div>

	</form>

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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
<script>

	const btn = document.querySelector('.btn-select');
	const list = document.querySelector('.list-member');
	btn.addEventListener('click', () => {
		btn.classList.toggle('on');
	});
	list.addEventListener('click', (event) => {
		if (event.target.nodeName === "BUTTON") {
			btn.innerText = event.target.innerText;
			btn.classList.remove('on');
		}
	});

	const timebtn = document.querySelector('.btn-timeselect');
	const timelist = document.querySelector('.list-ordertime');
	timebtn.addEventListener('click', () => {
		timebtn.classList.toggle('on');
	});
	timelist.addEventListener('click', (event) => {
		if (event.target.nodeName === "BUTTON") {
			timebtn.innerText = event.target.innerText;
			timebtn.classList.remove('on');
		}
	});
</script>
</body>
</html>