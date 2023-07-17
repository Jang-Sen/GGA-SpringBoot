<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>gga_plz</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- <link rel="stylesheet" href="http://localhost:9000/css/gga.css">  --><!-- gga.css -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!-- <script src="http://localhost:9000/js/gga_javascript.js"></script> --> <!-- gga_javascript.js -->
	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">  -->
	<!-- 부트스트랩 -->
	<style>
		@import url('https://fonts.googleapis.com/css?family=Lato&display=swap');

		* {
			box-sizing: border-box;
		}

		.container{
			/* display: flex; */
			justify-content: center;
			align-content: center;

		}
		.container2 {
			display:inline-block;

			background-color: #242333;
			perspective: 1000px;
			margin-bottom: 30px;
			padding:30px;
		}

		.seat {
			background-color: #444451;
			height: 15px;
			width: 20px;
			margin: 3px;
			border-top-left-radius: 10px;
			border-top-right-radius: 10px;
		}

		.seat.selected {
			background-color: #6feaf6;
		}

		.seat.occupied {
			background-color: #fff;
		}

		.seat:nth-of-type(2) {
			margin-right: 18px;
		}

		.seat:nth-last-of-type(2) {
			margin-left: 18px;
		}

		.seat:not(.occupied):hover {
			cursor: pointer;
			transform: scale(1.2);
		}

		.showcase .seat:not(.occupied):hover {
			cursor: default;
			transform: scale(1);
		}
		.showcasediv{
			display: inline-block;
		}
		.showcase {
			align-items: center;
			width:350px;
			background-color: rgba(0, 0, 0, 0.1);
			padding: 5px 10px;
			border-radius: 5px;
			color: #777;
			list-style-type: none;
			display: flex;
			justify-content: space-between;
		}

		.showcase li {
			clear:both;
			display: flex;
			align-items: center;
			justify-content: center;
			margin: 0 10px;
		}
		.showcase li div{
			display: flex;
		}

		.showcase li small {
			margin-left: 10px;
		}

		.seatrow {
			display: flex;
		}

		.screen {
			background-color: #fff;
			height: 70px;
			width: 200px;
			/* margin: 15px 0; */
			transform: rotateX(-45deg);
			box-shadow: 0 3px 10px rgba(255, 255, 255, 0.75);
		}

		p.text {
			margin: 5px 0;
		}

		p.text span {
			color: #6feaf6;
		}

		.seatbtn{
			margin-top:20px;
			width:100px;
			padding:5px;
		}
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
</head>

<body>
<!-- header -->
<header>
	<jsp:include page="../header.jsp" />
