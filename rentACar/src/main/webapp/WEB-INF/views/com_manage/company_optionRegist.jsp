<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$(".Yn").click(function(){
			if($('#ccarUseYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarBlackboxYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarSmokeYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarRearCameraYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarRearSenceYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarNaviYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarSunRoofYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarBluetoothYn').is(":checked")){
				$(this).val('Y');
			}else if($('#ccarSmartkeyYn').is(":checked")){
				$(this).val('Y');
			}
			
		});
		
	});
	
</script>
<h2>차량 옵션 등록 페이지</h2>
<br>
<hr>
<h3>차량등록</h3>

<div class="divList container">
		<form class="form-horizontal" id="frm1" method="post"
			action='<c:url value="/administrator/company/companyRegister.do" />'>
			<fieldset>
			<legend>Register</legend>
				<div class="form-group">
					<label for="CompanyId" class="col-sm-2 control-label">Company
						Id</label>
					<div class="col-sm-2">
						<input type="text" class="form-control" name="CompanyId"
							id="CompanyId" placeholder="Company Id">
					</div>
					<div>
						<button type="button" class="btn btn-info btn-md"
							data-toggle="modal" data-target=".bs-example-modal-lg">Check</button>
						<div class="modal fade bs-example-modal-lg" tabindex="-1"
							role="dialog" aria-labelledby="myLargeModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header modal-header-primary">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											×
										</button>
										<h1>Check</h1>
									</div>
									<div class="modal-body">
										<label for="checkComId">아이디</label> <input type="text"
											id="checkComId" name="checkComId" value="${comVo.comId}">
										<button type="button" id="checkCompanyId">
											Check Id
										</button>
										<c:if test="${result==EXIST_ID}">
											<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
										</c:if>
									</div>
									<div class="modal-footer">
										<c:if test="${result==NONE_EXIST_ID}">
											<button type="button" class="btn btn-default pull-rigth"
												id="checkId" data-dismiss="modal">
												<i class="fa fa-check" aria-hidden="true"></i>
											</button>
										</c:if>
										<button type="button" class="btn btn-default pull-rigth"
											data-dismiss="modal">
											<i class="fa fa-times" aria-hidden="true"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="CompanyName" class="col-sm-2 control-label">
						Company Name
					</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="CompanyName"
							id="CompanyName" placeholder="Company Name">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyPwd" class="col-sm-2 control-label">
						Company Password
					</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="CompanyPwd"
							id="CompanyPwd" placeholder="Company Password">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyPwd" class="col-sm-2 control-label">Password
						Check</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" name="CompanyPwd2"
							id="chkCompanyId" placeholder="Company CompanyPwd2">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyNo" class="col-sm-2 control-label">Company
						No</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="CompanyNo"
							id="CompanyNo" placeholder="Company No">
					</div>
				</div>
				<div class="form-group">
					<label for="comAccNum" class="col-sm-2 control-label">Company
						Account</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="comAccNum"
							id="comAccNum" placeholder="Company Account">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyTel1" class="col-sm-2 control-label">Company
						Tel</label>
					<div class="col-xs-2">
						<select class="form-control" name="CompanyTel1" id="CompanyTel1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</div>
					<div class="col-xs-2">
						<input class="form-control" type="text" name="CompanyTel2"
							id="CompanyTel2" maxlength="4" placeholder="Company Tel2">
					</div>
					<div class="col-xs-2">
						<input class="form-control" type="text" name="CompanyTel3"
							id="CompanyTel3" maxlength="4" placeholder="Company Tel3">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyMobile" class="col-sm-2 control-label">Company
						Mobile</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyMobile1"
							id="CompanyMobile1" placeholder="Company Mobile1">
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyMobile2"
							id="CompanyMobile2" placeholder="Company Mobile2">
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyMobile3"
							id="CompanyMobile3" placeholder="Company Mobile3">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyFax" class="col-sm-2 control-label">Company
						Fax</label>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyFax1"
							id="CompanyFax1" placeholder="Company Fax1">
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyFax2"
							id="CompanyFax2" placeholder="Company Fax2">
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyFax3"
							id="CompanyFax3" placeholder="Company Fax3">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyAddress" class="col-sm-2 control-label">Company
						Address</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="CompanyAddress"
							id="CompanyAddress" placeholder="Company Address">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyCeo" class="col-sm-2 control-label">Company
						Ceo</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" name="CompanyCeo"
							id="CompanyCeo" placeholder="Company Ceo">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyEmail" class="col-sm-2 control-label">Company
						Email</label>
					<div class="col-md-3">
						<input type="email" class="form-control" name="CompanyEmail1"
							id="CompanyEmail1" placeholder="Company Email1">
					</div>
					<div class="col-xs-2">
						<select class="form-control" name="CompanyEmail2"
							id="CompanyEmail2">
							<option value="naver.com">naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="etc">직접입력</option>
						</select>
					</div>
					<div class="col-xs-2">
						<input type="text" class="form-control" name="CompanyEmail3"
							id="CompanyEmail3" placeholder="Company Email3"
							style="visibility: hidden">
					</div>
				</div>
				<div class="form-group">
					<label for="CompanyLogo" class="col-sm-2 control-label">Company
						Logo</label>
					<div class="col-sm-8">
						<input type="file" name="CompanyLogo" id="CompanyLogo"
							placeholder="file">
					</div>
				</div>
				<div class=form-group>
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-8">
							<button class="btn btn-primary btn-lg btn-block" id="btRegister">
								<i class="fa fa-registered" aria-hidden="true"> Register</i>
							</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>



















