<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	
		$("#name").focus();
		
		$("#btRegister").click(function(){
			if(!validate_userid($("#CompanyId").val())){
				alert('아이디는 영문대소문자, 숫자, 언더바만 가능합니다');
				$("#CompanyId").focus();
				return false;
			}else if($("#CompanyName").val()==''){
				alert('업체명을 입력하세요');
				$("#CompanyName").focus();
				return false;
			}else if(!$("#CompanyPwd").val()){
				alert('비밀번호를 입력하세요');
				$("#CompanyPwd").focus();
				return false;
			}else if($("#CompanyPwd").val()!=$("#CompanyPwd2").val()){
				alert('비밀번호가 일치하지 않습니다');
				$("#CompanyPwd2").focus();
				return false;
			}else if($("#chkCompanyId").val()!='Y'){
				alert('아이디 중복검사를 해야 합니다.');
				$('#chkCompanyId').focus();
				return false;
			}else if($("#comAccNum").val()!='Y'){
				alert('계좌번호를 입력해야 합니다.');
				$('#comAccNum').focus();
				return false;
			}else if(!validate_tel($("#CompanyTel2").val()) || 
					!validate_tel($("#CompanyTel3").val())){
				alert('대표번호는 숫자를 입력하셔야 합니다');
				$("#CompanyTel2").focus();
				return false;
			}else if(!validate_mobile($("#CompanyMobile2").val()) || 
					!validate_mobile($("#CompanyMobile3").val())){
				alert('휴대폰은 숫자를 입력하셔야 합니다');
				$("#CompanyMobile2").focus();
				return false;
			}else if(!validate_fax($("#CompanyFax2").val()) || 
					!validate_fax($("#CompanyFax3").val())){
				alert('팩스번호는 숫자를 입력하셔야 합니다');
				$("#CompanyFax2").focus();
				return false;
			}else if($("#CompanyAddress").val()==''){
				alert('회사주소를 입력하세요');
				$("#CompanyAddress").focus();
				return false;
			}else if($("#CompanyCeo").val()==''){
				alert('대표자를 입력하세요');
				$("#CompanyCeo").focus();
				return false;
			}else if($("#CompanyEmail1").val()==''){
				alert('이메일을 입력하세요');
				$("#CompanyEmail1").focus();
				return false;
			}
		});
		
		$("#CompanyEmail2").change(function(){
			if($("#CompanyEmail2").val()=="etc"){
				$('#CompanyEmail3').css("visibility","visible");
				$("#CompanyEmail3").val("");
				$("#CompanyEmail3").focus();
			}else{
				$('#CompanyEmail3').css("visibility","hidden");
			}
		});
		
		$("#checkCompanyId").click(function(){
			$("#frm1").prop("action", "<c:url value='/administrator/company/companyRegister.do?comId=${comVo.comId}' />");
			$("#frm1").submit();
		});	
		
		var panels = $('.user-infos');
		var panelsButton = $('.dropdown-user');
		panels.hide();

		panelsButton.click(function() {
			var dataFor = $(this).attr('data-for');
			var idFor = $(dataFor);

			var currentButton = $(this);
			idFor.slideToggle(400, function() {
				if (idFor.is(':visible')) {
					currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
				} else {
					currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
				}
			})
		});

		$('[data-toggle="tooltip"]').tooltip();
	});
		
	
	function validate_userid(userid){
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(userid);
	}

	function validate_tel(tel){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
	
	function validate_mobile(mobile){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(mobile);
	}
	
	function validate_fax(fax){
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(fax);
	}
	
</script>

</body>
</html>