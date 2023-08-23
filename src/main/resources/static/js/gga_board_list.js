$(document).ready(function(){

	/**********************************
		보드 리스트 ajax	 - 첫 화면
	**********************************/
	initAjax(1);
		function initAjax(page) {
			$.ajax({
				url:"//" + page + "/",
				success : function(board) {
		          	let output = "<table class='table table-bordered' id='board_table'style='width: 90%;'>";
		          	output += "<tr>";
		          	output += "<th>번호</th>";
		          	output += "<th>제목</th>";
		         	output += "<th>조회수</th>";
		        	output += "<th>작성자</th>";
		         	output += "<th>작성일자</th>";
		          	output += "</tr>";
		          	for(obj of board.list) {
			          	output += "<tr>";
			          	output += "<td>"+obj.rno+"</td>";
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




			          	if(obj.commentCount > 0){
			          		output += "<div class='maxSize'><a href="+"'"+"boardContent/" + page + "/" + obj.bid + "'>" + obj.btitle + "</a>&nbsp(" + obj.commentCount + ")</td></div>";
			          	}else{
			          		output += "<div class='maxSize'><a href="+"'"+"boardContent/" + page + "/" + obj.bid + "'>" + obj.btitle + "</a></td></div>";
			          	}
			          	output += "<td>"+obj.bhits+"</td>";
			          	output += "<td>"+obj.mid+"</td>";
			          	output += "<td>"+obj.bdate+"</td>";
			          	output += "</tr>";
			          	}
		          	output += "<tr>";
		         	output += "<td colspan='5'><div id='ampaginationsm'></div></td>";
		          	output += "</tr></table>";
				
					$("#board_table").remove();
					$("div.board_choose").after(output);
					
					pager(board.page.dbCount, board.page.pageCount, board.page.pageSize, board.page.reqPage);
			
					jQuery('#ampaginationsm').on('am.pagination.change',function(e){
							jQuery('.showlabelsm').text('The selected page no: '+e.page);
					    	initAjax(e.page);
			         	});
		        } //success
			});// ajax
		}//init
	
	
	
	/**********************************
		보드검색 ajax
	**********************************/
	
	
	$("#btnBoardSearch").click(function(){
		if($("#btitle").val() =="" ){
			alert("게시물 명을 입력해주세요.");
			$("#btitle").focus();
			return false;
		} else{
		$("#board_table_init").remove();
		initAjax(1);
			function initAjax(page){
			
				$.ajax({
			          url:"http://localhost:9000/boardSearch/" + page + "/" + $("#btitle").val() + "/",
			          success: function(boardSearch){
			          	let output = "<table class='table table-bordered' id='board_table'style='width: 90%;'>";
			          	output += "<tr>";
			          	output += "<th>번호</th>";
			          	output += "<th>제목</th>";
			          	output += "<th>조회수</th>";
			          	output += "<th>작성자</th>";
			          	output += "<th>작성일자</th>";
			          	output += "</tr>";
			          	for(obj of boardSearch.list) {
			          	output += "<tr>";
			          	output += "<td>"+obj.rno+"</td>";
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
			          	if(obj.commentCount > 0){
			          		output += "<div class='maxSize'><a href=" + "'" + "boardContent/" + page + "/" + obj.bid + "'>"+obj.btitle+"</a>&nbsp("+obj.commentCount+")</td></div>";
			          	}else{
			          		output += "<div class='maxSize'><a href=" + "'" + "boardContent/" + page + "/" + obj.bid + "'>"+obj.btitle+"</a></td></div>";
			          	}
			          	output += "<td>"+obj.bhits+"</td>";
			          	output += "<td>"+obj.mid+"</td>";
			          	output += "<td>"+obj.bdate+"</td>";
			          	output += "</tr>";
			          	}
			          	output += "<tr>";
			          	output += "<td colspan='5'><div id='ampaginationsm'></div></td>";
			          	output += "</tr></table>";
			          		
						$("#board_table").remove();
			          	$("div.board_choose").after(output);
			          	
			          	pager(boardSearch.page.dbCount, boardSearch.page.pageCount, boardSearch.page.pageSize, boardSearch.page.reqPage);
				
						jQuery('#ampaginationsm').on('am.pagination.change',function(e){
							jQuery('.showlabelsm').text('The selected page no: '+e.page);
					    	initAjax(e.page);
			         	});
			          	}
				}); //ajax
			} //init
		} // if
	}); //click
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



});