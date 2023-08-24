<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[${board.btitle}]</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<script src="http://localhost:9000/js/gga_board_comment.js"></script>
<script src="http://localhost:9000/js/gga_javascript.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
	<!-- 부트스트랩 -->
</head>
<script>
$(document).ready(function(){
	var pager = jQuery('#ampaginationsm').pagination({
	
	    maxSize: '${page.pageCount}',	    		// max page size
	    totals: '${page.dbCount}',	// total pages
	    page: '${page.reqPage}',		// initial page 현제 페이지 reqpage
	    pageSize: '${page.pageSize}',			// max number items per page
	
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	var bid = '${board.bid}'; 
	
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9000/boardContent/" + e.page + "/" + bid);      /* 페이징 해야함 */
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
section.board table {
	text-align:center;
	margin:auto;
}
div.boardTitle img {
	width:160px;
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

section.board form table img#boardUpdate,
section.board form table img#boardList,
section.board form table img#boardDelete{ /* 버튼이미지 */
	height:50px;
	width:117px;
	cursor:pointer;
}

section.board form table.table img.scoreImg {
	width:30px;
}

.boardImg {
	width: 600px;
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
			<img src="http://localhost:9000/images/comtitle.png">
		</div>
		<section class="board">
			<form name="contentForm" action="/boardDelete"  method="post">
				<table class="table table-bordered" style="width: 90%;">
					<input type = "hidden" name = "bid" value = "${board.bid}">
					<input type = "hidden" name = "gsfile" value = "${board.gsfile}">
					<tr>
						<th>제목</th>
						<td>${board.btitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td style = "word-break: break-all">
							<br>${board.bcontent}<br><br>
								<c:if test="${board.gsfile != null}">
									<img src="http://localhost:9000/upload/${board.gsfile}" class="boardImg">
								</c:if>
						</td>
					</tr>
					<tr>
						<th>평점</th>
						<td>
						<c:forEach begin="1" end="${board.score }">
						<img src="http://localhost:9000/images/score.png" class="scoreImg">
						</c:forEach>
						</td>
						
					</tr>
					<tr>
						<th>조회수</th>
						<td>${board.bhits }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${board.mid }</td>
					</tr>
					<tr>
						<th>작성일자</th>
						<td>${board.bdate }</td>
					</tr>					
					<tr>
						<td colspan="4">
						<c:choose>
							<c:when test="${sessionScope.svo.id != null }">
								<c:if test="${authCheck == 1 }">
									<a href ="/boardUpdate/${page.reqPage}/${board.bid}">
										<img id="boardUpdate" src="http://localhost:9000/images/editbtn.png"></a>
										<img id="boardDelete" src="http://localhost:9000/images/deletebtn.png">
								</c:if>
									<a href="/boardList">
										<img id="boardList"src="http://localhost:9000/images/listbtn.png"></a>
							</c:when>
							<c:otherwise>
								<a href="/boardList">
									<img id="boardList"src="http://localhost:9000/images/listbtn.png"></a>
							</c:otherwise>
						</c:choose>
						</td>				
					</tr>
				</table>
			</form>
			
			<c:choose>
			<c:when test="${sessionScope.svo == null}">
				<img id="commentSample"src="http://localhost:9000/images/commentSample.png">
				<div id="commentLogin"><a href="http://localhost:9000/login">댓글 확인 및 작성은 로그인이 필요합니다.</a></div>
			</c:when>
			<c:otherwise>
			<form id="commentForm" name="commentForm" action="/board_comment"  method="post">
				<input type="hidden" name="sid" value="${sessionScope.svo.id }">
				<input type="hidden" name="page" id="commentPage" value="${page.reqPage}">
				<input type="hidden" name="bid" value="${board.bid}">
				<table border="3" class="comment_box">
					<tr>
						<th colspan="3">댓글 창</th>
					</tr>
					<c:if test="${page.dbCount == 0}">
					<tr>
						<td><input type="text" name="sid" value="${sessionScope.svo.id }" disabled></td>
						<td><textarea maxlength="199" id="bccontent" name="bccontent" placeholder="*200자 이내로 작성해주세요"></textarea></td>
						<td>
							<script>
								date = new Date().toLocaleDateString();
								document.write(date);
							</script>
						</td>
					</tr>
					</c:if>
					<c:if test="${page.dbCount > 0 }">
					<c:forEach var="commentList" items="${comment}">
					<c:set var="i" value="${i+1}"></c:set>
					<tr>
						<td>${commentList.sid }</td>
							<td>
								<div id="commentArea">${commentList.bccontent }
									<c:choose>
										<c:when test="${sessionScope.svo.id == commentList.sid or sessionScope.svo.id eq 'admin'}">
												<a id="commentDelete${i}"><img src="http://localhost:9000/images/commentDelete.png"></a>
												<a id="edit${i}" class="commentEdit" ><img src="http://localhost:9000/images/commentEdit.png"></a>
												<a id="commentEditSuccess${i}" style="display:none"><img src="http://localhost:9000/images/commentEditSuccess.png"></a>
												<a id="commentEditStop${i}" style="display:none"><img src="http://localhost:9000/images/commentEditStop.png"></a>
												<div class="hiddenEdit" <%-- id="${commentList.bcid}" --%> >
													<textarea id="editComment${i}" name="editComment" placeholder="${commentList.bccontent }&#13;&#10;*200자 이내로 작성해주세요" style="display:none"></textarea>
												</div>
										</c:when>
									</c:choose>
									<div class="hiddenBcid" id="hiddenBcid${i}" style="display:none" >${commentList.bcid }</div>
								</div>
							</td>
						<td>${commentList.bcdate }</td>
					</tr>
					</c:forEach>
					<tr>
						<td><input type="text" name="commentSid" value="${sessionScope.svo.id }" disabled></td>
						<td><textarea maxlength="199" id="bccontent" name="bccontent" placeholder="*200자 이내로 작성해주세요"></textarea></td>
						<td>
							<script>
								date = new Date().toLocaleDateString();
								document.write(date);
							</script>
						</td>
					</tr>
					</c:if>
					<tr id="conetentPage">
						<td colspan="5"><div id="ampaginationsm"></div></td>
					</tr>
				</table>
					<button class="btn btn-outline-secondary" type="button" id="btnBoardComment">등록완료</button>
					<button class="btn btn-outline-secondary" type="reset">다시쓰기</button>
			</form>
			</c:otherwise>
			</c:choose>
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