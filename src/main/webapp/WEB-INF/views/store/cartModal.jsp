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
<script src="http://localhost:9000/js/modal_jquery.js"></script>
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


		.card {
	        float:left;
	        margin:auto;
	        text-align:center;
	        width: 300px;
  			height: 300px;
	        display:inline-block;
	        }
	 

			card img {
			  height: 300px;
			  width: 100%;
			} 
			.orderbtn{
			/* margin-left:55px; */
			height:50px;
			width:160px;
			} 
</style>
<body>
	
	
	 <c:if test="${not empty list}">
	<!-- content -->
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title" id="exampleModalLabel">
          장바구니
        </h5>
        <button type="button" class="cartclosebtn" data-dismiss="modal" aria-label="Close" id="cartclosebtn">
          X
        </button>
      </div>
      <div class="modal-content">
        <table class="table table-image">
          <thead>
            <tr>
              <th scope="col"></th>
              <th scope="col">상품명</th>
              <th scope="col">가격</th>
              <th scope="col">수량</th>
              <th scope="col">합계</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
          <c:set var = "total" value = "0" />
          <c:forEach var="cart" items="${list}">
            <tr>
              <td class="w-25">
                <img src="http://localhost:9000/upload/${cart.gsfile}" class="img-fluid img-thumbnail" alt="Sheep">
              </td>
              <td>${cart.pname}</td>
              <td>${cart.pprice}</td>
              <td class="qty"><input type="text" class="form-control" id="qtyinput" data-id="${cart.pid}" value="${cart.qty}"></td>
              <td class="cartpprice">${cart.totalprice}</td>
              <c:set var= "total" value="${total + cart.totalprice}"/>
              <td>
                <button type="button" class="cartitemdelete" data-id="${cart.pid}">삭제</button>
              </td>
            </tr>
		          <input type="hidden" class="cid" value="${cart.cid}">
		          <input type="hidden" class="pid" value="${cart.pid}">
		          <input type="hidden" class="pname" value="${cart.pname}">
		          <input type="hidden" class="pprice" value="${cart.pprice}">
		          <input type="hidden" class="qtyy" value="${cart.qty}">
		          <input type="hidden" class="gfile" value="${cart.gfile}">
            </c:forEach>
          </tbody>
        </table> 
        <div class="carttotalprice justify-content-end">
          <h5>합계: <span class="totaltotalprice" id="totaltotalprice"><c:out value="${total}"/></span></h5>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="modalkakaopay" class="btn btn-success" data-dismiss="modal">
    <img src="http://localhost:9000/images/kakaopay.png"></button>
        <button type="button" id="modalcardpay" class="btn btn-success" data-dismiss="modal">
    <img src="http://localhost:9000/images/cardpay.png"></button>
      </div>
			
			
	 </c:if>
  <c:if test="${empty list}">		
			
			
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title" id="exampleModalLabel">
          장바구니
        </h5>
        <button type="button" class="cartclosebtn" data-dismiss="modal" aria-label="Close" id="cartclosebtn">
          X
        </button>
      </div>
      <div class="modal-content">
      <img class="emptycartimg" src="http://localhost:9000/images/emptycart.png">
      
      <a class="emptycartclass">
	<img class="cartbtnimg" src="http://localhost:9000/images/emptycartbtn.png"></a>

      </div>

		</c:if>	
			
	<!-- content -->


	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>