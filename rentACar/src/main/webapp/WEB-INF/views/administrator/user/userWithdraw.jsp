<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<script type="text/javascript">
	$().ready(function(){
		$("#pwd").focus();
		
		$("#frmOut").submit(function(){
			if($("#pwd").val()==''){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}
		});		
	});
</script>

<div class="w3-container">
	<div class="row" style="margin-top: 10%;">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="text-center">
						<h3>
							<i class="fa fa-times fa-4x" aria-hidden="true"></i>
						</h3>
						<h2 class="text-center">${param.userId}님을 탈퇴처리하시겠습니까?</h2>
						<p>회원탈퇴를 하시면 삭제가 아니라, 탈퇴일이 현재날짜로 업데이트됩니다.</p>
						<div class="panel-body">
							<form name="frmOut" id="frmOut" method="post"
								action="<c:url value='/administrator/user/userWithdraw.do' />" >

								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-remove"></i>
										</span>
										<input type="hidden" name="userId" id="userId" value="${param.userId}">
										<input type="password" name="pwd" id="pwd" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-lg btn-primary btn-block" value="회원 탈퇴">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>