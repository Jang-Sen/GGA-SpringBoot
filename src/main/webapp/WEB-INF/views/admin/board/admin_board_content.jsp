<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${board.btitle}</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
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
section.board table {
	text-align:center;
	margin:auto;
}
.binput{
	width:95%;
	border-color:#ddd;
}
.btextarea{
	width:95%;
	border-color:#ddd;
}
.table th, .table td {
	vertical-align: middle;
}
.table tr:last-child td {
text-align:center;
}

img{
	height:50px;
	width:117px;
	cursor:pointer;
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
		<section class="board">
			<h1>게시판</h1>
			<form name="contentForm" action="boardDeleteProc?bid=${ boardVo.bid }"  method="post">
				<table class="table table-bordered" style="width: 90%;">
					<tr>
						<th>제목</th>
						<td>${ boardVo.btitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							${ boardVo.bcontent }<br>
						</td>
					</tr>
					<tr>
						<th>평점</th>
						<td>${ boardVo.score }</td>
						
					</tr>
					<tr>
						<th>조회수</th>
						<td>${ boardVo.views }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${ boardVo.mid }</td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>${ boardVo.bdate }</td>
					</tr>					
					<tr>
						<td colspan="4">
						<a href ="boardUpdate?bid=${ boardVo.bid }">
							<img id="boardUpdate" src="http://localhost:9000/images/editbtn.png"></a>
							<img id="boardDelete" src="http://localhost:9000/images/deletebtn.png">
							<a href="boardList">
								<img src="http://localhost:9000/images/listbtn.png"></a>
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