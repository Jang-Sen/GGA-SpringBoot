$(document).ready(function(){

	$(document).on('click', '.cartitemdelete', function(){
		var did = $(this).data('id');

		$.ajax({
			url: "/cart_delete/"+did,
			success: function(result) {
				reloadModalContent();
			}
		});
	});

	function reloadModalContent() {
		$('#CartModal .modal-content').load('/cartModal', function() {
			$('#CartModal').modal('show');
		});
	}

	$(document).on('click', '#modalkakaopay', function() {
		var totalprice = $(".totaltotalprice").text();

		var data = {
			cidArray: $('.cid').map(function() { return $(this).val(); }).get(),
			pidArray: $('.pid').map(function() { return $(this).val(); }).get(),
			pnameArray: $('.pname').map(function() { return $(this).val(); }).get(),
			ppriceArray: $('.pprice').map(function() { return $(this).val(); }).get(),
			qtyArray: $('.qtyy').map(function() { return $(this).val(); }).get(),
			pfileArray: $('.pfile').map(function() { return $(this).val(); }).get(),
		};
		var IMP = window.IMP;
		IMP.init("imp71285848");

		var today = new Date();
		var hours = today.getHours(); // 시
		var minutes = today.getMinutes();  // 분
		var seconds = today.getSeconds();  // 초
		var milliseconds = today.getMilliseconds();
		var makeMerchantUid = hours +  minutes + seconds + milliseconds;

		if(totalprice == "0"){
			alert("결제할 상품이 없습니다.");
		}else{
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid: "IMP"+makeMerchantUid,
				name : 'GGA 스토어',
				amount : totalprice,
				buyer_email : 'Iamport@chai.finance',
				buyer_name : '아임포트 기술지원팀',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456'
				/* m_redirect_url: "http://localhost:9000/gga_plz/ordercon.do" */
			}, function (rsp) { // callback
				if (rsp.success) {
					console.log(rsp);
					jQuery.ajax({
						url:"product_order_proc.do",
						method:"POST",
						dataType: "json",
						data: JSON.stringify(data),
						contentType: "application/json"
						/*
                        headers: { "Content-Type": "application/json" },
                        data: {
                              imp_uid: rsp.imp_uid,            // 결제 고유번호
                              merchant_uid: rsp.merchant_uid   // 주문번호
                            }
                          */
					}).done(function (data) {
						// 성공시 로직
						$.ajax({
							url:"product_delete_proc.do",
							success:function(result){
								location.replace("http://localhost:9000/gga_plz/productordercon.do");
							}
						});
					})
				} else {
					console.log(rsp);
					alert("결제를 실패했습니다. 잠시후 다시 시도해 주세요.");

				}

			});
		}


	});

	$(document).on('click', '#modalcardpay', function() {
		var totalprice = $(".totaltotalprice").text();

		var IMP = window.IMP;
		IMP.init("imp71285848");

		var today = new Date();
		var hours = today.getHours(); // 시
		var minutes = today.getMinutes();  // 분
		var seconds = today.getSeconds();  // 초
		var milliseconds = today.getMilliseconds();
		var makeMerchantUid = hours +  minutes + seconds + milliseconds;

		if(totalprice == "0"){
			alert("결제할 상품이 없습니다.");
		}else{
			IMP.request_pay({
				pg : 'kcp',
				pay_method : 'card',
				merchant_uid: "IMP"+makeMerchantUid,
				name : 'GGA 스토어',
				amount : totalprice,
				buyer_email : 'Iamport@chai.finance',
				buyer_name : '아임포트 기술지원팀',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시 강남구 삼성동',
				buyer_postcode : '123-456'
				/* m_redirect_url: "http://localhost:9000/gga_plz/ordercon.do" */
			}, function (rsp) { // callback
				if (rsp.success) {
					console.log(rsp);
					jQuery.ajax({
						url:"cart_order_proc.do?price="+totalprice,
						method:"POST",
						headers: { "Content-Type": "application/json" },
						data: {
							imp_uid: rsp.imp_uid,            // 결제 고유번호
							merchant_uid: rsp.merchant_uid   // 주문번호
						}
					}).done(function (data) {
						// 성공시 로직
						location.replace("http://localhost:9000/gga_plz/index.do");
					})
				} else {
					console.log(rsp);
					alert("결제를 실패했습니다. 잠시후 다시 시도해 주세요.");

				}

			});
		}


	});

	$(document).on('change', '.form-control', function() {
		var pid = $(this).data('id');
		var qty = $(this).val();

		$.ajax({
			url: "/cart_update/"+qty+"/"+pid,
			success: function(result) {
				reloadModalContent();
			}
		});
	});

});