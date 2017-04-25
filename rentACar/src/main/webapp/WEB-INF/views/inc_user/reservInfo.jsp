<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<div class="container">
	<br>
	<form class="form-horizontal" name="insertReservInfo" id="insertReservInfo" method="post" action="<c:url value='/inc_user/reservation.do' />">
		<fieldset>
			<legend>예약자 정보 입력</legend>
		<!-- 선택한 기간 정보 -->
		<div class="form-group">
				선택하신 예약 기간: ${param.searchStartDate} ${param.startHour}:${param.startMin} 
				~ ${param.searchEndDate} ${param.endHour}:${param.endMin}
				<!-- 테스트 끝나면 hidden으로 재 설정 -->
				<input type="hidden" name="searchStartDate" value="${param.searchStartDate}">
				<input type="hidden" name="startHour" value="${param.startHour}">
				<input type="hidden" name="startMin" value="${param.startMin}">
				<input type="hidden" name="searchEndDate" value="${param.searchEndDate}">
				<input type="hidden" name="endHour" value="${param.endHour}">
				<input type="hidden" name="endMin" value="${param.endMin}">
				<input type="hidden" name="ccarCarId" value="${car.ccarCarId }">	
		</div>
		
		<!-- 선택한 차에 대한 정보 -->
		<div class="form-group">
			<p>선택한 차 ID: ${car.ccarCarId }</p>
			<p>선택한 차 모델: ${car.carCode }</p>			
			<p>블랙박스 유무: ${car.ccarBlackboxYn }</p>
			<p>흡연 가능여부: ${car.ccarSmokeYn }</p>
			<p>후방카메라 유무: ${car.ccarRearCameraYn }</p>
			<p>...등</p>
		</div>
		
		<!-- 예약자 및 운전자 입력 정보 -->
		<h4>예약자 정보 입력</h4>
		<div class="form-group">			
			<label class="col-sm-2 control-label">예약자 이름</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resUName" id="resUName">
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label">이메일</label>
			<div class="col-xs-2">
				<input class="form-control" type="email" name="resUMail" id="resUMail">
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label">연락처</label>
			<div class="col-xs-2">
				<select class="form-control" name="resUTel1" id="resUTel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select>			
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resUTel2" id="resUTel2">
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resUTel3" id="resUTel3">
			</div>
		</div>
		<br>
		<h4>운전자 정보 입력</h4>
		<div class="form-group">			
			<label class="col-sm-2 control-label">운전자 이름</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvName" id="resDrvName">
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label">면허증</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvCategory" id="resDrvCategory">
			</div>
		</div>
		<div class="form-group">			
			<label class="col-sm-2 control-label">연락처</label>
			<div class="col-xs-2">
				<select class="form-control" name="resDrvTel1" id="resDrvTel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select>			
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvTel2" id="resDrvTel2">
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvTel3" id="resDrvTel3">
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">생년월일</label>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="resDrvBirth" id="resDrvBirth">
			</div>
		</div>
		
		<div class=form-group>
			<label class="col-sm-2 control-label"></label>		
			<div class="col-sm-6">
				<input class="btn btn-primary btn-lg btn-block" type="submit" value="예약하기" name="btsubmit" id="btsubmit" >
			</div>
		</div>
		
		</fieldset>
	</form>
	<br>
</div>
<%@ include file="bottom.jsp"%>