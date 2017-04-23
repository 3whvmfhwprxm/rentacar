<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function(){
		IMP.init('imp33307123');
		
		$("#bt_pay").click(function(){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 14000,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    
			    alert(msg);
			});
		});
	});
</script>
<br>
<div class="divList container">
	<form class="form-horizontal" name="searchForm" id="searchForm"	method="post">
		<fieldset>
			<legend>결제하기</legend>
			<div class=form-group>
				<label class="col-sm-2 control-label"></label>		
				<div class="col-sm-6">
					<input class="btn btn-primary btn-lg btn-block" type="button" 
						value="결제하기" name="bt_pay" id="bt_pay" >
				</div>
			</div>
		</fieldset>
	</form>
</div>
</body>
</html>