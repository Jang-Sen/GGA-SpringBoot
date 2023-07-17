<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>통합 검색</title>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/gga_board_list.js"></script>
	<script src="http://localhost:9000/js/gga_jquery.js"></script>
	<link rel="stylesheet" href="http://localhost:9000/css/gga.css">
	
	</head>
<body>
<!-- header -->
		<jsp:include page="header.jsp" />
	<!-- header -->
	
	<!-- content -->
	<c:if test="${firstSearch != '' }">
		<input type="hidden" id="firstSearch" value="${firstSearch }">
	</c:if>
	<%--<c:choose> 
		<c:when test="${firstSearch != ''}">
			<input type="text" id="firstSearch" value="${firstSearch }">
		</c:when>
		<c:otherwise>
			<input type="text" id="firstSearch" value="0">
		</c:otherwise>
	</c:choose> --%>
	<section class="indexSearch">
	<!-- <div class="noneResult">
		<img src="http://localhost:9000/images/indexSearchNoneResult.png">
			<span class="result1">'스즈매' 검색결과가 없습니다.</span><br>
			<span class="result2">검색내용을 확인 후 다시 검색해주세요!!</span>
		</div>
		
		
		<div class="noneResultGuide">
			<span class="resultGuide">Ex) 영화 제목, 선호 장르, 공지사항 제목, 리뷰 제목, 상품명</span>			
		</div> -->
		<!-- <div class="movieSearch">
			<div class="movieSearchTitle">
				<img src="http://localhost:9000/images/movietitle.png">
			</div>
			<div class="movieSearchResult">
				<div class="movieSearchInfo">
					<a href="#"><img src="http://localhost:9000/images/knife.jpg" class="movieSearchInfoImg" id="MOVIE_0006"></a>
					<a href="#" id="movieTitle">영화이름귀멸의칼날</a>
					<p>장르 액션 3개</p>
				</div>
				<div class="movieSearchInfo">
					<a href="#"><img src="http://localhost:9000/images/knife.jpg" class="movieSearchInfoImg" id="MOVIE_0006"></a>
					<a href="#" id="movieTitle">영화이름귀멸의칼날</a>
					<p>장르 액션 3개</p>
				</div>
				<div class="movieSearchInfo">
					<a href="#"><img src="http://localhost:9000/images/knife.jpg" class="movieSearchInfoImg" id="MOVIE_0006"></a>
					<a href="#" id="movieTitle">영화이름귀멸의칼날</a>
					<p>장르 액션 3개</p>
				</div>
				<a href="#" id="moreResult">'N'개 더보기 ></a>
			</div>
		</div> 
			
		<div class="noticeSearch">
			<div class="noticeSearchResult">
				<div class="noticeSearchTitle">
					<img src="http://localhost:9000/images/noticetitle.png">
					<p>*조회수 많은 순</p>
				</div>
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일자</th>
					</tr>
					<tr>
						<td>1</td>
						<td>공지사항 제목</td>
						<td>공지사항 조회수</td>
						<td>공지사항 작성일자</td>
					</tr>
					<tr>
						<td>1</td>
						<td>공지사항 제목</td>
						<td>공지사항 조회수</td>
						<td>공지사항 작성일자</td>
					</tr>
					<tr>
						<td>1</td>
						<td>공지사항 제목</td>
						<td>공지사항 조회수</td>
						<td>공지사항 작성일자</td>
					</tr>
				</table>
				<span>총 'N'개의 게시물이 검색 되었습니다.
					<a href="#" id="moreResult2">'N'개 더보기 ></a>
				</span>
			</div>
		</div>
		
		<div class="boardSearch">
			<div class="boardSearchResult">
				<div class="boardSearchTitle">
					<img src="http://localhost:9000/images/boardtitle.png">
					<p>*조회수 정렬</p>
				</div>
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성자</th>
						<th>작성일자</th>
					</tr>
					<tr>
						<td>1</td>
						<td>공지사항 제목</td>
						<td>공지사항 조회수</td>
						<td>공지사항 작성자</td>
						<td>공지사항 작성일자</td>
					</tr>
					<tr>
						<td>1</td>
						<td>공지사항 제목</td>
						<td>공지사항 조회수</td>
						<td>공지사항 작성자</td>
						<td>공지사항 작성일자</td>
					</tr>
					<tr>
						<td>1</td>
						<td>공지사항 제목</td>
						<td>공지사항 조회수</td>
						<td>공지사항 작성자</td>
						<td>공지사항 작성일자</td>
					</tr>
				</table>
				<span>총 'N'개의 게시물이 검색 되었습니다.
					<a href="#" id="moreResult2">'N'개 더보기 ></a>
				</span>
			</div>
		</div>
		
		<div class="movieSearch">
			<div class="movieSearchTitle" id="storeSearchTitle">
				<img src="http://localhost:9000/images/storetitle.png">
			</div>
			<div class="movieSearchResult">
				<div class="movieSearchInfo" id="storeSearchInfo">
					<a href="#"><img src="http://localhost:9000/images/popcorn.png" class="movieSearchInfoImg" id="MOVIE_0006"></a>
					<a href="#" id="movieTitle">상품명 팝콘팝콘</a>
				</div>
				<div class="movieSearchInfo" id="storeSearchInfo">
					<a href="#"><img src="http://localhost:9000/images/popcorn.png" class="movieSearchInfoImg" id="MOVIE_0006"></a>
					<a href="#" id="movieTitle">상품명 팝콘팝콘</a>
				</div>
				<div class="movieSearchInfo" id="storeSearchInfo">
					<a href="#"><img src="http://localhost:9000/images/popcorn.png" class="movieSearchInfoImg" id="MOVIE_0006"></a>
					<a href="#" id="movieTitle">상품명 팝콘팝콘</a>
				</div>
				<a href="#" id="moreResult">'N'개 더보기 ></a>
			</div>
		</div> -->
		
		
	</section>
	
	
	<!-- content -->

	<!-- footer -->
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
	<!-- footer -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK
	/7HAuoJl+0I4" crossorigin="anonymous"></script> <!-- 부트스트랩 -->
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	41da9f6853bb6c551d69442f2f310e83"></script>
	    <script type="text/javascript">
	
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.49463712100352, 127.02989249594765), //지도의 중심좌표.
				level: 2 //지도의 레벨(확대, 축소 정도)
			};
		
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var markerPosition  = new kakao.maps.LatLng(37.49463712100352, 127.02989249594765); 

			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			marker.setMap(map);
	</script>
</body>

	<!-- 카카오톡 채널 추가  -->
	<!-- <script>
	  window.kakaoAsyncInit = function() {
	    Kakao.Channel.createAddChannelButton({
	      container: '#kakao-talk-channel-add-button',
	    });
	  };
	
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
	    js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
	    js.crossOrigin = 'anonymous';
	    fjs.parentNode.insertBefore(js, fjs);
	  })(document, 'script', 'kakao-js-sdk');
	</script> -->

	<!-- 카카오톡 톡상담 -->
	<script>
	  window.kakaoAsyncInit = function() {
	    Kakao.Channel.createChatButton({
	      container: '#kakao-talk-channel-chat-button',
	    });
	  };
	
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
	    js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
	    js.crossOrigin = 'anonymous';
	    fjs.parentNode.insertBefore(js, fjs);
	  })(document, 'script', 'kakao-js-sdk');
	</script>
</html>