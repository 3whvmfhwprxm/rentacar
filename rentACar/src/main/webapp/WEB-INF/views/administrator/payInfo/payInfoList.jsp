<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<script type="text/javascript">	
	$().ready(function(){
		$("input[name='chkAll']").click(function(){				
			$("tbody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$("#btCancelMulti").click(function(){	
			if($('tbody input:checkbox:checked').length==0){
				alert("취소할 결제를 하나라도 선택하셔야 합니다");
				return;
			}else if(confirm("정말로 결제를 취소하시겠습니까? \n결제,예약이 모두 취소되며 \n사용자에게 알림 메일이 보내집니다.")){
				$("#frmPayList").attr("action","<c:url value='/admin/payCancel.do' />");
				$("#frmPayList").submit();	
			}											
		});
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
th, td {
	text-align: center;
}

.bodyClass {
	padding-top: 30px;
	width: 80%;
	padding-left: 80px;
}

.col-md-4 {
	float: left;
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

th {
	background-color: #EEEEEE;
}
</style>
<div class="w3-container bodyClass">
	<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post"
		action='<c:url value="/admin/payInfo.do" />'>
		<input type="hidden" name="currentPage"> <input type="hidden"
			name="searchCondition" value="${param.searchCondition}"> <input
			type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="payRegdate" value="${param.payRegdate}">
	</form>

	<h3>
		<i class="fa fa-credit-card"></i> 결제내역 조회/관리 - 조회기간 검색 들어가야됨
	</h3>
	<br>
	<pre>
* 문구 입력1
* 문구 입력2
* 문구 입력3</pre>
	<br>

	<form name="frmPayList" id="frmPayList" method="post">

		<!-- 테이블 화면 시작 -->
		<table class="table table-hover">
			<tr>
				<th><input type="checkbox" name="chkAll"></th>
				<th>결제번호</th>
				<th>예약번호</th>
				<th>결제자 연락처</th>
				<th>결제방법</th>
				<th>결제금액</th>
				<th>결제일시</th>
				<th>취소여부</th>
			</tr>

			<c:if test="${empty plist}">
				<tr>
					<td colspan="7" class="align_center">결제내역이 존재하지 않습니다.</td>
				</tr>
			</c:if>

			<c:if test="${!empty plist }">
				<c:set value="0" var="i" />
				<c:forEach var="vo" items="${plist }">
					<tr>
						<td><c:if test="${empty vo.payCancelDate }">
								<input type="checkbox" id="chk_${i }"
									name="payItems[${i}].reservNum" value="${vo.reservNum }">
							</c:if></td>
						<td>${vo.payNo }</td>
						<td>${vo.reservNum }</td>
						<td>${vo.userTel1 }-${vo.userTel2 }-${vo.userTel3 }</td>
						<td>${vo.payMethod }</td>
						<td>${vo.payMoney }</td>
						<td>${vo.payRegdate }</td>
						<td><c:if test="${!empty vo.payCancelDate }">
								${vo.payCancelDate }에 취소됨
							</c:if></td>
					</tr>
					<c:set var="i" value="${i+1}" />
				</c:forEach>
			</c:if>
		</table>

		<!-- 페이징처리 -->
		<div class="row">
			<div class="col-md-10"></div>
			<div>
				<button type="button" class="btn btn-primary" id="btCancelMulti"
					style="float: right;">선택한 결제를 취소 처리</button>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<nav>
					<ul class="pagination">
						<c:if test="${pagingInfo.firstPage>1}">
							<li><a href="#"
								onclick="pageFunc(${pagingInfo.firstPage-1})"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<c:forEach var="i" begin="${pagingInfo.firstPage}"
							end="${pagingInfo.lastPage}">
							<c:if test="${i==pagingInfo.currentPage}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>

							<c:if test="${i!=pagingInfo.currentPage}">
								<li><a href="#" onclick="pageFunc(${i})">${i}</a></li>
							</c:if>
						</c:forEach>

						<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
							<li><a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="col-md-4"></div>
		</div>
	</form>


	<div class="divSearch container">
		<div class="col-md-4">
			<form name="frmSearch" method="post"
				action="<c:url value="/admin/payInfo.do" />">
				<select name="searchCondition">
					<option value="user_tel3"
						<c:if test="${'user_tel3'==param.searchCondition}">
	            		selected            	
	            	</c:if>>연락처
						뒷자리</option>

					<option value="reserv_num"
						<c:if test="${'reserv_num'==param.searchCondition}">
	            		selected            	
	            	</c:if>>예약번호</option>
				</select> <input type="text" name="searchKeyword" title="검색어 입력"
					value="${param.searchKeyword}"> <input type="submit"
					value="검색">
			</form>
		</div>
	</div>
</div>
</body>
</html>
