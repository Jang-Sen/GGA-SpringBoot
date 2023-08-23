<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>GGA 예매</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/gga.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		  rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<script>
	$(document).ready(function() {
		$("#email4").change(function (){
			if(!$("#email5").val()==""){
				var oemail = $("#email4").val() + "@" + $("#email5").val();
				$("#oemail").val(oemail);
			}
		});

		$("#email5").change(function () {
			if (!$("#email4").val() == "") {
				var oemail = $("#email4").val() + "@" + $("#email5").val();
				$("#oemail").val(oemail);
			}

		});


		$("#email6").on("change", function(){

			if($("#email6").val() != "default"){
				$("#email5").val($("#email6").val());
				if (!$("#email4").val() == "") {
					var oemail = $("#email4").val() + "@" + $("#email5").val();
					$("#oemail").val(oemail);
				}
			}else {
				$("#email5").val("");
				$("#oemail").val("");

			}
		});

		$("#ophone").mouseout(function () {
			if(!$("#ophone").val()==""){
				var ophone = phoneFormat($("#ophone").val());
				$("#ophone").val(ophone);
			}
		});

		$("#ophone").change(function () {
			if(!$("#ophone").val()==""){
				var ophone = phoneFormat($("#ophone").val());
				$("#ophone").val(ophone);
			}
		});

		function phoneFormat(phoneNumber) {

			const value = phoneNumber.replace(/[^0-9]/g, '');


			if(value.length >9){

				const firstLength = value.length > 9 ? 3 : 2;

				return [

					value.slice(0, firstLength),

					value.slice(firstLength, value.length - 4),

					value.slice(value.length - 4),
				].join('-');

			}else{
				return value;
			}

		}

		var today = new Date().toISOString().split('T')[0];

		var orderDateInput = document.getElementById('orderDate');

		orderDateInput.setAttribute('min', today);

	});
</script>



</head>
<style>
	#orderInfo{
		color: #444451;
		margin-left: 85px;
		margin-top: 100px;
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

	#email6{
		width: auto;
		height: 25px;
	}

	#email4, #email5{
		width: 115px;

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
	<div class="orderTitle">
		<img src="http://localhost:9000/images/ordertitle.png">
		<br>
	</div>



	<div class="ticketBack1">
		<p id="orderInfo">관람을 원하는 영화, 날짜, 시간을 선택해 주세요.</p>
		<article class="cont-select">
			<button class="btn-select">영화를 선택해 주세요.</button>
			<ul class="list-member">
				<li><button type="button" class="orderSelTitle" value="MOVIE_0001" data-poster="oppenhelmer">오펜하이머</button></li>
				<li><button type="button" class="orderSelTitle" value="MOVIE_0002" data-poster="concreteutopia">콘크리트 유토피아</button></li>
				<li><button type="button" class="orderSelTitle" value="MOVIE_0003" data-poster="honeysweet">달짝지근해: 7510</button></li>
				<li><button type="button" class="orderSelTitle" value="MOVIE_0004" data-poster="smugglers">밀수</button></li>
				<li><button type="button" class="orderSelTitle" value="MOVIE_0005" data-poster="elemental">엘리멘탈</button></li>
				<li><button type="button" class="orderSelTitle" value="MOVIE_0006" data-poster="meg2">메가로돈2</button></li>
				<li><button type="button" class="orderSelTitle" value="MOVIE_0007" data-poster="amanofreason">보호자</button></li>
				<li><button type="button" class="orderSelTitle" value="MOVIE_0008" data-poster="octonauts">바다 탐험대 옥토넛 어보브 앤 비욘드</button></li>
				<li><button type="button" class="orderSelTitle" value="MOVIE_0009" data-poster="ransomed">비공식작전</button></li>
			</ul>
		</article>

		<input type="date" max="2023-08-31"
			   id="orderDate" name="orderDate">
		<article class="time-select">
			<button class="btn-timeselect">시간</button>
			<ul class="list-ordertime">
				<li><button type="button" class="orderSelTime">10:00</button></li>
				<li><button type="button" class="orderSelTime">12:00</button></li>
				<li><button type="button" class="orderSelTime">14:00</button></li>
				<li><button type="button" class="orderSelTime">17:30</button></li>
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

		<div class="ticketBack2">
			<ul>
				<li>
					<label><span class="material-symbols-outlined">person</span>  : </label>
					<input type="text" id ="oname" name="oname" placeholder=" 이름">
				</li>
				<li>
					<label><span class="material-symbols-outlined">garage</span>  : </label>
					<input type="text" name="ocarnum" id="ocarnum" placeholder=" 차량번호 ex)00가 0000">
				</li>
				<li>
					<label><span class="material-symbols-outlined">mail</span>  : </label>
					<input type="hidden" name="oemail" id="oemail" >
					<input type="text" name="email4" id="email4"  placeholder=" Email"> @
					<input type="text" name="email5" id="email5" >
					<select id="email6">
						<option value="default">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="nate.com">네이트</option>
						<option value="google.com">구글</option>
						<option value="daum.net">다음</option>
					</select>
				</li>
				<li>
					<label><span class="material-symbols-outlined">call</span>  : </label>
					<input type="text" name="ophone" id="ophone"  numberOnly placeholder=" 전화번호">
				</li>


			</ul>
		</div>

		<!-- 		<button type="button" name="orderformbtn" id="orderformbtn">좌석 선택</button>
         -->
		<div class="ticketBtn" name="orderformbtn" id="orderformbtn">
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