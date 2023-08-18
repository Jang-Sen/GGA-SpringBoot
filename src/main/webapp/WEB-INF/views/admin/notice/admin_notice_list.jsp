<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항 관리</title>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/gga_jquery.js"></script>
<script src="http://localhost:9000/js/am-pagination.js"></script>
<script src="http://localhost:9000/js/gga_admin_notice_list.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
	<!-- 부트스트랩 -->
<!-- <script>
	$(document).ready(function(){
		var pager = jQuery('#ampaginationsm').pagination({
		
			maxSize: '${maxSize}',
			totals: '${totals}',
			page: '${page}',
			pagesize: '',
					
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/admin_notice_list?page="+e.page);
	    });
		
 	});
</script> -->
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
	margin:auto;
}
section.admin_notice table tr td a { /* 텍스트 언더라인 X */
	color: darkgreen;
	text-decoration: none;
	transition: color 0.3s;
}
section.admin_notice table tr td a:hover {
	color: blue;
}


table tr:last-child {
	border:1px solid white;
}

table tr:last-child nav ul {
	margin-top:30px;
	justify-content:center;
}

table tr, table td{
	vertical-align: middle;
}

table tr:first-child {
	border-top:1px solid white;
	border-right:1px solid white;
	border-left:1px solid white;
	text-align:right;
	position:relative;
}


.admin_notice_search {
	position:absolute;
	margin-left : 50px;
	margin-top : 130px;
	z-index:1;
}

.n_searchbox {
	width:200px;
	heigth:30px;
	margin-right:15px;
	border-radius: 5px;
	border: 0px;
	padding-left:5px;
	opacity:80%;
	padding-top : 2px;
}

.n_searchbutton {
	padding:2px 15px;
	height:25px;
	background: #aed581;
	border-radius:5px;
	border-color:white;
	color: black;
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
			<div class="admin_notice_search">
				<input type="text" placeholder="공지사항 제목을 검색해 주세요." id="ntitle" name="ntitle" class="n_searchbox" >
				<button type="submit" id="btnAdminNoticeSearch" class="n_searchbutton" ><p>검색</p></button>
			</div>
			
			<%-- <table class="table table-bordered" style="width: 90%;">
				<tr>
					<td colspan="4">
						<a href="admin_notice_write" class="writebtn">
							<img src="http://localhost:9000/images/writebtn.png">
						</a>
					</td>
				</tr>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일자</th>
				</tr>
				<c:forEach var="noticevo" items="${list}">
				<tr>
					<td>${noticevo.rno }</td>
					<td><a href="admin_notice_content?nid=${noticevo.nid}">${noticevo.ntitle}</a></td>
					<td>${noticevo.nhits}</td>
					<td>${noticevo.ndate}</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
						<div id = "ampaginationsm"></div>
					</td>
				</tr>
			</table>	 --%>	
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