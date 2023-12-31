<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${notice.ntitle}</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<script src="http://localhost:9000/js/gga_notice_list.js"></script>
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
section.notice table {
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
.table tr:last-child{
	border:1px solid white;
}
img {
width:460px;
height:600px;
}
.noticeImg {
	width: 750px;
	object-fit: scale-down;
}

</style>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../header.jsp" />	
	</header>
	<!-- header -->
	
	
	<!-- content -->
	<div class="container text-center">
		<div class="boardTitle">
			<img src="http://localhost:9000/images/noticetitle.png">
		</div>
		<section class="notice">
		<form enctype="multipart/form-data">
				<table class="table table-bordered" style="width: 90%;">
					<tr>
						<th>제목</th>
						<td>${notice.ntitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<c:if test="${notice.gsfile != null}">
								<img src="http://localhost:9000/upload/${notice.gsfile}" class="noticeImg">
							</c:if>
							<br>${notice.ncontent }<br><br>
						</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${notice.nhits }</td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>${notice.ndate }</td>
					</tr>		
					<tr>
						<td colspan="2">
							<a href="/notice_list">
								<button class="btn btn-outline-secondary" type="button">이전으로</button></a>
							<a href="http://localhost:9000">
								<button class="btn btn-outline-secondary" type="button">홈으로</button></a>
						</td>				
					</tr>			
				</table>
			</form>
		</section>
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