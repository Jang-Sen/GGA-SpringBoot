$(document).ready(function(){

	/**********************************
		admin_notice_list paging
	**********************************/
	initAjax(1);

	function initAjax(page){
		$.ajax({
			url: "admin_notice_list/" + page ,
			success : function(admin_notice){

				let output = "<table class='table table-bordered'  id='admin_notice_json' style='width: 90%;'>";
				output += "<tr><td colspan='4'>";
				output += "<a href='/admin_notice_write' class='writebtn'>";
				output += "	<img src='http://localhost:9000/gga_plz/images/writebtn.png'></a>";
				output += "</td></tr>";
				output += "<tr><th>번호</th><th>제목</th><th>조회수</th><th>작성일자</th></tr>";
				
				for(obj of list){
					output += "<tr>";
					output += "<td>"+ obj.rno +"</td>";
					output += "<td><a href="+"'"+"admin_notice_content.do?nid="+obj.nid+"'>"+obj.ntitle+"</a></td>";
					output += "<td>"+ obj.nhits +"</td>";
					output += "<td>"+ obj.ndate +"</td>";
					output += "</tr>";
				}
				
				output += "<tr>";
				output += "<td colspan='5'><div id='ampaginationsm'></div></td>";
				output += "</tr>";
				output += "</table>";
				
				
				//output을 출력
				$("#admin_notice_json").remove();
				$("div.admin_notice_search").after(output);
				
				//페이징 처리 함수 호출
				pager(admin_notice.page.dbCount, admin_notice.page.pageCount, admin_notice.page.pageSize, admin_notice.page.reqPage);
				
				//페이지 번호 클릭 이벤트 처리
				jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   		jQuery('.showlabelsm').text('The selected page no: '+e.page);
			   		
	           	initAjax(e.page);         
	    });
				
			}//success
		
		});//ajax
	}//initAjax
	
	
	/******************************************************
		admin_notice_list arrayList_when searching sth
	*******************************************************/
	$("#btnAdminNoticeSearch").click(function(){
		if($("#ntitle").val() == ""){
			alert("공지사항 제목을 입력해주세요.");
			$("#ntitle").focus();
			return false;
		}else{
			$("#nid").remove();
				initAjax(1);
					function initAjax(page){
						$.ajax({
							url: "http://localhost:9000/gga_plz/admin_notice_search_json_data.do?ntitle="+$("#ntitle").val()+"&page="+page ,
							success : function(result){
								let jdata = JSON.parse(result);
			
								let output = "<table class='table table-bordered'  id='admin_notice_json' style='width: 90%;'>";
								output += "<tr><td colspan='4'>";
								output += "<a href='admin_notice_write.do' class='writebtn'>";
								output += "	<img src='http://localhost:9000/gga_plz/images/writebtn.png'></a>";
								output += "</td></tr>";
								output += "<tr><th>번호</th><th>제목</th><th>조회수</th><th>작성일자</th></tr>";
								
								for(obj of jdata.jlist){
									output += "<tr>";
									output += "<td>"+ obj.rno +"</td>";
									output += "<td><a href="+"'"+"admin_notice_content.do?nid="+obj.nid+"'>"+obj.ntitle+"</a></td>";
									output += "<td>"+ obj.nhits +"</td>";
									output += "<td>"+ obj.ndate +"</td>";
									output += "</tr>";
								}
								
								output += "<tr>";
								output += "<td colspan='5'><div id='ampaginationsm'></div></td>";
								output += "</tr>";
								output += "</table>";
								
								
								//output을 출력
								$("#admin_notice_json").remove();
								$("div.admin_notice_search").after(output);
								
								//페이징 처리 함수 호출
								pager(jdata.totals, jdata.maxSize, jdata.pageSize, jdata.page);
								
								//페이지 번호 클릭 이벤트 처리
								jQuery('#ampaginationsm').on('am.pagination.change',function(e){
							   		jQuery('.showlabelsm').text('The selected page no: '+e.page);
							   		
					           	initAjax(e.page);         
					    });
								
							}//success
						
						});//ajax
					}//initAjax
	}//else
	});//click
	
	
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







