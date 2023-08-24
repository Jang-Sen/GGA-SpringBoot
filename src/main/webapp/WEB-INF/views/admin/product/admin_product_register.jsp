<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
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

.product table{
	text-align: center;
	vertical-align: middle;
}
</style>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../../header.jsp" />
	</header>
	<!-- header -->
	
	<!-- content -->
	<div class="container text-center">
	<div class="product_title">
		<h1>상품 등록</h1>
		</div>
		<section class="product">
			<form name="productVo" action="admin_product_register" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="width: 90%;">
				<tr>
					<th>상품명</th>
					<td><input type="text" name="pname" class="form-control"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="pprice" placeholder="숫자만 입력해주세요" class="form-control"></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="pcategory" class="form-control">
							<option value="combo(콤보)">콤보</option>
							<option value="popcorn(팝콘)">팝콘</option>
							<option value="beverage(음료)">음료</option>
							<option value="card(상품권)">상품권</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="file1" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="btn btn-outline-secondary">등록 완료</button>
						<a href="http://localhost:9000/admin_product_list/1">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>