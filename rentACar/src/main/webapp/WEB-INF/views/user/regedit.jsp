<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#frm1").submit(function(){
			if(!$("#userPwd").val()){
				alert('패스워드를 입력하세요');
				$("#userPwd").focus();
				return false;
			}else if(!$("#userEmail").val()){
				alert('이메일주소를 입력하세요');
				$("#userEmail1").focus();
				return false;
			}else if(!$("#userTel1").val()){
				alert('전화번호를 입력하세요');
				$("#userTel1").focus();
				return false;
			}else if(!$("#userTel2").val()){
				alert('전화번호를 입력하세요');
				$("#userTel2").focus();
				return false;
			}else if(!$("#userTel3").val()){
				alert('전화번호를 입력하세요');
				$("#userTel3").focus();
				return false;
			}else if(!$("#userBirth").val()){
				alert('생년월일을 입력하세요');
				$("#userBirth").focus();
				return false;
			}else if(!$("#userAddress").val()){
				alert('주소를 입력하세요');
				$("#userAddress").focus();
				return false;
			}else if(!$("#userGender").val()){
				alert('성별을 입력하세요');
				$("#userGender").focus();
				return false;
			}else if(!$("#userLicense").val()){
				alert('면허증을 입력하세요');
				$("#userLicense").focus();
				return false;
			}
		});
	});
</script>
<style type="text/css">
	#frm1 {
		text-align: center;
	}
</style>
<script type="text/javascript">
	/* $(function(){
		$("#userPwd").focus();
		
		$("#outbt").submit(function(){
			if($("#userPwd").val()==''){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}			
		});
	}); */
	function fncout(){
		if($("#userPwdmd").val() == "" || $("#userPwdmd").val() == null){
			alert("탈퇴할아이디 비밀번호를 입력해주세요");
			return false;
		}
		if($("#userPwdmd").val() != $("#userPwdmd").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		} 
		
		$("#outmember").attr("method","POST");
		$("#outmember").attr("action","<c:url value='/user/outMember.do'/>");
		$("#outmember").submit();
		
	}
	function juso(){
		window.open("../userzipcode/jusoPopup.do","pop", "width=570,height=420, scrollbars=yes, resizable=yes");
	}
		
	function jusoCallBack(addrDetail){
		document.frm1.userAddress.value=addrDetail;
	}
</script>

<div class="container">
	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
		<form id="frm1" name="frm1" class="form-horizontal" novalidate method="post" action='<c:url value="/user/regedit.do"/>'>
			  <br>
	          <div class="row">
	            <label class="control-label col-md-3" for="name">아이디 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	            	<span>${sessionScope.userId}</span><br>
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">이름 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	            	<span>${vo.userName}</span><br>
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">비밀번호 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userPwd" name="userPwd" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="password">
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">이메일 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) hong" required="required" type="email" value="${vo.userEmail }">
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">연락처 <span class="required">*</span>
	           		</label>
	           		<div class="col-md-2">
	             		<select id="userTel1" name="userTel1" class="form-control" name="name">
	             			<option value="010" <c:if test="${vo.userTel1=='010'}">selected</c:if> >010</option>
	             			<option value="011" <c:if test="${vo.userTel1=='011'}">selected</c:if> >011</option>
	             			<option value="016" <c:if test="${vo.userTel1=='016'}">selected</c:if> >016</option>
	             			<option value="017" <c:if test="${vo.userTel1=='017'}">selected</c:if> >017</option>
	             			<option value="018" <c:if test="${vo.userTel1=='018'}">selected</c:if> >018</option>
	             			<option value="019" <c:if test="${vo.userTel1=='019'}">selected</c:if> >019</option>
	             		</select>
	           		</div>
	            <div class="col-md-2">
	              <input id="userTel2" name="userTel2" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="text" value="${vo.userTel2 }">
	            </div>
	            <div class="col-md-2">
	              <input id="userTel3" name="userTel3" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" type="text" value="${vo.userTel3 }">
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">생년월일 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userBirth" name="userBirth" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 910310" required="required" type="text" value="${vo.userBirth }">
	            </div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">주소 <span class="required">*</span>
	            </label>
	            <div class="col-md-4">
	              <input id="userAddress" name="userAddress" class="form-control" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="ex) 서울시 영등포구 당산동" required="required" type="text" value="${vo.userAddress }">
	            </div>
	            <div class="col-sm-2">
					<input type="button" class="btn btn-default" value="주소찾기" onClick="juso()">
				</div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">성별 <span class="required">*</span>
	            </label>
	       		<div class="col-md-2">
	         		<select id="userGender" name="userGender" class="form-control" name="name">
	         			<option value="남자" <c:if test="${vo.userGender=='남자'}">selected</c:if> >남자</option>
	         			<option value="여자" <c:if test="${vo.userGender=='여자'}">selected</c:if> >여자</option>
	         		</select>
	       		</div>
	          </div><br>
	          
	          <div class="row">
	            <label class="control-label col-md-3" for="name">면허증 <span class="required">*</span>
	            </label>
	            <div class="col-md-3">
	           		<select id="userLicense" name="userLicense" class="form-control" name="name">
	           			<option value="1종 대형" <c:if test="${vo.userLicense=='1종 대형'}">selected</c:if> >1종 대형</option>
	           			<option value="1종 보통" <c:if test="${vo.userLicense=='1종 보통'}">selected</c:if> >1종 보통</option>
	           			<option value="1종 소형" <c:if test="${vo.userLicense=='1종 소형'}">selected</c:if> >1종 소형</option>
	           			<option value="1종 특수" <c:if test="${vo.userLicense=='1종 특수'}">selected</c:if> >1종 특수</option>
	           			<option value="2종 보통" <c:if test="${vo.userLicense=='2종 보통'}">selected</c:if> >2종 보통</option>
	           			<option value="2종 소형" <c:if test="${vo.userLicense=='2종 소형'}">selected</c:if> >2종 소형</option>
	           		</select>
	       		</div>
	          </div><br>
	          
	          <div class="ln_solid"></div>
	          <div class="form-group">
	            <div class="col-md-6 col-md-offset-3">
	              <button type="reset" class="btn btn-primary" name="btn2">취소</button>
	              <button type="button" class="btn btn-danger" name="btn3" data-toggle="modal" href="#myModal">회원탈퇴</button>
	              <button type="submit" class="btn btn-success" name="btn1">정보수정</button>
	              <input type ="hidden" name="chkId" id="chkId">
	            </div>
	          </div>
	     </form>
	</div>
</div>

<!-- 회원 탈퇴 -->
<div class="container">
	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">회원 탈퇴</h4>
					</div>
					<div class="modal-body">
						<form method="post" name="outmember" id="outmember" action="<c:url value="/user/outMember.do"/>">
							<div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">아이디 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="userId" name="userId" class="form-control" data-validate-length-range="6" data-validate-words="2" placeholder="ex) hong123" required="required" type="text" value="${userId }" disabled>
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">비밀번호 <span class="required">*</span>
					            </label>
					            <div class="col-md-5">
					              <input id="userPwdmd" name="userPwdmd" class="form-control" data-validate-length-range="6" data-validate-words="2"  placeholder="****" required="required" type="text">
					            </div>
					        </div><br>
						</form>
					</div>
						<div class="modal-footer">
			           		 <button id="outbt" type="submit" class="btn btn-primary" id="out" data-dismiss="modal" onclick="fncout()">탈퇴</button>
						</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</div>
</div>
<!-- /.modal -->


<%@ include file="../inc_user/bottom.jsp" %>