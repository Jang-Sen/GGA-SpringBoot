<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA-STORE</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />	
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>	
	
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


.card-img-container {
    width: 100%;
    height: 0;
    padding-top: 100%;
    position: relative;
    overflow: hidden;
}

.card-img-container img {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    max-width: 100%;
    max-height: 100%;
}

.card-body {
    text-align: center;
}
</style>
<script>
    $(document).ready(function (){
        $('.productbuybtn').click(function () {
            var result = confirm('정말로 결제하시겠습니까?');
            var pid = $(this).attr('id');
            if (result) {
                window.location.href = '/product_order/'+pid;
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
		<div class="store_title">
		<img src="http://localhost:9000/images/storetitle.png">
            <hr style="border-top-width: 4px;">
            <nav class="d-flex justify-content-left" style="margin-left : 30px;">
                <a href="http://localhost:9000/store/combo" class="nav-link"><span class="text-black text-decoration-none" style="font-size: 21px;">콤보</span></a>
                <span class="mx-3"></span>
                <a href="http://localhost:9000/store/popcorn" class="nav-link"><span class="text-black text-decoration-none" style="font-size: 21px;">팝콘</span></a>
                <span class="mx-3"></span>
                <a href="http://localhost:9000/store/beverage" class="nav-link"><span class="text-black text-decoration-none" style="font-size: 21px;">음료</span></a>
                <span class="mx-3"></span>
                <a href="http://localhost:9000/store/card" class="nav-link"><span class="text-black text-decoration-none" style="font-size: 21px;">상품권</span></a>
            </nav>
            <hr>
		</div>
		<br>
		<c:choose>
			<c:when test="${svo == null }">
				<div class="store_cart">
					    		<a href="http://localhost:9000/login">
									<img src="http://localhost:9000/images/cartimg.png">
								</a></div>
							</c:when>
			<c:otherwise>
				<div class="store_cart"><button type="button" id="store_cart" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#cartModal">
				<img src="http://localhost:9000/images/cartimg.png"></button></div>
			</c:otherwise>
		</c:choose>
        <div class="row">
            <c:forEach var="product" items="${list}">
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-img-container">
                            <img src="http://localhost:9000/upload/${product.gsfile}" alt="Product Image" class="card-img-top">
                        </div>
                        <div class="card-body">
                            <h4>상품명: ${product.pname}</h4>
                            <p>가격: ${product.pprice}원</p>
                            <div class="storebtns">
                                <c:choose>
                                    <c:when test="${svo == null }">
                                        <a href="http://localhost:9000/login">
                                            <img class="cartbtnimg" style="width: 135px" src="http://localhost:9000/images/cartbtn.png">
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="cartbtn" <%--id="popcorncombobtn"--%> id="${product.pid}">
                                            <img class="cartbtnimg" src="http://localhost:9000/images/cartbtn.png"></a>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${svo == null }">
                                        <a class="productbuybtn" class="cartbtn2" id="${product.pid}">
                                            <img src="http://localhost:9000/images/buybtn.png"></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="productbuybtn" class="cartbtn2" id="${product.pid}">
                                            <img src="http://localhost:9000/images/buybtn.png"></a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
			
	
<!-- Moa Modal-->
  <div class="modal fade" id="CartModal" tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    </div>
  </div>
</div>

<div id="buycartModal" class="modal" >
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">결제하기</h4>
          <button type="button" class="cartclosebtn2" id="cartclosebtn3">X</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <p>결제할 수단을 선택해 주세요.</p>
        </div>
        
        <!-- Modal footer -->
        <div class="buycartmodal_footer">
          <button type="button" id="cartkakaopay" class="cartkakaobtn"><img src="http://localhost:9000/images/kakaopay.png"></button>
          <button type="button" id="cartcardpay" class="cartcardbtn"><img src="http://localhost:9000/images/cardpay.png"></button>
        </div>
   </div>
    </div>
</div>

<div id="buyModal" class="modal" >
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">장바구니 추가</h4>
          <button type="button" class="cartclosebtn2" id="cartclosebtn2">X</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
            <p>장바구니에 추가되었습니다. 장바구니를 볼까요?</p>
        </div>
        
        <!-- Modal footer -->
        <div class="footer" id="keepshoppinggocart">
          <button type="button" class="shoppingbtn" id="shoppingbtn"><img src="http://localhost:9000/images/keepshoppingbtn.png"></button>
          <button type="button" class="gocartbtn" id="gocartbtn"><img src="http://localhost:9000/images/gocartbtn.png"></button>
        </div>
        
      </div>
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
</body>
</html>