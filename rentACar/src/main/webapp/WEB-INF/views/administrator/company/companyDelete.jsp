<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업체 삭제</title>
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
	action='<c:url value="/administrator/company/companyDelete.do" />'>
	<input type="hidden" name="no" value="${param.no}">
		<fieldset>
		<legend>업체 삭제</legend>
	        <div>           
	        	<span class="sp">${param.no}번 글을 삭제하시겠습니까?</span>                        
	        </div>
	        <div>           
	            <label for="pwd">비밀번호</label>
	            <input type="password" id="pwd" name="pwd" />   
	        </div>
	        <div class="center">
	            <input type ="submit"  value="삭제" />
	            <input type = "Button" value="글목록" 
                	OnClick
            ="location.href='<c:url value="/reBoard/list.do"/>'" />
	        </div>
	    </fieldset>
    </form>
</div>
</body>
</html>