</header>
<!-- header -->
<!-- content -->
<div class="seatcontainer">
	<div class="container">

		<div class="showcasediv">
			<ul class="showcase">
				<li>
					<div class="seat"></div>
					<small>이용 가능</small>
				</li>

				<li>
					<div class="seat selected"></div>
					<small>선택</small>
				</li>

				<li>
					<div class="seat occupied"></div>
					<small>이용 불가</small>
				</li>
			</ul>
		</div>
		<br>

		<div class="container2">
			<div class="screen"></div>
			<c:forEach var="seatVo" items="${list}" varStatus="status">
				<c:if test="${status.index % 8 == 0}">
					<div class="seatrow">
				</c:if>
				<div class="${seatVo.status}" id="${seatVo.sid}" data-num="${seatVo.snumber}"></div>
				<c:if test="${(status.index + 1) % 8 == 0 || status.last}">
					</div>
				</c:if>
			</c:forEach>


			<!-- <div class="seatrow">
              <div class="seat" id="S_0001" data-num="0"></div>
              <div class="seat" id="S_0002" data-num="1"></div>
              <div class="seat" id="S_0003" data-num="2"></div>
              <div class="seat" id="S_0004" data-num="3"></div>
              <div class="seat" id="S_0005" data-num="4"></div>
              <div class="seat" id="S_0006" data-num="5"></div>
              <div class="seat" id="S_0007" data-num="6"></div>
              <div class="seat" id="S_0008" data-num="7"></div>
            </div>

            <div class="seatrow">
              <div class="seat" id="S_0009" data-num="8"></div>
              <div class="seat" id="S_0010" data-num="9"></div>
              <div class="seat" id="S_0011" data-num="10"></div>
              <div class="seat" id="S_0012" data-num="11"></div>
              <div class="seat occupied" id="S_0013" data-num="12"></div>
              <div class="seat" id="S_0014" data-num="13"></div>
              <div class="seat" id="S_0015" data-num="14"></div>
              <div class="seat" id="S_0016" data-num="15"></div>
            </div>

            <div class="seatrow">
              <div class="seat" id="S_0017" data-num="16"></div>
              <div class="seat" id="S_0018" data-num="17"></div>
              <div class="seat" id="S_0019" data-num="18"></div>
              <div class="seat" id="S_0020" data-num="19"></div>
              <div class="seat" id="S_0021" data-num="20"></div>
              <div class="seat" id="S_0022" data-num="21"></div>
              <div class="seat occupied" id="S_0023" data-num="22"></div>
              <div class="seat occupied" id="S_0024" data-num="23"></div>
            </div>

            <div class="seatrow">
              <div class="seat" id="S_0025" data-num="24"></div>
              <div class="seat" id="S_0026" data-num="25"></div>
              <div class="seat" id="S_0027" data-num="26"></div>
              <div class="seat" id="S_0028" data-num="27"></div>
              <div class="seat" id="S_0029" data-num="28"></div>
              <div class="seat" id="S_0030" data-num="29"></div>
              <div class="seat" id="S_0031" data-num="30"></div>
              <div class="seat" id="S_0032" data-num="31"></div>
            </div>

            <div class="seatrow">
              <div class="seat" id="S_0033" data-num="32"></div>
              <div class="seat" id="S_0034" data-num="33"></div>
              <div class="seat" id="S_0035" data-num="34"></div>
              <div class="seat occupied" id="S_0036" data-num="35"></div>
              <div class="seat occupied" id="S_0037" data-num="36"></div>
              <div class="seat" id="S_0038" data-num="37"></div>
              <div class="seat" id="S_0039" data-num="38"></div>
              <div class="seat" id="S_0040" data-num="39"></div>
            </div>

            <div class="seatrow">
              <div class="seat" id="S_0041" data-num="40"></div>
              <div class="seat" id="S_0042" data-num="41"></div>
              <div class="seat" id="S_0043" data-num="42"></div>
              <div class="seat" id="S_0044" data-num="43"></div>
              <div class="seat occupied" id="S_0045" data-num="44"></div>
              <div class="seat occupied" id="S_0046" data-num="45"></div>
              <div class="seat occupied" id="S_0047" data-num="46"></div>
              <div class="seat" id="S_0048" data-num="47"></div>
            </div> -->
		</div>
		<div class="textandbtn">
			<p class="text">
				선택한 좌석 :
				<span id="seatcom"></span> 번
			</p>
			<p class="text">
				<!-- 선택한 좌석은 총 <span id="count">0</span> 좌석이며,  -->
				가격 : <span id="seattotal">0</span> 원
				<input type="text" name="oidinput" id="oidinput" value="${oid}">
			</p>

			<button type="submit" class="seatbtn" id="seatcardbtn" name="seatcardbtn">
				<img src="http://localhost:9000/images/cardpay.png"></button>
			<button type="submit" class="seatbtn" id="seatkakaobtn" name="seatkakaobtn">
				<img src="http://localhost:9000/images/kakaopay.png"></button>
		</div>
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

	<!--  <script src="script.js"></script> -->
	<script>
		$(document).ready(function() {
			const container = $('.container2');
			const seats = $('.seatrow .seat:not(.occupied)');
			const count = $('#count');
			const total = $('#seattotal');
			const seatcomcom = $('#seatcom');
			const seatcardbtn = $('#seatcardbtn');
			const seatkakaobtn = $('#seatkakaobtn');

			populateUI();
			let ticketPrice = 30000;

			function setMovieData(movieIndex, moviePrice) {
				localStorage.setItem('selectedMovieIndex', movieIndex);
				localStorage.setItem('selectedMoviePrice', moviePrice);
			}

			function updateSelectedCount() {
				const selectedSeats = $('.seatrow .seat.selected');
				const seatsIndex = selectedSeats.map(function() {
					return $(this).data('num');
				}).get();

				localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));

				const selectedSeatsCount = selectedSeats.length;
				total.text(selectedSeatsCount * ticketPrice);
				seatcomcom.text(seatsIndex.join(','));
			}

			function populateUI() {
				const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));
				if (selectedSeats !== null && selectedSeats.length > 0) {
					selectedSeats.forEach(function(seatNum) {
						seats.filter(function() {
							return $(this).data('num') === seatNum;
						}).addClass('selected');
					});
				}

				const selectedMovieIndex = localStorage.getItem('selectedMovieIndex');
				if (selectedMovieIndex !== null) {
					// movieSelect.prop('selectedIndex', selectedMovieIndex);
				}
			}

			container.on('click', '.seatrow .seat:not(.occupied)', function() {
				$(this).toggleClass('selected');
				updateSelectedCount();
			});

			updateSelectedCount();
		});
	</script>
</body>
</html>