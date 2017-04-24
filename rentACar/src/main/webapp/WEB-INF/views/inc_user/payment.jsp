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
			    merchant_uid : 'reserv_' + new Date().getTime(),
			    name : '주문명:${param.ccarCarId} 예약기간: ${param.searchStartDate}~${param.searchEndDate}',
			    amount : 100, /* 테스트 가격은 현재 100원 고정. 후에 가격계산되어 바꾸는걸로 */
			    buyer_tel : '${reserVo.userTel1}-${reserVo.userTel2}-${reserVo.userTel3}',
			    buyer_email : '${param.resUMail}',
			    custom_data : '{"reservNum":"${reserVo.reservNum}"}' /* 예약번호(PK) 저장 */
			}, function(rsp) {
			    if ( rsp.success ) {		    	
			    	$.ajax({
			    		url:'<c:url value="/inc_user/payOK.do" />',
			    		type:'POST',
			    		data:{payNo:rsp.merchant_uid, reservNum:rsp.custom_data.reservNum, 
								userTel1:${reserVo.userTel1},
								userTel2:${reserVo.userTel2},
								userTel3:${reserVo.userTel3},
								payMethod:rsp.pay_method,
								payMoney:rsp.paid_amount,
								payRegdateUnixTimeStamp:rsp.paid_at,
								payCondition:rsp.status},
			    		dataType:'json',
			    		success:function(res){
			    			$("#payInfo").html("<span> 결제 정보 입력 완료 </span>");
			    		},error:function(xhr, status, error){
			    			$("#payInfo").html("<span> 결제 정보 입력 실패 </span>");
			    		}			    		
			    	});			    	
			    	/* 
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num; */
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }			    
			});
		});
	});
</script>
<br>
<div class="divList container" id="payInfo">
	<form class="form-horizontal" name="payForm" id="payForm" method="post">
		<fieldset>
			<legend>결제하기</legend>
			<input type="hidden" name="payNo">
			<div class=form-group>
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-6">
					<input class="btn btn-primary btn-lg btn-block" type="button" value="결제하기" name="bt_pay" id="bt_pay" >
				</div>
			</div>
		</fieldset>
	</form>
</div>
</body>
</html>