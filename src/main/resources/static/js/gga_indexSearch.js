$(document).ready(function(){
	
	/***********************
		통합검색 - 송지웅 6월 13일
	***********************/
	

	$("#btnSearch").click(function(){
			if($("#searchContent").val() =="" ){
				alert("검색 내용을 입력해주세요.");
				$("#searchContent").focus();
				return false;
			} else{
				$.ajax({
			          url:"http://localhost:9000/gga_plz/indexSearch.do?searchContent="+$("#searchContent").val(),
			          success: function(movieid){
			          	if(movieid == ""){
							alert("상영 예정 없는 영화입니다 다른검색어를 입력해주세요");
			          	}else{
			           	 location.href="http://localhost:9000/gga_plz/movieinfo.do?movieid="+movieid; }
			         	}
					
				});
			}
		});	




















});