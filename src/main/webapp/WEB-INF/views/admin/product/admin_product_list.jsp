<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
	
</head>
<script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({

			maxSize: '${page.pageCount}',	    		// max page size
			totals: '${page.dbCount}',	// total pages
			page: '${page.reqPage}',		// initial page
			pageSize: '${page.pageSize}',			// max number items per page

			// custom labels
			lastText: '&raquo;&raquo;',
			firstText: '&laquo;&laquo;',
			prevText: '&laquo;',
			nextText: '&raquo;',

			btnSize:'sm'	// 'sm'  or 'lg'
		});

		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			jQuery('.showlabelsm').text('The selected page no: '+e.page);
			$(location).attr('href', "http://localhost:9000/admin_product_list/"+e.page+"/");
		});


		$('#btnProSearch').click(function (){
			let searchType = $('#searchType').val();
			let searchInput = $('#searchInput').val().toUpperCase();
			$.ajax({
				url: '/productSearch/' + searchType + '/' + searchInput ,
				success: function (result) {
					if (result.length >=1) {
						let tableBody = $('#productTableBody');
						tableBody.empty(); // 기존 테이블 데이터 초기화

						for (let i = 0; i < result.length; i++) {
							let product = result[i];
							let row = $('<tr>');
							row.append($('<td>').text(product.rno));
							row.append($('<td>').text(product.pid));
							row.append($('<td>').text(product.pname));
							row.append($('<td>').text(product.pprice + '원'));
							row.append($('<td>').append(
									$('<img>').attr('src', 'http://localhost:9000/upload/' + product.gsfile)
							));
							tableBody.append(row);
						}

						$('#productTableFoot').remove();
					} else {
						alert("검색 결과 없습니다")
					}
				}
			});
		});

	});
</script>
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

.product .btnaddstore{
	background-color:white;
	border:1px solid white;
	
}
.product table tr td a{
	text-decoration:none;
	color:gray;
}
.product .addproductbtn {
	float:right;
	
}
.product table td img{
	width:150px;
	
}
#searchType{
	text-align: center;
}
</style>


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
			<table class="table" style="width: 90%;">
				<tr>
					<td colspan="4">
						<div class="row">
							<div class="col-3">
								<select id="searchType" class="form-control">
									<option value="pname">상품명</option>
									<option value="pcategory">분류</option>
									<option value="naca">상품명+분류</option>
								</select>
							</div>
							<div class="col">
								<input type="text" id="searchInput" class="form-control">
								<input type="hidden" id="page" value="${page}">
							</div>
							<div class="col-2">
								<button type="button" id="btnProSearch" class="btn btn-secondary">검색</button>
							</div>

						</div>
					</td>
					<td colspan="1">
						<a class="addproductbtn" href="http://localhost:9000/admin_product_register">
						<button type="button" class="btnaddstore"><img src="http://localhost:9000/images/addstorebtn.png"></button></a>
						<br><br>
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<th>상품ID</th>
					<th>상품 명</th>
					<th>가격</th>
					<th>이미지</th>
				</tr>
				<tbody id="productTableBody">
				<c:forEach var="product" items="${list}">
				<tr>
					<td>${product.rno}</td>
					<td>${product.pid}</td>
					<td><a href="/admin_product_content/${product.pid}/${page.reqPage}">${product.pname}</a></td>
					<td>${product.pprice}원</td>
					<td><c:if test="${product.gsfile != null}"><img src="http://localhost:9000/upload/${product.gsfile}"></c:if></td>
				</tr>
				</c:forEach>
				</tbody>
				<tfoot id="productTableFoot">
					<tr>
						<td colspan="5"><div id="ampaginationsm"></div></td>
					</tr>
				</tfoot>
			</table>
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