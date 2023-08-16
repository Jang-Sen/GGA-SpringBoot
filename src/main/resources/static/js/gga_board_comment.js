$(document).ready(function(){
	/**********************************
	 6월 7일 추가 커맨트 crud /
	**********************************/
	
	/*** 댓글 삭제 버튼 ***/
	
	$("#commentDelete1").click(function(){
		var bcid = $("#hiddenBcid1").text();
		var page = $("#commentPage").val();
		var confirmResult = confirm("댓글을 삭제할까요?");
		if(confirmResult) {
			$.ajax({
				url:"http://localhost:9000/board_comment_delete/" + bcid,
				success:function(result){
					bid = result;
					location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
				}
			})
		}
	});
	$("#commentDelete2").click(function(){
		var bcid = $("#hiddenBcid2").text();
		var page = $("#commentPage").val();
		var confirmResult = confirm("댓글을 삭제할까요?");
		if(confirmResult) {
			$.ajax({
				url:"http://localhost:9000/board_comment_delete/" + bcid,
				success:function(result){
					bid = result;
					location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
				}
			})
		}
	});
	$("#commentDelete3").click(function(){
		var bcid = $("#hiddenBcid3").text();
		var page = $("#commentPage").val();
		var confirmResult = confirm("댓글을 삭제할까요?");
		if(confirmResult) {
			$.ajax({
				url:"http://localhost:9000/board_comment_delete/" + bcid,
				success:function(result){
					bid = result;
					location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
				}
			})
		}
	});
	$("#commentDelete4").click(function(){
		var bcid = $("#hiddenBcid4").text();
		var page = $("#commentPage").val();
		var confirmResult = confirm("댓글을 삭제할까요?");
		if(confirmResult) {
			$.ajax({
				url:"http://localhost:9000/board_comment_delete/" + bcid,
				success:function(result){
					bid = result;
					location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
				}
			})
		}
	});
	$("#commentDelete5").click(function(){
		var bcid = $("#hiddenBcid5").text();
		var page = $("#commentPage").val();
		var confirmResult = confirm("댓글을 삭제할까요?");
		if(confirmResult) {
			$.ajax({
				url:"http://localhost:9000/board_comment_delete/" + bcid,
				success:function(result){
					bid = result;
					location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
				}
			})
		}
	});
	
	/*** 댓글 업데이트 버튼 ***/
	
	$("#edit1").click(function(){
		var select = $('.commentEdit').attr('id');
		$("#editComment1").css("display","block");
		$("#commentEditSuccess1").css("display","inline");
		$("#commentEditStop1").css("display","inline");
		$("#commentEditSuccess1").click(function(){
			var bcid = $("#hiddenBcid1").text();
			var updateComment = $("#editComment1").val();
			var page = $("#commentPage").val();
			if(updateComment != ""){
				var confirmResult = confirm("수정 하시겠습니까?");
				if(confirmResult){
					$.ajax({
						url:"http://localhost:9000/board_comment_update/" + bcid + "/" + updateComment,
						success:function(result) {
							bid = result;
							location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
						}
					});
				}
			}else {
				alert("내용을 입력하세요.");
				$("#editComment1").focus();
			}	
		});
		$("#commentEditStop1").click(function(){
			$("#editComment1").css("display","none");
			$("#commentEditSuccess1").css("display","none");
			$("#commentEditStop1").css("display","none");
		});
	});
	$("#edit2").click(function(){
		var select = $('.commentEdit').attr('id');
		$("#editComment2").css("display","block");
		$("#commentEditSuccess2").css("display","inline");
		$("#commentEditStop2").css("display","inline");
		$("#commentEditSuccess2").click(function(){
			var bcid = $("#hiddenBcid2").text();
			var updateComment = $("#editComment2").val();
			var page = $("#commentPage").val();
			if(updateComment != ""){
				var confirmResult = confirm("수정 하시겠습니까?");
				if(confirmResult){
					$.ajax({
						url:"http://localhost:9000/board_comment_update/" + bcid + "/" + updateComment,
						success:function(result) {
							bid = result;
							location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
						}
					});
				}
			}else {
				alert("내용을 입력하세요.");
				$("#editComment2").focus();
			}	
		});
		$("#commentEditStop2").click(function(){
			$("#editComment2").css("display","none");
			$("#commentEditSuccess2").css("display","none");
			$("#commentEditStop2").css("display","none");
		});
	});
	$("#edit3").click(function(){
		var select = $('.commentEdit').attr('id');
		$("#editComment3").css("display","block");
		$("#commentEditSuccess3").css("display","inline");
		$("#commentEditStop3").css("display","inline");
		$("#commentEditSuccess3").click(function(){
			var bcid = $("#hiddenBcid3").text();
			var updateComment = $("#editComment3").val();
			var page = $("#commentPage").val();
			if(updateComment != ""){
				var confirmResult = confirm("수정 하시겠습니까?");
				if(confirmResult){
					$.ajax({
						url:"http://localhost:9000/board_comment_update/" + bcid + "/" + updateComment,
						success:function(result) {
							bid = result;
							location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
						}
					});
				}
			}else {
				alert("내용을 입력하세요.");
				$("#editComment3").focus();
			}	
		});
		$("#commentEditStop3").click(function(){
			$("#editComment3").css("display","none");
			$("#commentEditSuccess3").css("display","none");
			$("#commentEditStop3").css("display","none");
		});
	});
	$("#edit4").click(function(){
		var select = $('.commentEdit').attr('id');
		$("#editComment4").css("display","block");
		$("#commentEditSuccess4").css("display","inline");
		$("#commentEditStop4").css("display","inline");
		$("#commentEditSuccess4").click(function(){
			var bcid = $("#hiddenBcid4").text();
			var updateComment = $("#editComment4").val();
			var page = $("#commentPage").val();
			if(updateComment != ""){
				var confirmResult = confirm("수정 하시겠습니까?");
				if(confirmResult){
					$.ajax({
						url:"http://localhost:9000/board_comment_update/" + bcid + "/" + updateComment,
						success:function(result) {
							bid = result;
							location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
						}
					});
				}
			}else {
				alert("내용을 입력하세요.");
				$("#editComment4").focus();
			}	
		});
		$("#commentEditStop4").click(function(){
			$("#editComment4").css("display","none");
			$("#commentEditSuccess4").css("display","none");
			$("#commentEditStop4").css("display","none");
		});
	});
	$("#edit5").click(function(){
		var select = $('.commentEdit').attr('id');
		$("#editComment5").css("display","block");
		$("#commentEditSuccess5").css("display","inline");
		$("#commentEditStop5").css("display","inline");
		$("#commentEditSuccess5").click(function(){
			var bcid = $("#hiddenBcid5").text();
			var updateComment = $("#editComment5").val();
			var page = $("#commentPage").val();
			if(updateComment != ""){
				var confirmResult = confirm("수정 하시겠습니까?");
				if(confirmResult){
					$.ajax({
						url:"http://localhost:9000/board_comment_update/" + bcid + "/" + updateComment,
						success:function(result) {
							bid = result;
							location.replace("http://localhost:9000/board_content/" + page + "/" + bid);
						}
					});
				}
			}else {
				alert("내용을 입력하세요.");
				$("#editComment5").focus();
			}	
		});
		$("#commentEditStop5").click(function(){
			$("#editComment5").css("display","none");
			$("#commentEditSuccess5").css("display","none");
			$("#commentEditStop5").css("display","none");
		});
	});

});
