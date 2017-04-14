<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업체상세정보</title>

</head>
<body>
<h2>업체정보</h2>
	<div class="divForm">
			<div>
				<span>아이디</span> <span>${companyDetail.comId}</span>
			</div>
			<div>
				<span>이름</span> <span>${companyDetail.comName}</span>
			</div>
			<div>
				<span>비밀번호</span> <span>${companyDetail.comPwd}</span>
			</div>
			<div>
				<span>사업자번호</span> <span>${companyDetail.comNum}</span>
			</div>
			<div>
			<div>
				<span>대표번호</span> <span>${companyDetail.comTel1}-${companyDetail.comTel2}-${companyDetail.comTel3}</span>
			</div>
			<div>
				<span>휴대폰</span> <span>${companyDetail.comMobile1}-${companyDetail.comMobile2}-${companyDetail.comMobile3}</span>
			</div>
			<div>
				<span>팩스번호</span> <span>${companyDetail.comFax1}-${companyDetail.comFax2}-${companyDetail.comFax3}</span>
			</div>
				<span>주소</span> <span>${companyDetail.comAddress}</span>
			</div>
			<div>
				<span>대표자</span> <span>${companyDetail.comCeo}</span>
			</div>
			<div>
				<span>이메일</span> <span>${companyDetail.comEmail1}@${companyDetail.comEmail2}</span>
			</div>
			<div>
				<span>업체로고</span> <span>${companyDetail.comLogo}</span>
			</div>
			<div>
				<span>등록일</span> <span>${companyDetail.comRegdate}</span>
			</div>
			<div>
				<span>탈퇴일</span> <span>${companyDetail.comOutdate}</span>
			</div>
		<div class="center">
			<a href="<c:url value='/administrator/company/companyEdit.do?comId=${companyDetail.comId}'/>">수정</a> |
        	<a href="<c:url value='/administrator/company/companyDelete.do?comId=${companyDetail.comId}'/>">삭제</a> |
			<a href='<c:url value="/administrator/company/companyList.do"/>'>목록</a>
		</div>
	</div>
</body>
</html>