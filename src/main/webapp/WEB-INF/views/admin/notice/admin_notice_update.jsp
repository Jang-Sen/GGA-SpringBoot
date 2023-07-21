<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
.ninput{
	width:95%;
	border-color:#ddd;
}
.ntextarea{
	width:95%;
	border-color:#ddd;
}
</style>
<!-- <script>
function writeCheck(){
	let ntitle = document.getElementById("atitle");
	let ntextarea = document.getElementById("atextarea");
	if(ntitle.value == ""){
		alert("제목를 작성해주세요");
		ntitle.focus();
		return false;
	} else if(ntextarea.value == 0) {
		alert("내용를 작성해주세요");
		ntextarea.focus();
		return false;
	} else {
		writeForm.submit();
	}
}

function checkCount(tagName){
	const tagList = document.getElementsByName(tagName);
	let count = 0;
	for(element of tagList){
		if(element.checked) count++;
	}
	return count;
}

function writeReset(){
	document.getElementById("atitle").value = "";
	document.getElementById("atextarea").value = "";
	document.getElementById("id").focus;
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
		<div class="board_title">
		<img src="http://localhost:9000/images/adminnoticetitle.png">
		</div>
		<section class="admin_notice">
			<form name="updateForm" action="/admin_notice_update"  method="post" enctype="multipart/form-data" >
			<input type= "hidden" name="nid" value="${notice.nid}">
			<input type= "hidden" name="page" value="${page}">
			<input type= "hidden" name="gfile" value="${notice.gfile}">
			<input type= "hidden" name="gsfile" value="${notice.gsfile}">
			<input type = "file" name = "file1">
				<table class="table table-bordered" style="width: 90%;">
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" name="ntitle" class="ninput" id="atitle" value="${notice.ntitle }">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea rows="20" cols="80%" name="ncontent" class="ntextarea" id="atextarea" >${notice.ncontent }</textarea>
						</td>
					</tr>					
					<tr>
						<td colspan="4">
							<button class="btn btn-outline-secondary" type="button" id="btnNoticeUpdateProc">수정완료</button>
							<button class="btn btn-outline-secondary" type="reset" >다시쓰기</button>
							<a href="/admin_notice_content/${page}/${notice.nid }">
								<button class="btn btn-outline-secondary" type="button">이전으로</button></a>
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
	
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>