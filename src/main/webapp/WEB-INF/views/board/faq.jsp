<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
	<div class="board_title">
		<img src="http://localhost:9000/images/faqtitle.png">
		</div>
		<section class= "faq">
			<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		     	<strong>Q1. 예매 취소 및 환불 규정은 어떻게 되나요?</strong>
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        ※ 온라인 예매시 홈페이지 내에서만 예매 취소가 가능하며 현장에서 티켓 발권시 온라인에서 예매 취소가 불가합니다.(현장에서 취소 가능)<br><br>
		        <strong>01. 예매 취소</strong><br>
		        <strong>1) 현장 취소를 하는 경우</strong><br>
		        <strong><span style="color: red">상영시간 이전</span></strong>까지만 가능하며, 상영시간 이후 취소 및 환불은 불가합니다.<br><br>
		        
		        <strong>2) 홈페이지에서 예매 취소할 경우</strong><br>
		        부분 취소는 불가합니다.(ex. 홈페이지에서 2장 이상 예매한 경우 예매한 티켓 모두 취소)<br>
		        홈페이지 예매 취소는 영화 방영 시작 시간 <strong><span style= "color: red">1시간 전</span></strong>까지 가능합니다.<br><br>
		        
		        <strong>02. 환불 규정</strong><br>
		        <strong>1) 신용카드</strong><br>
		        결제 후 3일 이내 취소 시 승인 취소되며, 3일 이후 매입 취소시 영업일 기준 3~5일 소요됩니다.<br>
		        <strong>2) 체크카드</strong><br>
		        결제 후 3일 이내 취소 시 당일 카드사에서 환불처리되며, 3일 이후 매입 취소 시 카드사에 따라 3~10일 소요됩니다.<br><br>
		        * 더 자세한 내용이 필요하신 고객 분들께서는 070-0000-0000 으로 연락주시기 바랍니다.
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		        <strong>Q2. 이미 예약한 내역의 결제수단을 변경하고 싶어요.</strong>
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        예매 건 취소 후 재결제를 진행 해주셔야 하며, 부분 취소 및 변경은 불가합니다.<br>
		        ※ 변경은 결제하신 영화시간 이전까지만 가능합니다.
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingThree">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		        <strong>Q3. 자차가 없지만 극장을 이용하고 싶어요.</strong>
		      </button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        저희 GGA는 <span style= "color:red"><strong>자동차 쉐어 서비스</strong></span>도 같이 진행 해드리고 있습니다.<br>
		        현장에 오셔서 직원에게 직접 말씀 부탁드립니다.
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
		        <strong>Q4. 타인이 발권할 수 있나요?</strong>
		      </button>
		    </h2>
		    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        본인이 예약 후 타인이 관람하는 경우,<br>
		        사전에 예매하신 영화의 예매번호 혹은 <strong>예매자의 생년월일/휴대폰 번호/차량번호</strong>를 소지하시고 극장에 방문해 주시면 매표소에서 티켓으로 교환 후 관람 가능합니다.
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingFive">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
		        <strong>Q5. GGA 인터넷 예매 시 보안에는 문제 없나요?</strong>
		      </button>
		    </h2>
		    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        GGA 사이트는 한국 TheJoeun사의 IPhone14 Pro를 이용하여 고객 PC에서 서버로 Data를 전송할 때 SRT(64bit)로 암호화가 됩니다.<br>
		        암호화가 된 Data는 더조은 아카데미에서 자체적으로 제공하는(.NET 프레임웍 암호방법) 암호화 프로그램을 이용하여 서버 와 서버간에 암호화가 되며,
		        암호화 된 Data는 공용망을 이용하면 중간에 해킹을 당할 우려가 있어 고객이 입력한 모든 Data는 전용선을 통하여 전달이 되고 있으며, 당사는 고객의 정보를 철저히 보호하고 있습니다.<br>
		        또, 고객님의 카드 비밀번호, 유효기간 등은 따로 보관하지 않고 있으며, 고객님의 개인정보는 정부에서 정하는 방법에 따라 보호 받고, 보호 하고 있습니다.
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingSix">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
		        <strong>Q6. 아이디, 비밀번호를 잊었어요.</strong>
		      </button>
		    </h2>
		    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        홈페이지 상단 [로그인]을 통해 확인하실 수 있으며, '아이디 찾기', '비밀번호 찾기'를 이용하세요.<br><br>
		        <strong>◆ 아이디 찾기</strong><br>
		        - [로그인] → [아이디 찾기] 클릭 시, 인증기관을 통해 본인인증 후 아이디 찾기 가능<br><br>
		        <strong>◆ 비밀번호 찾기</strong><br>	
		        - [로그인] → [비밀번호 찾기] 클릭 시, 아이디 조회 후 TJoeun홈페이지에서 회원정보 수정<br><br>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingSeven">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
		        <strong>Q7. 영화 시간보다 늦었어요. 입장 가능한가요?</strong>
		      </button>
		    </h2>
		    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      온라인으로 예매하신 경우, 티켓 출력 후 영화 시간 내 언제든 입장 가능합니다.<br>
		      다만, 지연 입장으로 인해 관람하지 못하신 영화의 부분은 별도로 관람 및 환불이 불가합니다.<br><br>
		      더불어 현장에서 예매를 진행하셔야 하는 경우<br>
		      현장/홈페이지 상 표기된 영화의 시작시간 10분 후까지 예매 가능한 점<br>
		      해당 시간 내에는 예매 후 입장이 가능하오니 이 점 참고 부탁드립니다.<br>
		      (홈페이지상 12:00 시작 영화로 표기된 경우 12:10 까지 현장 예매 가능)
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="heading8">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse8" aria-expanded="false" aria-controls="collapse8">
		        <strong>Q8. 회원정보 수정, 회원 탈퇴는 어디서 가능한가요?</strong>
		      </button>
		    </h2>
		    <div id="collapse8" class="accordion-collapse collapse" aria-labelledby="heading8" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      홈페이지 상단 [로그인] 후 [마이페이지]에서 회원정보 수정이 가능하며, 회원 탈퇴의 경우 홈페이지 장기미접속자(3년) 인 경우 자동 탈퇴됩니다.<br>
		      직접 변경이 어려우시거나, 회원 탈퇴를 원하시는 경우 고객센터를 이용해주시기 바랍니다.<br><br>
		      <strong>◆ GGA 고객센터 : 0000-0000</strong>
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="heading9">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse9" aria-expanded="false" aria-controls="collapse9">
		        <strong>Q9. 인터넷 예매 후 예매내용 확인은 어떻게 하나요?</strong>
		      </button>
		    </h2>
		    <div id="collapse9" class="accordion-collapse collapse" aria-labelledby="heading9" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		      <strong>인터넷 예매 후 예매내역 확인을 원하시는 경우 다음과 같이 확인하세요.</strong><br><br>
		      ◆ 홈페이지 로그인 → [마이페이지] → [나의 예매내역]
		      </div>
		    </div>
		  </div>
		  
		</div>
		</section>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
	<!-- content -->


	<!-- footer -->
	<footer>
		<jsp:include page="../footer.jsp" />	
	</footer>
	<!-- footer -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>