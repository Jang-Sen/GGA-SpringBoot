<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${notice.ntitle}</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script> <!-- gga_javascript.js -->
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
section.admin_notice table {
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
.table td {
text-align:left;
}
.table tr:last-child td {
text-align:center;
}

img {
width:460px;
height:600px;
}

.admin_content{
border-color:white;
}

.admin_content1{
border-color:white;
}
.noticeImg {
	width: 750px;
	object-fit: scale-down;
}

</style>
<!-- <script>
function cdelete(){
	if(window.confirm("정말로 삭제하시겠습니까?")){
		
	}
}

function cupdate(){
	if(window.confirm("정말로 수정하시겠습니까?")){
		window.location.href="admin_notice_update";
	}
}
</script> -->
<body>
	<!-- header -->
	<header>
		<jsp:include page="../../header.jsp" />
	</header>
	<!-- header -->
	
	
	<!-- content -->
	<div class="container text-center">
		<div class="admin_notice_list_title">
		<img src="http://localhost:9000/images/adminnoticetitle.png">
		</div>
		<section class="admin_notice">
				<table class="table table-bordered" style="width: 90%;">
					<tr>
						<th>제목</th>
						<td>${notice.ntitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							${notice.ncontent }<br><br><br>
							<c:if test="${notice.gsfile != null}">
								<img src="http://localhost:9000/upload/${notice.gsfile}" class="noticeImg">
							</c:if>
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
					<tr class="admin_content1">
						<td colspan="3" class="admin_content">
							<a href="/admin_notice_update/${page}/${notice.nid }">
							<button class="btn btn-outline-secondary" type="button" id="btnNoticeUpdate" >수정하기</button></a>
							
							<a href="/admin_notice_delete/${page}/${notice.nid}">
							<button class="btn btn-outline-secondary" type="button">삭제하기</button></a>
							<a href="/admin_notice_list">
								<button class="btn btn-outline-secondary" type="button">이전으로</button></a>

						</td>				
					</tr>
				</table>
		</section>
	</div>
	<!-- content -->



	<!-- footer -->
	<footer>
		<jsp:include page="../../footer.jsp" />
	</footer>
	<!-- footer -->
	
	
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>