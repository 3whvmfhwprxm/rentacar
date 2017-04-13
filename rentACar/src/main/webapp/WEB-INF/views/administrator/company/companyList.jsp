<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberList</title>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	th{
		text-align: center;
	}
</style>
</head>
<body>
<h2>업체</h2>
	<form name="frmPage" method="post"
		action='<c:url value="/administrator/company/companyList.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	<div class="divList">
		<table class="table table-hover table-bordered" summary="회원정보에 관한 테이블">
			<thead>
				<tr>
					<th scope="col">업체아이디</th>
					<th scope="col">업체명</th>
					<th scope="col">비밀번호</th>
					<th scope="col">사업자번호</th>
					<th scope="col">대표번호</th>
					<th scope="col">휴대폰</th>
					<th scope="col">팩스번호</th>
					<th scope="col">주소</th>
					<th scope="col">대표자</th>
					<th scope="col">대표메일</th>
					<th scope="col">업체로고</th>
					<th scope="col">가입일</th>
					<th scope="col">탈퇴일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty companyList}">
					<tr>
						<td colspan="10" class="align_center">데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="vo" items="${companyList}">
					<tr style="text-align: center">
						<td><a href='<c:url value="/administrator/company/companyDetail.do?comId=${vo.comId}" />'>
						${vo.comId}</a></td>
						<td style="text-align: center">
							${vo.comName}
						</td>
						<td>${vo.comPwd}</td>
						<td>${vo.comNum}</td>
						<td>${vo.comTel1}-${vo.comTel2}-${vo.comTel3}</td>
						<td>${vo.comMobile1}-${vo.comMobile2}-${vo.comMobile3}</td>
						<td>${vo.comFax1}-${vo.comFax2}-${vo.comFax3}</td>
						<td>${vo.comAddress}</td>
						<td>${vo.comCeo}</td>
						<td>${vo.comEmail1}@${vo.comEmail2}</td>
						<td>${vo.comLogo}</td>
						<td><fmt:formatDate value="${vo.comRegdate}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${vo.comOutdate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="divPage">
		<c:if test="${pagingInfo.firstPage>1 }">
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> 
				<img src='${pageContext.request.contextPath}/images/first.JPG' alt="이전블럭으로">
			</a>
		</c:if>

		<c:forEach var="i" begin="${pagingInfo.firstPage}"
			end="${pagingInfo.lastPage}">
			<c:if test="${i==pagingInfo.currentPage }">
				<span style="color: blue; font-weight: bold;">${i}</span>
			</c:if>
			<c:if test="${i!=pagingInfo.currentPage }">
				<a href="#" onclick="pageFunc(${i})">[${i}]</a>
			</c:if>
		</c:forEach>

		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
			<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> 
				<img src='${pageContext.request.contextPath}/images/last.JPG' alt="다음블럭으로">
			</a>
		</c:if>
	</div>
	
	<div class="divSearch">
		<form name="frmSearch" method="post"
			action="<c:url value="/administrator/company/companyList.do" />">
			<select name="searchCondition">
				<option value="comId"
					<c:if test="${'comId'==param.searchCondition}">
            		selected            	
            	</c:if>>업체아이디</option>
				<option value="comName"
					<c:if test="${'comName'==param.searchCondition}">
            		selected            	
            	</c:if>>업체명</option>
			</select> 
			<input type="text" name="searchKeyword" title="검색어 입력"
				value="${param.searchKeyword}"> 
			<input type="submit" value="검색">
		</form>
	</div>
</body>
</html>