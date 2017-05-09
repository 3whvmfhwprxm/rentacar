<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp"%>

<br><br>
<div class="divList container">
		<form class="form-horizontal" id="frm1" method="post" action="<c:url value='/user/reviewWrite.do'/>">
			<fieldset><br>
			<legend><b>이용후기 작성</b></legend>
				<div class="form-group">
					<label for="userId" class="col-sm-2 control-label">회원아이디</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="userId" id="userId" disabled value="${userId}">
					</div>
				</div>
				<div class="form-group">
					<label for="comId" class="col-sm-2 control-label">차량대여업체</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="comId" id="comId" disabled value="${comName}">
					</div>
				</div>
				<div class="form-group">
					<label for="cmtContent" class="col-sm-2 control-label">사용후기</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="cmtContent" id="cmtContent" placeholder="간단한 리뷰를 남겨주세요">
					</div>
				</div>
				<div class="form-group">
					<label for="cmtKindScore" class="col-sm-2 control-label">친절도</label>
					<div class="col-xs-2">
						<select class="form-control" name="cmtKindScore" id="cmtKindScore">
							<option selected>::선택::</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
						</select>
					</div>
					<label for="cmtCleanScore" class="col-sm-1 control-label">청결도</label>
					<div class="col-xs-2">
						<select class="form-control" name="cmtCleanScore" id="cmtCleanScore">
							<option selected>::선택::</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
						</select>
					</div>
					<label for="cmtConvScore" class="col-sm-1 control-label">편의성</label>
					<div class="col-xs-2">
						<select class="form-control" name="cmtConvScore" id="cmtConvScore">
							<option selected>::선택::</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="cmtImg1" class="col-sm-2 control-label">사용후기사진 1</label>
					<div class="col-sm-6">
						<input type="file" name="cmtImg1" id="cmtImg1">
					</div>
				</div>
				<div class="form-group">
					<label for="cmtImg2" class="col-sm-2 control-label">사용후기사진 2</label>
					<div class="col-sm-6">
						<input type="file" name="cmtImg2" id="cmtImg2">
					</div>
				</div>
				<div class="form-group">
					<label for="cmtImg3" class="col-sm-2 control-label">사용후기사진 3</label>
					<div class="col-sm-6">
						<input type="file" name="cmtImg3" id="cmtImg3">
					</div>
				</div>
				<div class=form-group>
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-2">
							<button class="btn btn-primary btn-lg btn-block" id="btnWrite" type="submit">
								<i class="fa fa-registered" aria-hidden="true"> 등록하기</i>
							</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>






<%@ include file="../inc_user/bottom.jsp"%>