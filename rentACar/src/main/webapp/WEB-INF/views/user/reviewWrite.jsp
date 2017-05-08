<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp"%>


<div class="divList container">
		<form class="form-horizontal" id="frmRg" method="post"
			action="<c:url value='/com_manage/company_optionRegist.do'/>">
			<fieldset>
			<legend>이용후기 작성</legend>
				<div class="form-group">
					<label for="comId" class="col-sm-2 control-label">회원아이디</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name=""	id="" disabled value="${sessionScope.userId}">
					</div>
				</div>
				<div class="form-group">
					<label for="carCode" class="col-sm-2 control-label">사용후기</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="" id="" placeholder="간단한 리뷰를 남겨주세요">
					</div>
				</div>
				<div class="form-group">
					<label for="com1" class="col-sm-2 control-label">친절도</label>
					<div class="col-xs-2">
						<select class="form-control" name="carInc" id="">
							<option selected>::선택::</option>
								<option>1 점</option>
								<option>2 점</option>
								<option>3 점</option>
								<option>4 점</option>
								<option>5 점</option>
						</select>
					</div>
					<label for="com1" class="col-sm-1 control-label">청결도</label>
					<div class="col-xs-2">
						<select class="form-control" name="carInc" id="carInc">
							<option selected>::선택::</option>
								<option>1 점</option>
								<option>2 점</option>
								<option>3 점</option>
								<option>4 점</option>
								<option>5 점</option>
						</select>
					</div>
					<label for="com1" class="col-sm-1 control-label">편의성</label>
					<div class="col-xs-2">
						<select class="form-control" name="carInc" id="carInc">
							<option selected>::선택::</option>
								<option>1 점</option>
								<option>2 점</option>
								<option>3 점</option>
								<option>4 점</option>
								<option>5 점</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="comId" class="col-sm-2 control-label">사용후기사진 1</label>
					<div class="col-sm-6">
						<input type="file" name=""	id="">
					</div>
				</div>
				<div class="form-group">
					<label for="comId" class="col-sm-2 control-label">사용후기사진 2</label>
					<div class="col-sm-6">
						<input type="file" name=""	id="">
					</div>
				</div>
				<div class="form-group">
					<label for="comId" class="col-sm-2 control-label">사용후기사진 3</label>
					<div class="col-sm-6">
						<input type="file" name=""	id="">
					</div>
				</div>
			</fieldset>
		</form>
	</div>






<%@ include file="../inc_user/bottom.jsp"%>