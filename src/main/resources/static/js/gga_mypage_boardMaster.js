$(document).ready(function(){
	
	/**************************
		마이페이지 보드 리뷰 테이블
	**************************/
	let id = $("#myreview_header_json").data("id");
	initAjax(1);
	function initAjax(page) {
		$.ajax({
			url:"board_master_json_data.do?id="+id+"&page="+page,
			success : function(result){
			let jdata = JSON.parse(result);
				let output = "<table class='table table-bordered' id='boardMaster' style='width: 90%;'>";
				output += "<tr><th>번호</th>";
				output += "<th>제목</th>";
				output += "<th>조회수</th>";
				output += "<th>작성일자</th></tr>";
				for(obj of jdata.jlist) {
			        output += "<tr>";
			        output += "<td>"+obj.rno+"</td>";
			        if(obj.movieName == "suzume"){
			         	output += "<td><a href="+"'"+"board_content.do?bid="+obj.bid+"'>[스즈매의 문단속]&nbsp</a>";
			       	}else if (obj.movieName == "darknight"){
		 	        	output += "<td><a href="+"'"+"board_content.do?bid="+obj.bid+"'>[다크나이트]&nbsp</a>";
		          	}else if (obj.movieName == "dune"){
		  	        	output += "<td><a href="+"'"+"board_content.do?bid="+obj.bid+"'>[듄]&nbsp</a>";
		          	}else if (obj.movieName == "slamdunk"){
		  	        	output += "<td><a href="+"'"+"board_content.do?bid="+obj.bid+"'>[슬램덩크]&nbsp</a>";
		          	}else if (obj.movieName == "inception"){
		  	        	output += "<td><a href="+"'"+"board_content.do?bid="+obj.bid+"'>[인셉션]&nbsp</a>";
		          	}else if (obj.movieName == "rings"){
		  	        	output += "<td><a href="+"'"+"board_content.do?bid="+obj.bid+"'>[반지의제왕]&nbsp</a>";
		          	}
		          	if(obj.commentCount > 0){
		          		output += "<div class='maxSize'><a href="+"'"+"board_content.do?bid="+obj.bid+"'>"+obj.btitle+"</a>("+obj.commentCount+")</td>";
		          	}else{
		          		output += "<div class='maxSize'><a href="+"'"+"board_content.do?bid="+obj.bid+"'>"+obj.btitle+"</a></td>";
		          	}
				output += "<td>"+obj.bhits+"</td>";
				output += "<td>"+obj.bdate+"</td>";
		        }	
				output += "</tr>";
				output += "<tr><td colspan='5'><div id='ampaginationsm'></td></tr></table>";
				
				$("#boardMaster").remove();
				$("div#myreview_header_json").after(output);
				
				pager(jdata.totals, jdata.maxSize, jdata.pageSize, jdata.page);
			
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