<form name="frmCO" method="post"
	action="<c:url value='/com_manage/company_optionRegist.do'/>">
	업체아이디<input type="text" name="comID" id="comID">
	차량번호<input type="text" name="ccarCarId" id="ccarCarId">
	<br><br>     
    <strong>차량등록하기</strong>
     모델코드<input type="text" name="carCode" id="carCode">아래 제조사car_INC, 모델명 선택car_name시 자동입력<br><br><hr>
    제조사<select>
    	<option>현대</option>
    	<option>기아</option>
    	<option>르노삼성</option>
    	<option>쉐보레</option>
    	<option>BMW</option>
    </select>
    모델명<select>
    	<option>아반떼</option>
    	<option>쏘나타</option>
    	<option>그렌져</option>
    </select><br><hr>
	<strong>차량사용가능여부</strong><br>
	<input type="checkbox" class = "Yn" name="ccarUseYn" id="ccarUseYn" value="N">사용가능할경우 체크<br><br>
	<h3>옵션등록</h3>
	<input type="checkbox" class="Yn" name="ccarBlackboxYn" id="ccarBlackboxYn">블랙박스 <input
		type="checkbox" class = "Yn" name="ccarSmokeYn" id="ccarSmokeYn">금연차 <input
		type="checkbox" class = "Yn" name="ccarRearCameraYn" id="ccarRearCameraYn">후방카메라 <input
		type="checkbox" class = "Yn" name="ccarRearSenceYn" id="ccarRearSenceYn">후방센서 <br> <input
		type="checkbox" class = "Yn" name="ccarNaviYn" id="ccarNaviYn">네비게이션 <input
		type="checkbox" class = "Yn" name="ccarSunRoofYn" id="ccarSunRoofYn">썬루프 <input
		type="checkbox" class = "Yn" name="ccarBluetoothYn" id="ccarBluetoothYn">블루투스 <input
		type="checkbox" class = "Yn" name="ccarAuxYn" id="ccarAuxYn">AUX <br> <input
		type="checkbox" class = "Yn" name="ccarSmartkeyYn" id="ccarSmartkeyYn">  스마트키 <br>
	<h3>차량가격</h3>
	대여횟수<input type="text" name="ccarRentalcount" id="ccarRentalcount">
	평일예약가격<input type="text" name="ccarNormalPrice" id="ccarNormalPrice"> 주말예약가격<input
		type="text" name="ccarWeekendPrice" id="ccarWeekendPrice">
		 성수기예약가격<input type="text" name="ccarPeakPrice"
		id="ccarPeakPrice"> 극성수기예약가격<input type="text" name="ccarSPeakPrice" id="ccarSPeakPrice"> <br>
		연체료<input type="text" name="ccarArrear" id="ccarArrear">
	<br>
	<hr>
	<input type="submit" value="등록"> <input type="reset" value="취소">
</form>

<br>
<br>
<br>
<hr>
<%@ include file="../inc_company/company_bottom.jsp"%>