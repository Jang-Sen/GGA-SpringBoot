$(document).ready(function(){

	/******************************
		notice_list paging
	******************************/
	initAjax(1);

	function initAjax(page){
		$.ajax({
			url: "notice_list/" + page ,
			success : function(notice){

				//dhtml을 활용하여 테이블로 출력
				let output = "<table class='table table-bordered' id='notice_json' style='width: 90%;'>";
				output += "<tr><th>번호</th><th>제목</th><th>조회수</th><th>작성일자</th></tr>";
				
				for(obj of notice.list){
					output += "<tr>";
					output += "<td>"+ obj.rno +"</td>";
					output += "<td><a href="+"'"+"notice_content.do?nid="+obj.nid+"'>"+obj.ntitle+"</a></td>";
					output += "<td>"+ obj.nhits +"</td>";
					output += "<td>"+ obj.ndate +"</td>";
					output += "</tr>";
				}
				
				output += "<tr>";
				output += "<td colspan='5'><div id ='ampaginationsm'></div></td>";
				output += "</tr>";
				output += "</table>";
				
				//output을 출력
				$("#notice_json").remove();
				$("div.notice_search").after(output);
				
				//페이징 처리 함수 호출
				pager(notice.page.dbCount, notice.page.pageCount, notice.page.pageSize, notice.page.reqPage);
				
				//페이지 번호 클릭 이벤트 처리
				jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   		jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           	//$(location).attr('href', "http://localhost:9000/gga_plz/notice_list_json_data.do?page="+e.page);
	           	
	           	initAjax(e.page);         
	    });
				
			}//success
		
		});//ajax
	}//initAjax
	

	/***********************************************
		notice_list arrayList_when searching sth
	***********************************************/
	$("#btnNoticeSearch").click(function(){
		if($("#ntitle").val() == ""){
			alert("공지사항 제목을 입력해주세요.");
			$("#ntitle").focus();
			return false;
		}else{
			$("#nid").remove();
				initAjax(1);
					function initAjax(page){
						$.ajax({
							url: "http://localhost:9000/gga_plz/notice_search_json_data.do?ntitle="+$("#ntitle").val()+"&page="+page ,
							success : function(result){
								let jdata = JSON.parse(result);
								let output = "<table class='table table-bordered' id='notice_json' style='width: 90%;'>";
								output += "<tr><th>번호</th><th>제목</th><th>조회수</th><th>작성일자</th></tr>";
								
								for(obj of jdata.jlist){
									output += "<tr>";
									output += "<td>"+ obj.rno +"</td>";
									output += "<td><a href="+"'"+"notice_content.do?nid="+obj.nid+"'>"+obj.ntitle+"</a></td>";
									output += "<td>"+ obj.nhits +"</td>";
									output += "<td>"+ obj.ndate +"</td>";
									output += "</tr>";
								}
								
								output += "<tr>";
								output += "<td colspan='5'><div id ='ampaginationsm'></div></td>";
								output += "</tr>";
								output += "</table>";
								
								//output을 출력
								$("#notice_json").remove();
								$("div.notice_search").after(output);
								
								pager(jdata.totals, jdata.maxSize, jdata.pageSize, jdata.page);
								
								jQuery('#ampaginationsm').on('am.pagination.change',function(e){
							   		jQuery('.showlabelsm').text('The selected page no: '+e.page);
					           	//$(location).attr('href', "http://localhost:9000/gga_plz/notice_list_json_data.do?page="+e.page);
					           	
					           	initAjax(e.page);         
					 		   });
					
							}//initAjax
						});
					}
				} //if else
			}); //click

		/* 페이징 처리 함수 */
		function pager(totals, maxSize, pageSize, page){
			//alert(totals+","+maxSize+","+pageSize+","+page);
			
			var pager = jQuery('#ampaginationsm').pagination({
			
			    maxSize: maxSize,	    	
			    totals: totals,		
			    page: page,		
			    pageSize: pageSize,		
			
			    // custom labels		
			    lastText: '&raquo;&raquo;', 		
			    firstText: '&laquo;&laquo;',		
			    prevText: '&laquo;',		
			    nextText: '&raquo;',
					     
			    btnSize:'sm'	
			});
		}
	

}); //ready

