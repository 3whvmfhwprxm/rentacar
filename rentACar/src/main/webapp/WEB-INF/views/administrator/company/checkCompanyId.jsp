<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkCompanyId.jsp</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/top.css" />

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

<script type="text/javascript"
	src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'></script>
	
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<script type="text/javascript" src='<c:url value="/jquery/jquery-3.1.1.min.js"/>'></script>
<script type="text/javascript">
	$().ready(function(){
		$("#checkID").click(function(){		
			$(opener.document).find("#CompanyId").val('${param.CompanyId}');
			$(opener.document).find("#chkId").val('Y');
			
			self.close();		
		});
		
		
		$("#checkCompanyId").click(function(){
			if(!validate_CompanyId($("#CompanyId").val())){
				alert('아이디는 영문대소문자, 숫자만 가능합니다');
				$("#checkCompanyId").focus();
				return false;
			}
		});
		
		$("#useCompanyId").click(function(){
			if(!validate_CompanyId($("#CompanyId").val())){
				alert('아이디는 영문대소문자, 숫자만 가능합니다');
				$("#CompanyId").focus();
				return false;
			}
		});
	});
	
	function validate_CompanyId(CompanyId){
		var pattern = new RegExp(/^[a-zA-Z0-9]+$/g);
		return pattern.test(CompanyId);
	}
</script>
</head>
<body>
	<h2>아이디 중복검사</h2>
	<div>
		<form name="frmId" method="post" action="checkCompanyId.do">
			<label for="CompanyId">아이디</label>
			<input type="text" name="CompanyId" id="CompanyId" value="${param.CompanyId}">
			<input type="submit" id="checkCompanyId" value="아이디 확인">
			<c:if test="${result==EXIST_ID}">
				<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
			</c:if>
			<c:if test="${result==NONE_EXIST_ID}">
				<input type="button" id="useCompanyId" value="사용하기" id="checkID">
				<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
			</c:if>
		</form>
	</div>
</body>
</html>













