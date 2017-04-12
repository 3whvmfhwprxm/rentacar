<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" 
	src='<c:url value="/jquery/jquery-3.1.1.min.js" />'>
</script>
</head>
<body>
<div class="divForm">
<form id="frmEdit" name="frmEdit" method="post" 
	action='<c:url value="/administrator/user/memberEdit.do" />'> 
	
	<input type="hidden" name="no" 
    	value="${vo.no}" />
    <input type="text" name="oldFileName"
    	value="${vo.fileName}">
            	
    <fieldset>
	<legend>회원수정</legend>
        <div class="firstDiv">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" 
            	value="${vo.userId}" />
        </div>
        
        <div>
            <label for="userName">이름</label>
            <input type="text" id="userName" name="userName" 
            	value="${vo.userName}"/>
        </div>
        
        <div>
            <label for="userEmail">이메일</label>
            <input type="text" id="userEmail" name="userEmail" 
            	value="${vo.userEmail1}@${vo.userEmail2}"/>
        </div>
        
        <div>
            <label for="userTel">전화번호</label>
            <input type="text" id="userTel" name="userTel" 
            	value="${vo.userTel1}-${vo.userTel2}-${vo.userTel3}"/>
        </div>
        <div>
            <label for="userBirth">생일</label>
            <input type="text" id="userBirth" name="userBirth" 
            	value="${vo.userBirth}"/>
        </div>
        <div>
            <label for="userAddress">주소</label>
            <input type="text" id="userAddress" name="userAddress" 
            	value="${vo.userAddress}"/>
        </div>
        <div>
            <label for="userGender">성별</label>
            <input type="text" id="userGender" name="userGender" 
            	value="${vo.userGender}"/>
        </div>
        <div>
            <label for="userLicense">면허증</label>
            <input type="text" id="userLicense" name="userLicense" 
            	value="${vo.userLicense}"/>
        </div>
        <div>
            <label for="userRegdate">가입일</label>
            <input type="text" id="userRegdate" name="userRegdate" 
            	value="${vo.userRegdate}"/>
        </div>
        <div>
            <label for="userOutdate">탈퇴일</label>
            <input type="text" id="userOutdate" name="userOutdate" 
            	value="${vo.userOutdate}"/>
        </div>
        
        <div>
            <input type = "submit" value="수정"/>
            <input type = "Button" value="회원목록" 
   onclick="location.href='<c:url value="/administrator/user/memberList.do" />'" />         
        </div>
	</fieldset>
</form>    
</div>

</body>
</html>