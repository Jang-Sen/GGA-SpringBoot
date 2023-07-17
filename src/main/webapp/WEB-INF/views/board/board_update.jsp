<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GGA</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
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
</style>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<!-- header -->
	<!-- content -->
	<div class="container text-center">
		<section class="board">
			<h1>수정하기</h1>
			<form name="updateForm" action="/board_update"  method="post" enctype="multipart/form-data">
				<table class="table table-bordered" style="width: 90%;">
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" name="btitle" class="binput" id="btitle" value="${board.btitle }">
							<input type="hidden" name="bid" value="${board.bid}">
							<input type="hidden" name="page" value="${page}">
							<span id="btmsg"></span>
						</td>
					</tr>
					<tr>
						<th>영화 제목</th>
						<td>
							<select class="btn btn-outline-secondary" name="movieName" id="movieName">
								<option value="default">영화 제목</option>
								<option value="suzume">스즈메의 문단속</option>
								<option value="darknight">다크나이트</option>
								<option value="dune">듄</option>
								<option value="slamdunk">슬램덩크</option>
								<option value="inception">인셉션</option>
								<option value="rings">반지의 제왕</option>
							</select>
							<span id="bmmsg"></span>
						</td>
						<th>평점</th>
						<td>
							<select class="btn btn-outline-secondary" name="score" id="score">
								<option value="default">평점</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
							<span id="bsmsg"></span>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea maxlength="200" rows="20" cols="80%" name="bcontent" class="btextarea" id="btextarea">${board.bcontent}</textarea>
							<span id="bcmsg"></span>
						</td>
					</tr>	
				 	<tr>
						<th>파일첨부</th>
						<td>
							<input type="file" name="file1" >
							<input type="hidden" name="file1" >
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button class="btn btn-outline-secondary" type="button" id="btnBoardUpdate">수정완료</button>
							<button class="btn btn-outline-secondary" type="button" id="btnBoardReset">다시쓰기</button>
							<a href="/board_content/${page}/${board.bid}">
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
		<jsp:include page="../footer.jsp" />
	</footer>
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
</body>
</html>