<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>common/message.jsp</title>
</head>
<body>
	<script type="text/javascript">
		//msg가 있을 때만 메세지 보여주기
		
		<c:if test="${!empty msg}">
			alert("${msg}");		
		</c:if>
		
		location.href="<c:url value='${url}' />";
	</script>
</body>
</html>












