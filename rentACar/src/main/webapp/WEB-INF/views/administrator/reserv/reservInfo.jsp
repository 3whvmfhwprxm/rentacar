<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<style>
	.bodyClass{padding-top: 30px;}
	th, td{text-align: center;}	
	.col-md-4 {
		float: left;
		width: 100%;
		margin: 0 auto;
		text-align: center;
	}
</style>
	<div class="w3-container bodyClass">
	<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post" action='<c:url value="/admin/reserv/reservInfo.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="payRegdate" value="${param.payRegdate}">
	</form>
	
	<h3><i class="fa fa-calendar-check-o"></i> 예약내역 조회/관리 - 조회기간 검색 들어가야됨</h3>
		<br>
	<pre>
* 문구 입력1
* 문구 입력2
* 문구 입력3</pre>
	<br>
	<!-- 테이블 화면 시작 -->
	<table class="table table-hover">
		<tr>						
			<th>예약번호</th>
			<th>예약자 연락처</th>
			<th>예약자 ID</th>
			<th>인수일시</th>
			<th>반납일시</th>			
			<th>예약차 번호</th>
			<th>예약일</th>
			<th>취소여부</th>			
			<th>결제여부</th>
		</tr>
		
		<c:if test="${empty rlist}">
					<tr>
						<td colspan="9" class="align_center">예약 내역이 존재하지 않습니다.</td>
					</tr>
		</c:if>
		
		<c:if test="${!empty rlist }">			
				<c:forEach var="map" items="${rlist }">
					<tr>
						<td>${map['RESERV_NUM'] }</td>
						<td>${map['USER_TEL1'] }-${map['USER_TEL2'] }-${map['USER_TEL3'] }</td>
						<td>${map['USER_ID'] }</td>
						<td>${map['RESERV_START_DATE'] }</td>
						<td>${map['RESERV_END_DATE'] }</td>
						<td>${map['CCAR_CAR_ID'] }</td>
						<td>${map['RESERV_DATE'] }</td>
						<td>${map['RESERV_CANCEL'] }</td>
						<td>${map['PAY_CONDITION'] }</td>
					</tr>	
				</c:forEach>				
		</c:if>		
	</table>
		<div class="divPage container">
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"> 
					<img src='${pageContext.request.contextPath}/images/first.JPG' alt="이전블럭으로">
				</a>
			</c:if>
	
			<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
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
		<div class="divSearch container">
			<form name="frmSearch" method="post" action="<c:url value="/admin/reserv/reservInfo.do" />">
				<select name="searchCondition">				
					<option value="user_tel3"
						<c:if test="${'user_tel3'==param.searchCondition}">
	            		selected            	
	            	</c:if>>연락처 뒷자리</option>
	            	
					<option value="reserv_num"
						<c:if test="${'reserv_num'==param.searchCondition}">
	            		selected            	
	            	</c:if>>예약번호</option>	            	
				</select> 
				<input type="text" name="searchKeyword" title="검색어 입력"	value="${param.searchKeyword}"> 
				<input type="submit" value="검색">
			</form>
		</div>	
	</div>
</body>
</html>
