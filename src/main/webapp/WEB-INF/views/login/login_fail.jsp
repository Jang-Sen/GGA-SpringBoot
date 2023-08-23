<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gga_plz</title>
<script src ="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/css/gga.css"> <!-- gga.css -->
<script src="http://localhost:9000/js/gga_jquery.js"></script> <!-- gga_jquery.js -->
<script src="http://localhost:9000/js/jangwon.js"></script> <!-- gga_jquery.js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> 
	

</head>

<script>
	let loginFail = "${loginFail}";
	if (loginFail == 'nope'){
		alert("존재하지 않는 아이디 혹은 비밀번호 입니다.");
	}
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

.section2{
	display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: stretch;
    flex-basis: 0;
    flex-grow: 1;
    max-width: 100%;
    margin:50px 0;
}

.section2 .card{
		width: 190px;
        float: left;
        border:1px solid white;
}

.section2 img{
	height:230px;
}

.nowtitle img{
		width:250px;
	height:100px;	
	
}

.login{
	margin:auto;
	justify-content: center;
 	align-items: center;
	
}
</style>

<body>
	<!-- header -->
	<header>
		<jsp:include page="../header.jsp" />
	</header>
	<!-- header -->
	
	
	<!-- content -->
	<div class="container">
		<div class="login_title">
		<img src="http://localhost:9000/images/logintitle.png">
		</div>
		<p>일치하지 않는 아이디나 비밀번호 입니다. 정보를 잊으신 경우 '아이디 찾기' 또는 '비밀번호 찾기'를 이용해 주세요.</p>
		<div class="container text-center">
			<section class="login">
				<ul>
					<li>
						<a href= "http://localhost:9000/join.do">
							<img src="http://localhost:9000/images/joinbtn.png" class="loginbtnbtn"></a>
						<a href= "http://localhost:9000/login.do">
							<img src="http://localhost:9000/images/loginbtn.png" class="loginbtnbtn">
						</a>
					</li>
					<li>
						<span><a href="#" id="findIdBtn" >아이디 찾기></a></span>
						<span><a href="http://localhost:9000/login_pwFind.do">비밀번호 찾기></a></span>
					</li>
				</ul>
			</section>
			<div class="section2">
		 		<div class="nowtitle">
			    <img src="http://localhost:9000/images/nowtitle.png">
			    </div>
		 	<div class="row row-cols-1 row-cols-md-5 mb-5 justify-content-center">
		 		<div class="col">
			    	<div class="card mb-4 rounded-3 shadow-sm">
				        	<img src="http://localhost:9000/images/darknight.jpg"
				        		class="mimg" id="MOVIE_0001">
			        	<div class="card-body">
			          	<p class="card-text">다크나이트</p>
			          	<a class="myPageHeader">
						<img src="http://localhost:9000/images/newmyPageHeader.png"></a>
			        	</div>
			     	</div>
		    	</div>
		    	<div class="col">
			    	<div class="card mb-4 rounded-3 shadow-sm">
			        	<img src="http://localhost:9000/images/dune.jpg"
			        		class="mimg" id="MOVIE_0003">
			        	<div class="card-body">
			          	<p class="card-text">듄</p>
			          	<a class="myPageHeader">
						<img src="http://localhost:9000/images/newmyPageHeader.png"></a>
			        	</div>
			     	</div>
		    	</div>
		    	<div class="col">
			    	<div class="card mb-4 rounded-3 shadow-sm">
			        	<img src="http://localhost:9000/images/inception.jpg"
			        		class="mimg" id="MOVIE_0004">
			        	<div class="card-body">
			          	<p class="card-text">인셉션</p>
			          	<a class="myPageHeader">
						<img src="http://localhost:9000/images/newmyPageHeader.png"></a>
			        	</div>
			     	</div>
		    	</div>
		    	<div class="col">
			    	<div class="card mb-4 rounded-3 shadow-sm">
			        	<img src="http://localhost:9000/images/slamdunk.jpg"
			        		class="mimg" id="MOVIE_0009">
			        	<div class="card-body">
			          	<p class="card-text">슬램덩크</p>
			          	<a class="myPageHeader">
						<img src="http://localhost:9000/images/newmyPageHeader.png"></a>
			        	</div>
			     	</div>
		    	</div>
		    	<div class="col">
			    	<div class="card mb-4 rounded-3 shadow-sm">
			        	<img src="http://localhost:9000/images/door.jpg"
			        		class="mimg" id="MOVIE_0002">
			        	<div class="card-body">
			          	<p class="card-text">스즈메</p>
			          	<a class="myPageHeader">
						<img src="http://localhost:9000/images/newmyPageHeader.png"></a>
			        	</div>
			     	</div>
		    	</div>
		
			</div>
		</div>
		</div>
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