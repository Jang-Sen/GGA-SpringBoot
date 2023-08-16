$(document).ready(function(){
	
	/**************************
		마이페이지 보드 리뷰 테이블
	**************************/
	let id = $("#myreview_header_json").data("id");
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
						if (obj.movieName == "suzume") {
							output += "<td><a href=" + "'" + "/movieinfo/MOVIE_0002'>[스즈매의 문단속]&nbsp</a>";
						} else if (obj.movieName == "darknight") {
							output += "<td><a href=" + "'" + "/movieinfo/MOVIE_0001'>[다크나이트]&nbsp</a>";
						} else if (obj.movieName == "dune") {
							output += "<td><a href=" + "'" + "/movieinfo/MOVIE_0003'>[듄]&nbsp</a>";
						} else if (obj.movieName == "slamdunk") {
							output += "<td><a href=" + "'" + "/movieinfo/MOVIE_0009'>[슬램덩크]&nbsp</a>";
						} else if (obj.movieName == "inception") {
							output += "<td><a href=" + "'" + "/movieinfo/MOVIE_0004'>[인셉션]&nbsp</a>";
						} else if (obj.movieName == "rings") {
							output += "<td><a href=" + "'" + "/movieinfo/MOVIE_0007'>[반지의제왕]&nbsp</a>";
						}
						if (obj.commentCount > 0) {
							output += "<div class='maxSize'><a href=" + "'" + "/board_content/1/" + obj.bid + "'>" + obj.btitle + "</a>(" + obj.commentCount + ")</td>";
						} else {
							output += "<div class='maxSize'><a href=" + "'" + "/board_content/1/" + obj.bid + "'>" + obj.btitle + "</a></td>";
						}
						output += "<td>" + obj.bhits + "</td>";
						output += "<td>" + obj.bdate + "</td>";
					}
					output += "</tr>";
					output += "<tr><td colspan='5'><div id='ampaginationsm'></td></tr></table>";

					$("#boardMaster").remove();
					$("div#myreview_header_json").after(output);
				}else {
					output += "<div id='noneReviewBox' style='position: relative; top:80px; font-size: 15pt; padding: 10px; border: 3px dotted lightgray;" +
						"border-radius: 5px'>아직 작성한 리뷰가 없습니다. 리뷰를 쓰러 갈까요?</div>";
					output += "<a href='http://localhost:9000/board_list'><img src='http://localhost:9000/images/writebtn.png' style='height:55px; width: 130px; position: relative; top:80px'></a>"
					$("#boardMaster").remove();
					$("div#myreview_header_json").after(output);
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