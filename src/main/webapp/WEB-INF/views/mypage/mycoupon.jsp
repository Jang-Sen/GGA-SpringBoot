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
	<link rel="stylesheet" href="http://localhost:9000/css/glide.core.min.css">
	<link rel="stylesheet" href="http://localhost:9000/css/glide.theme.min.css">
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

.mycouponbtn {
	margin-left: 60px;
	color: black;
	padding: 3px 6px;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.mycoupon_text{
	display: flex;
	font-size: 30px;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-left: 150px;
}

.mycouponbtn:hover {
	background-color: gray;
}

.glide__slides img{
	width:100%;
	height: 300px;
	margin-bottom: 10px;
}

</style>

</head>
<body>
	<!-- Header -->
		<header>
			<jsp:include page="../header.jsp" />
		</header>


	<!-- Header -->
	<!-- Content -->
	<div class="container">
		<div class= "content" >
			<section class= "mycoupon">
				<div class= "mycoupon_header">
					<img style="width: 300px" src="http://localhost:9000/images/mypagetitle.png">
					<br><br>
				</div>
				<div class="myOrderHeader">
					<h1>내 쿠폰함</h1>
					<a href="http://localhost:/${id}" class="myOrderAll"><h5>마이 페이지</h5></a>
					<br><br>
				</div>
				<c:choose>
					<c:when test="${not empty list}">
						<div class="row mt-4">
							<!-- Loop through your coupon list -->
							<c:forEach items="${list}" var="coupon">
								<div class="col-md-4 mb-4">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">${coupon.couponname}</h5>
											<script>
												var endDate = new Date('${coupon.enddate}');
												var today = new Date();
												var timeDiff = endDate - today;
												var daysRemaining = Math.ceil(timeDiff / (1000 * 3600 * 24)) -1;
												document.write(' 유효 기간: ' + daysRemaining + '일 남음');
											</script>
											<p class="card-text" style="color: #0fc4ff; font-size: 20px">할인 금액 : ${coupon.discount} 원</p>
											<p class="card-text">
												적용 상품 :
												<c:choose>
													<c:when test="${coupon.ccategory == 'product'}">스토어 전용</c:when>
													<c:when test="${coupon.ccategory == 'movie'}">영화 전용</c:when>
													<c:when test="${coupon.ccategory == 'moviefirst'}">영화 전용</c:when>
													<c:otherwise>${coupon.ccategory}</c:otherwise>
												</c:choose>
												<a href="<c:choose>
													  <c:when test='${coupon.ccategory == "product"}'>http://localhost:9000/store/combo</c:when>
													  <c:when test='${coupon.ccategory == "movie" || coupon.ccategory == "moviefirst"}'>http://localhost:9000/order</c:when>
													  <c:otherwise>#</c:otherwise>
														</c:choose>">
												<button class="mycouponbtn" style="margin-left: 40px;">적용 상품</button></a>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
					<c:otherwise>
						<div class="mycoupon_text">
							<br>
							<p>쿠폰함이 비었습니다 ㅠㅠ</p>
							<a href="http://localhost:/${id}">
								<img style="width: 150px" src="http://localhost:9000/images/backbtn.png"></a>
						</div>
					</c:otherwise>
							</c:choose>
				</div>

				<br><br><br><br><br><br>
				<div class = "glides">
					<div class="glide">
						<div class="glide">
							<div class="glide__track" data-glide-el="track">
								<ul class="glide__slides">
									<li class="glide__slide"><img src="http://localhost:9000/images/oppenhelmer.jpg" id="MOVIE_0001" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
									<li class="glide__slide"><img src="http://localhost:9000/images/concreteutopia.jpg" id="MOVIE_0002" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
									<li class="glide__slide"><img src="http://localhost:9000/images/honeysweet.jpg" id="MOVIE_0003" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
									<li class="glide__slide"><img src="http://localhost:9000/images/smugglers.jpg" id="MOVIE_0004" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
									<li class="glide__slide"><img src="http://localhost:9000/images/elemental.jpg" id="MOVIE_0005" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
									<li class="glide__slide"><img src="http://localhost:9000/images/meg2.jpg" id="MOVIE_0006" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
									<li class="glide__slide"><img src="http://localhost:9000/images/amanofreason.jpg" id="MOVIE_0007" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
									<li class="glide__slide"><img src="http://localhost:9000/images/octonauts.jpg" id="MOVIE_0008" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
									<li class="glide__slide"><img src="http://localhost:9000/images/ransomed.jpg" id="MOVIE_0009" class="mimg"/>
										<a class="myPageHeader">
											<img class="myPageHeader" src="http://localhost:9000/images/neworderbtn.png"></a></li>
								</ul>
							</div>
						</div>
						<div class="glide__arrows" data-glide-el="controls">
							<button class="glide__arrow glide__arrow--left" data-glide-dir="<"><</button>
							<button class="glide__arrow glide__arrow--right" data-glide-dir=">">></button>
						</div>
					</div>
				</div>
				<script src="https://cdn.jsdelivr.net/npm/@glidejs/glide"></script>
				<script>
					const config = {
						type : 'carousel',
						perView: 5
					}
					new Glide('.glide', config).mount()
				</script>
			</section>
		</div>
	</div>
	<!-- Content -->


	<!-- Footer -->
		<footer>
			<jsp:include page="../footer.jsp" />
		</footer>
	<!-- Footer -->

</body>
</html>