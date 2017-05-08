<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<!-- 차량 상세보기  -->
<script type="text/javascript">
	function fncDelete(){
		if(jQuery("#ccarCarId1").val() == "" || jQuery("#ccarCarId1").val() == null){
			alert("등록 해지할 차량번호를 입력해주세요");
			return false;
		}
		if(jQuery("#readCarId").val() != jQuery("#ccarCarId1").val()){
			alert("차량번호가 일치하지 않습니다.");
			return false;
		} 
		
		jQuery("#form1").attr("method","POST");
		jQuery("#form1").attr("action","<c:url value='/com_manage/company_ccarDelete.do'/>");
		jQuery("#form1").submit();
		
	}
</script>
<div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <legend>차량 상세 정보</legend>
    
    	<colgroup>
    		<col width="25%">
    		<col width="33%">
    		<col width="25%">
    		<col width="*%">
    	</colgroup>
        <tr>
			<td><strong>차량번호</strong></td>
			<td>${map['CCAR_CAR_ID'] }</td>
			<td><strong>모델코드</strong></td>
			<td>${map['CAR_CODE'] }</td>
		</tr>
		<tr>
			<td><strong>모델명</strong></td>
			<td>${map['CAR_NAME'] }</td>
			<td><strong>제조사</strong></td>
			<td>${map['CAR_INC'] }</td>
		</tr>
		<tr>
			<td><strong>연료타입</strong></td>
			<td>${map['CAR_FUEL'] }</td>
			<td><strong>승차인원</strong></td>
			<td>${map['CAR_SIZE'] } 명</td>
		</tr>
		<tr>
			<td><strong>차량유형</strong></td>
			<td>${map['CAR_TYPE'] }</td>
			<td><strong>변속기</strong></td>
			<td>${map['CAR_TRANS'] }</td>
		</tr>
		<tr>
			<td><strong>차량등록일자</strong></td>
			<td><fmt:formatDate value="${map['COMCAR_REGDATE'] }" pattern="yyyy년 MM월 dd일" /></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td><strong>평일 예약가격</strong></td>
			<td colspan="3"><fmt:formatNumber value="${map['CCAR_NORMAL_PRICE'] }"
			 pattern="#,###"/>원</td>
		</tr>
		<tr>
			<td><strong>주말 예약가격</strong></td>
			<td colspan="3"><fmt:formatNumber value="${map['CCAR_WEEKEND_PRICE'] }"
			 pattern="#,###" />원</td>
		</tr>
		<tr>
			<td><strong>성수기 예약가격</strong></td>
			<td colspan="3"><fmt:formatNumber value="${map['CCAR_PEAK_PRICE'] }"
			  pattern="#,###" />원</td>
		</tr>
		<tr>
			<td><strong>극성수기 예약가격</strong></td>
			<td colspan="3"><fmt:formatNumber value="${map['CCAR_S_PEAK_PRICE'] }"
			 pattern="#,###" />원</td>
		</tr>
		<tr>
			<td><strong>차량사용가능여부</strong></td>
			<td colspan="3">
			<input type="checkbox" class = "Yn" name="ccarUseYn" id="ccarUseYn" disabled="true" value="${map['CCAR_USE_YN'] }"		
			 <c:if test="${map['CCAR_USE_YN']=='Y' }">checked</c:if>> 사용가능할경우 체크</td>
		</tr>
		<tr>
			<td><strong>옵션사항</strong></td>
			<td colspan="3">
			<input type="checkbox" class = "Yn" name="ccarBlackboxYn" id="ccarBlackboxYn" disabled="true" value="${map['CCAR_BLACKBOX_YN'] }"
				<c:if test="${map['CCAR_BLACKBOX_YN']=='Y' }">checked</c:if>> 블랙박스
			<input type="checkbox" class = "Yn" name="ccarSmokeYn" id="ccarSmokeYn" disabled="true" value="${map['CCAR_SMOKE_YN'] }"
				<c:if test="${map['CCAR_SMOKE_YN']=='Y' }">checked</c:if>> 금연차
			<input type="checkbox" class = "Yn" name="ccarRearCameraYn" id="ccarRearCameraYn" disabled="true" value="${map['CCAR_REAR_CAMERA_YN'] }"
				<c:if test="${map['CCAR_REAR_CAMERA_YN']=='Y' }">checked</c:if>> 후방카메라 
			<input type="checkbox" class = "Yn" name="ccarRearSenceYn" id="ccarRearSenceYn" disabled="true" value="${map['CCAR_REAR_SENCE_YN'] }"
				<c:if test="${map['CCAR_REAR_SENCE_YN']=='Y' }">checked</c:if>> 후방센서 <br> 
			<input type="checkbox" class = "Yn" name="ccarNaviYn" id="ccarNaviYn" disabled="true" value="${map['CCAR_NAVI_YN'] }"
				<c:if test="${map['CCAR_NAVI_YN']=='Y' }">checked</c:if>> 네비게이션
			<input type="checkbox" class = "Yn" name="ccarSunRoofYn" id="ccarSunRoofYn" disabled="true" value="${map['CCAR_SUNROOF_YN'] }"
				<c:if test="${map['CCAR_SUN_ROOF_YN']=='Y' }">checked</c:if>> 썬루프
			<input type="checkbox" class = "Yn" name="ccarBluetoothYn" id="ccarBluetoothYn" disabled="true" value="${map['CCAR_BLUETOOTH_YN'] }"
				<c:if test="${map['CCAR_BLUETOOTH_YN']=='Y' }">checked</c:if>> 블루투스
			<input type="checkbox" class = "Yn" name="ccarAuxYn" id="ccarAuxYn" disabled="true" value="${map['CCAR_AUX_YN'] }"
				<c:if test="${map['CCAR_AUX_YN']=='Y' }">checked</c:if>> AUX <br>
			<input type="checkbox" class = "Yn" name="ccarSmartkeyYn" id="ccarSmartkeyYn" disabled="true" value="${map['CCAR_SMARTKEY_YN'] }"
				<c:if test="${map['CCAR_SMARTKEY_YN']=='Y' }">checked</c:if>> 스마트키<br>
			 </td>
			
		</tr>
		

            <tr>
				<td class="text-center" colspan="4"><a
					href="<c:url value='/com_manage/company_ccarList.do' />"
					class="btn btn-info btn-xs"><span
						class="glyphicon glyphicon-list"></span>목 록</a> <a
					class='btn btn-warning btn-xs'
					href="<c:url value='/com_manage/company_ccarEdit.do?ccarCarId=${map["CCAR_CAR_ID"] }' />"><span
						class="glyphicon glyphicon-edit"></span>수 정</a> <a
					class='btn btn-danger btn-xs' data-target="#layerpop"
					data-toggle="modal"><span class="glyphicon glyphicon-remove"></span>삭 제</a>
					<div class="modal fade" id="layerpop">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- header -->
								<div class="modal-header">
									<!-- 닫기(x) 버튼 -->
									<button type="button" class="close" data-dismiss="modal">×</button>
									<!-- header title -->
									<h4 class="modal-title">차량등록 해지</h4>
								</div>
								<!-- body -->
								<form id="form1" name="form1">
								<div class="modal-body">
									차량번호1<input type="text" name="readCarId" id="readCarId" disabled="true" value=${map['CCAR_CAR_ID']}>
									모델명<input type="text" name="readCarName" id="readCarName" disabled="true" value="${map['CAR_NAME'] }"><br>
									<br><span style="color:red">등록 해지 하시려는 차량의 차대 번호를 입력하세요.</span><br>
									차량번호<input type="text" name="ccarCarId1" id="ccarCarId1" placeholder="서울가1234">
								</div>
									<button type="button" id="btDelete" class="btn btn-danger"
										data-dismiss="modal" onclick="fncDelete()">삭제</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">취소</button>
								</form>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
    </table>
    </div>
</div>

<%@ include file="../inc_company/company_bottom.jsp" %>