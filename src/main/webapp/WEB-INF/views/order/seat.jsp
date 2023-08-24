<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>좌석 선택</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<style>
		@import url('https://fonts.googleapis.com/css?family=Lato&display=swap');

		* {
			box-sizing: border-box;
		}

		.container{
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

		.showCase .seat:not(.occupied):hover {
			cursor: default;
			transform: scale(1);
		}
		.showCaseDiv{
			display: inline-block;
		}
		.showCase {
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

		.showCase li {
			clear:both;
			display: flex;
			align-items: center;
			justify-content: center;
			margin: 0 10px;
		}
		.showCase li div{
			display: flex;
		}

		.showCase li small {
			margin-left: 10px;
		}

		.seatRow {
			display: flex;
		}

		.screen {
			background-color: #fff;
			height: 70px;
			width: 200px;
			transform: rotateX(-45deg);
			box-shadow: 0 3px 10px rgba(255, 255, 255, 0.75);
		}

		p.text {
			margin: 5px 0;
		}

		p.text span {
			color: #6feaf6;
		}

		.seatBtn{
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

<header>
	<jsp:include page="../header.jsp" />
</header>

<div class="seatContainer">
	<div class="container">

		<div class="showCaseDiv">
			<ul class="showCase">
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
			<c:forEach var="seatDto" items="${list}" varStatus="status">
				<c:if test="${status.index % 8 == 0}">
					<div class="seatRow">
				</c:if>
				<div class="${seatDto.status}" id="${seatDto.sid}" data-num="${seatDto.snumber}"></div>
				<c:if test="${(status.index + 1) % 8 == 0 || status.last}">
					</div>
				</c:if>
			</c:forEach>

		</div>
		<div class="textAndBtn">
			<p class="text">
				선택한 좌석 :
				<span id="seatCom"></span> 번
			</p>
			<p class="text">

				가격 : <span id="seatTotal">0</span> 원
				<input type="hidden" name="oidInput" id="oidInput" value="${oid}">
			</p>
			<button type="submit" class="seatBtn" id="seatPayBtn" name="seatPayBtn">
				<img src="http://localhost:9000/images/buybtn.png"></button>

		</div>
	</div>

	<footer>
		<jsp:include page="../footer.jsp" />
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			const container = $('.container2');
			const seats = $('.seatRow .seat:not(.occupied)');
			const count = $('#count');
			const total = $('#seatTotal');
			const seatcomcom = $('#seatCom');
			const seatcardbtn = $('#seatcardbtn');
			const seatkakaobtn = $('#seatkakaobtn');

			populateUI();
			let ticketPrice = 30000;

			function setMovieData(movieIndex, moviePrice) {
				localStorage.setItem('selectedMovieIndex', movieIndex);
				localStorage.setItem('selectedMoviePrice', moviePrice);
			}

			function updateSelectedCount() {
				const selectedSeats = $('.seatRow .seat.selected');
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

			container.on('click', '.seatRow .seat:not(.occupied)', function() {
				$(this).toggleClass('selected');
				updateSelectedCount();
			});

			updateSelectedCount();
		});
	</script>
</body>
</html>
