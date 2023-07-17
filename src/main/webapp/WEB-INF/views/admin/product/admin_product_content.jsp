<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gga_plz</title>
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
	
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

.product_title img{
	width:500px;
	height:100px;
	float:left;
	
}

.product table{
	text-align: center;
	vertical-align: middle;
}
</style>
<script>
	var status = "${status}";
	if(status === "true"){
		alert("수정이 완료되었습니다.");
	}
	
	$(document).ready(function(){
		$("#btnProductDelete").click(function(){
			var deletecon = confirm("정말로 삭제하시겠습니까?");
			if(deletecon){
				document.forms["productDeleteForm"].submit();
				alert("삭제 완료 되었습니다");
			} else{
				alert("취소 되었습니다.")
			}
		});

		var categoryCell = document.getElementById("categoryCell");
		var pcategory = "${product.pcategory}";

		if (pcategory === "popcorn") {
			categoryCell.textContent = "팝콘";
		} else if (pcategory === "card") {
			categoryCell.textContent = "상품권";
		} else if (pcategory === "beverage") {
			categoryCell.textContent = "음료";
		} else if (pcategory === "combo") {
			categoryCell.textContent = "콤보";
		} else {
			categoryCell.textContent = pcategory;
		}
	});
</script>
<body>
	<!-- header -->
	<header>
		<jsp:include page="../../header.jsp" />
	</header>
	<!-- header -->
	
	<!-- content -->
	<div class="container">
	<div class="product_title">
		<img src="http://localhost:9000/images/adminstoretitle.png">
		</div>
		<section class="product">
			<form name="productDeleteForm" action="/admin_product_delete" method="post">
			<table class="table table-bordered" style="width: 90%;">
				<tr>
					<th>상품ID</th>
					<td>${product.pid}</td>
					<input type="hidden" name="pid" value="${product.pid}"></td>
					<input type="hidden" name="page" value="${page}"></td>
					<input type="hidden" name="gsfile" value="${product.gsfile}"></td>
				</tr>
				<tr>
					<th>상품 명</th>
					<td>${product.pname}</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${product.pprice}원</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td id="categoryCell"></td>
				</tr>
				<tr>
					<th>이미지</th>
						<td><c:if test="${product.gsfile != null}"><img style="width : 150px"src="http://localhost:9000/upload/${product.gsfile}"></c:if></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<a href="/admin_product_update/${product.pid}/${page}">
							<button type="button" class="btn btn-outline-secondary">수정하기</button></a>
						<button type="button" class="btn btn-outline-secondary" id="btnProductDelete">삭제하기</button>
						<a href="http://localhost:9000/admin_product_list/${page}">
						<button type="button" class="btn btn-outline-secondary">이전으로</button></a>
					</td>
				</tr>
			</table>
			</form>
		</section>
	</div>
	<!-- content -->


	<!-- footer -->
	<footer>
		<jsp:include page="../../footer.jsp" />
	</footer>
	<!-- footer -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> 부트스트랩 -->
</body>
</html>