<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberDelete</title>
<script type="text/javascript" 
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#pwd").focus();
		$("#frmDel").submit(function(event){
			if($("#pwd").val()==""){
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}
			
			if(!confirm("삭제하시겠습니까?")){
				event.preventDefault();
			}
			
		});
	});
	
</script>
</head>
<body>
<div class="divForm">
<form id="frmDel" name="frmDelete" method="post"	
	action='<c:url value="/administrator/user/memberDelete.do" />'>
	<input type="hidden" name="userId" value="${param.userId}">
		<fieldset>
		<legend>글 삭제</legend>
	        <div>           
	        	<span class="sp">${param.userId}님을 삭제하시겠습니까?</span>                        
	        </div>
	        <div>           
	            <label for="pwd">비밀번호</label>
	            <input type="password" id="pwd" name="pwd" />   
	        </div>
	        <div class="center">
	            <input type = "submit"  value="삭제" />
	            <input type = "Button" value="회원목록" 
                	OnClick
            ="location.href='<c:url value="/administrator/user/memberList.do"/>'" />
	        </div>
	    </fieldset>
    </form>
</div>
</body>
</html>