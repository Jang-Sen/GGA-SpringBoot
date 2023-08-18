<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 삭제</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- 부트스트랩 -->
</head>

<style>
.delete_table{
	margin:auto;
}

table tr:first-child{
padding:none;
text-align:center;
font-size:27px;
position:relative;
}

table tr:last-child td {
text-align:center;
}
.admin_notice{
margin:auto;
}
.bossbaby1{
width:170px;
height:270px;
position:relative;
}
.really{
font-family:Gothic A1;
font-weight:500;
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
		<div class="admin_notice_list_title">
		<img src="http://localhost:9000/images/adminnoticetitle.png">
		</div>
		<section class="admin_notice">
			<form name="deleteForm" action="/admin_notice_delete" method="post">
			<input type = "hidden" name="nid" value = "${notice.nid}">
			<input type = "hidden" name="gfile" value = "${notice.gfile}">
			<input type = "hidden" name="gsfile" value = "${notice.gsfile}">
				<table class="delete_table" style="width: 60%;">
					<tr>
						<td class="really">정말로 삭제 하시겠습니까?</td>
						<img src="http://localhost:9000/images/bossbaby1.png" class="bossbaby1">
					</tr>
					<tr>
						<td colspan="5" >
							<button class="btn btn-outline-secondary" type="button" id="btnNoticeDelete" >삭제하기</button>
							<a href="/admin_notice_content/${page}/${notice.nid}">
							<button class="btn btn-outline-secondary" type="button">이전으로</button></a>
							<a href="/admin_notice_list">
							<button class="btn btn-outline-secondary" type="button">리스트</button></a>
						</td>
					</tr>
				</table>
			</form>
		</section>
	</div>
	
	<!-- footer -->
	<footer>
		<jsp:include page="../../footer.jsp" />
	</footer>
	<!-- footer -->
	
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>