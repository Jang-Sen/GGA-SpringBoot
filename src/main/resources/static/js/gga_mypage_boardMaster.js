$(document).ready(function(){
	
	/**************************
		마이페이지 보드 리뷰 테이블
	**************************/
	let id = $("#myReview_header_json").data("id");
	initAjax(1);
	function initAjax(page) {
		$.ajax({
			url:"/board_master_json_data/"+id+"/"+page,
			success : function(result){
				// alert(result.BoardDto[0].btitle);
				// alert(result[0].btitle);
			let jdata = result.BoardDto;
			let page = result.page;
				// alert(result.page.pageSize);
				let output = "<table class='table table-bordered' id='boardMaster' style='width: 90%;'>";
				if(jdata != "") {
					output += "<tr><th>번호</th>";
					output += "<th>제목</th>";
					output += "<th>조회수</th>";
					output += "<th>작성일자</th></tr>";
					for (obj of jdata) {
						output += "<tr>";
						output += "<td>" + obj.rno + "</td>";

						if(obj.movieName == "oppenhelmer"){
							output += "<td><a href="+"'"+"/movieinfo/MOVIE_0001'>[오펜하이머]</a>&nbsp";
						}else if (obj.movieName == "concreteutopia"){
							output += "<td><a href="+"'"+"/movieinfo/MOVIE_0002'>[콘크리트 유토피아]</a>&nbsp";
						}else if (obj.movieName == "honeysweet"){
							output += "<td><a href="+"'"+"/movieinfo/MOVIE_0003'>[달짝지근해: 7510]</a>&nbsp";
						}else if (obj.movieName == "smugglers"){
							output += "<td><a href="+"'"+"/movieinfo/MOVIE_0004'>[밀수]</a>&nbsp";
						}else if (obj.movieName == "elemental"){
							output += "<td><a href="+"'"+"/movieinfo/MOVIE_0005'>[엘리멘탈]</a>&nbsp";
						}else if (obj.movieName == "meg2"){
							output += "<td><a href="+"'"+"/movieinfo/MOVIE_0006'>[메가로돈2]</a>&nbsp";
						}else if (obj.movieName == "amanofreason"){
							output += "<td><a href="+"'"+"/movieinfo/MOVIE_0007'>[보호자]</a>&nbsp";
						}else if (obj.movieName == "octonauts"){
							output += "<td><a href="+"'"+"/movieinfo/MOVIE_0008'>[바다 탐험대 옥토넛 어보브 앤 비욘드]</a>&nbsp";
						}else if (obj.movieName == "ransomed") {
							output += "<td><a href=" + "'" + "/movieinfo/MOVIE_0009'>[비공식작전]</a>&nbsp";
						}

						if (obj.commentCount > 0) {
							output += "<div class='maxSize'><a href=" + "'" + "/boardContent/1/" + obj.bid + "'>" + obj.btitle + "</a>(" + obj.commentCount + ")</td>";
						} else {
							output += "<div class='maxSize'><a href=" + "'" + "/boardContent/1/" + obj.bid + "'>" + obj.btitle + "</a></td>";
						}
						output += "<td>" + obj.bhits + "</td>";
						output += "<td>" + obj.bdate + "</td>";
					}
					output += "</tr>";
					output += "<tr><td colspan='5'><div id='ampaginationsm'></td></tr></table>";

					$("#boardMaster").remove();
					$("div#myReview_header_json").after(output);
				}else {
					output += "<div id='noneReviewBox' style='position: relative; top:80px; font-size: 15pt; padding: 10px; border: 3px dotted lightgray;" +
						"border-radius: 5px'>아직 작성한 리뷰가 없습니다. 리뷰를 쓰러 갈까요?</div>";
					output += "<a href='http://localhost:9000/boardList'><img src='http://localhost:9000/images/writebtn.png' style='height:55px; width: 130px; position: relative; top:80px'></a>"
					$("#boardMaster").remove();
					$("div#myReview_header_json").after(output);
				}
				
				pager(page.dbCount, page.pageCount, page.pageSize, page.page);
      
				jQuery('#ampaginationsm').on('am.pagination.change',function(e){
					jQuery('.showlabelsm').text('The selected page no: '+e.page);
				  	initAjax(e.page);

			    });
				
			} //success
		}); //ajax
	} //initAjax
	
		function pager(totals, maxSize, pageSize, page) {
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: maxSize,	    		// max page size
		    totals: totals,	// total pages
		    page: page,		// initial page 현제 페이지 reqpage
		    pageSize: pageSize,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
	}
	
}); //ready