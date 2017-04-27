<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/coupon_style.css" />
<script type="text/javascript">
	$().ready(function(){
		IMP.init('imp33307123');
		
		$("#bt_pay").click(function(){
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : 'reserv_' + new Date().getTime(),
			    name : '주문명:${reserVo.reservNum}, ${param.ccarCarId} ',
			    amount : 100, /* 테스트 가격은 현재 100원 고정. 후에 가격 계산되어 바꾸는걸로 */
			    buyer_tel : '${reserVo.userTel1}-${reserVo.userTel2}-${reserVo.userTel3}',
			    buyer_email : '${param.resUMail}',
			    custom_data : '{"reservNum":"${reserVo.reservNum}"}' /* 예약번호(PK) 저장 */
			}, function(rsp) {
			    if ( rsp.success ) {		    	
			    	$.ajax({
			    		url:'<c:url value="/inc_user/payOK.do" />',
			    		type:'POST',
			    		data:{payNo:rsp.merchant_uid, 
			    			  reservNum:rsp.custom_data.reservNum, 
			    		      userTel1:'${reserVo.userTel1}', /* ${reserVo.userTel1} 작은 따옴표로 덮지 않으면 16진수로 인식 010이 8이된다 */
							  userTel2:'${reserVo.userTel2}',
							  userTel3:'${reserVo.userTel3}',
							  payMethod:rsp.pay_method,
						      payMoney:rsp.paid_amount,
							  payRegdateUnixTimeStamp:rsp.paid_at,
							  payCondition:rsp.status},
			    		dataType:'json',
			    		success:function(res){
			    			alert('결제가 완료됐습니다.');
			    			location.href="<c:url value='/inc_user/confirm.do' />";
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
	
	<!-- 결제 버튼 표시 -->
	<form class="form-horizontal" name="payForm" id="payForm" method="post">
		<fieldset>
			<legend>결제하기</legend>
			
			<!-- 결제하신 예약내용 표시 -->
	<c:set var="priceByReservDays" value="${map['CCAR_NORMAL_PRICE'] }" />
		
		<!-- 선택한 차에 대한 정보 -->
		<div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default coupon">
              <div class="panel-heading" id="head">
                <div class="panel-title" id="title">
                    <img src="*" alt="선택한 업체 로고 이미지">
                    <span class="hidden-xs"> ${map['CAR_NAME'] }</span>
                    <span class="visible-xs"> ${map['CAR_NAME'] }</span>
                </div>
              </div>
              <div class="panel-body">
                <img src='<c:url value="/carImages/${map['CAR_IMG'] }" />' class="coupon-img img-rounded" alt="선택한 차종 이미지">
                <div class="col-md-9">
                    <ul class="items">
                    <c:if test="${map['CCAR_AUX_YN']=='N' && map['CCAR_BLACKBOX_YN']=='N' 
												       && map['CCAR_SMOKE_YN']=='N' && map['CCAR_REAR_CAMERA_YN']=='N' 
												       && map['CCAR_REAR_SENCE_YN']=='N' && map['CCAR_NAVI_YN']=='N' 
												       && map['CCAR_NAVI_YN']=='N' && map['CCAR_SUN_ROOF_YN']=='N' 
												       && map['CCAR_BLUETOOTH_YN']=='N' && map['CCAR_SMARTKEY_YN']=='N' }">
												       <li>등록된 옵션이 없습니다.</li>
					</c:if>
					<c:if test="${map['CCAR_AUX_YN']!='N' }"><li>AUX</li></c:if>
					<c:if test="${map['CCAR_BLACKBOX_YN']!='N' }"><li>블랙박스</li></c:if>
					<c:if test="${map['CCAR_NAVI_YN']!='N' }"><li>네비게이션</li></c:if>
					<c:if test="${map['CCAR_SUN_ROOF_YN']!='N' }"><li>썬루프</li></c:if>
                    </ul>
                </div>
                <div class="col-md-3">
                    <div class="offer">
                        <span class="number"><fmt:formatNumber pattern="#,###" value="${priceByReservDays }" /> </span>
                    </div>
                </div>
                <div class="col-md-12">
                    <p class="disclosure">연락처: ${map['COM_TEL1'] }-${map['COM_TEL2'] }-${map['COM_TEL3'] }</p>
                </div>
              </div>
              <div class="panel-footer">
                <div class="exp">선택하신 예약 기간: ${param.searchStartDate} ${param.startHour}:${param.startMin} 
				~ ${param.searchEndDate} ${param.endHour}:${param.endMin}</div>
              </div>
            </div>
    	</div>
    </div>
			
			<input type="hidden" name="payNo">
			<div class=form-group>
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-8">
					<input class="btn btn-primary btn-lg btn-block" type="button" value="결제하기" name="bt_pay" id="bt_pay" >
				</div>
			</div>
		</fieldset>
	</form>
</div>
</body>
</html>