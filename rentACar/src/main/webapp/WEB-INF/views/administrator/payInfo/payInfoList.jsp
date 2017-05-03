<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script type="text/javascript">	
	$().ready(function(){
		IMP.init('imp33307123');
	});
	
	/* function cancelPay(cancelNum, paidmoney){
			$.ajax({
	    		url:'https://api.iamport.kr/payments/cancel?_token=c271e519a46c98cba70d1d96b3ec40755b77a888',
	    		type:'POST',
	    		data:{merchant_uid:cancelNum,
	    			  amount:paidmoney,
	    			  reason:'관리자 취소 처리'},
	    		dataType:'json',
	    		success:function(res){
	    			alert('결제가 취소됐습니다.');
	    		},error:function(xhr, status, error){
	    			alert('결제가 취소 실패.');
	    		}			    		
	    	});
	}
 */
 
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
	<form name="frmPage" method="post" action='<c:url value="/admin/payInfo.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="payRegdate" value="${param.payRegdate}">
	</form>
	
	<h3><i class="fa fa-calendar-check-o"></i> 결제내역 조회/관리 - 조회기간 검색 들어가야됨</h3>
		<br>
	<pre>
* 문구 입력1
* 문구 입력2
* 문구 입력3</pre>
	<br>
	
	<!-- 테이블 화면 시작 -->
	<table class="table table-hover">
		<tr>			
			<th>결제번호</th>
			<th>예약번호</th>
			<th>결제자 연락처</th>
			<th>결제방법</th>
			<th>결제금액</th>			
			<th>결제일시</th>
			<th>결제취소</th>
		</tr>
		
		<c:if test="${empty plist}">
					<tr>
						<td colspan="7" class="align_center">결제내역이 존재하지 않습니다.</td>
					</tr>
		</c:if>
		
		<c:if test="${!empty plist }">			
				<c:forEach var="vo" items="${plist }">
					<tr>
						<td>${vo.payNo }</td>
						<td>${vo.reservNum }</td>
						<td>${vo.userTel1 }-${vo.userTel2 }-${vo.userTel3 }</td>
						<td>${vo.payMethod }</td>
						<td>${vo.payMoney }</td>						
						<td>${vo.payRegdate }</td>
						<td><a href="<c:url value='/admin/payCancel.do?payNo=${vo.payNo }' />" >
							<button>결제취소</button></a></td>
						
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
			<form name="frmSearch" method="post" action="<c:url value="/admin/payInfo.do" />">
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
