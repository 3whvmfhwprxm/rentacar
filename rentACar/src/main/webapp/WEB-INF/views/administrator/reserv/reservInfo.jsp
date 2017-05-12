<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>
<script type="text/javascript">
	$().ready(function(){
		$("input[name='chkAll']").click(function(){				
			$("tbody input[type=checkbox]").prop("checked", this.checked);
			//this.checked => true, false값이 반환됨
		});
		
		$("#btCancelMulti").click(function(){	
			if($('tbody input:checkbox:checked').length==0){
				//tbody input[type=checkbox]:checked
				alert("취소할 예약을 하나라도 선택하셔야 합니다");
				return;
			}else if(confirm("정말로 예약을 취소하시겠습니까? \n결제,예약이 모두 취소되며 \n사용자에게 알림 메일이 보내집니다.")){
				$("#frmReservList").attr("action","<c:url value='/admin/reserv/reservMultiCancel.do' />");
				$("#frmReservList").submit();	
			}											
		});
	});

	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<style>
th, td {
	text-align: center;
}

.divRight {
	text-align: right;
}

.divSales {
	margin: 10px 0;
}

.col-md-4 {
	float: left;
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

.bodyClass {
	padding-top: 30px;
	width: 80%;
	padding-left: 40px;
}

th {
	background-color: #EEEEEE;
}
</style>
<div class="w3-container bodyClass">
	<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post"
		action='<c:url value="/admin/reserv/reservInfo.do" />'>
		<input type="hidden" name="currentPage"> <input type="hidden"
			name="searchCondition" value="${param.searchCondition}"> <input
			type="hidden" name="searchKeyword" value="${param.searchKeyword}">
		<input type="hidden" name="payRegdate" value="${param.payRegdate}">
	</form>

	<h3>
		<i class="fa fa-calendar-check-o"></i> 예약내역 조회/관리 - 조회기간 검색 들어가야됨
	</h3>
	<br>
	<pre>
* 예약번호를 클릭하시면 해당 결제정보로 넘어갑니다.
* 문구 입력2
* 문구 입력3</pre>
	<br>

	<form name="frmReservList" id="frmReservList" method="post">

		<!-- 테이블 화면 시작 -->
		<div class="divSales">
			<table class="table table-hover">
				<thead>
					<tr>
						<th><input type="checkbox" name="chkAll"></th>
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
				</thead>
				<tbody>
					<c:if test="${empty rlist}">
						<tr>
							<td colspan="10" class="align_center">예약 내역이 존재하지 않습니다.</td>
						</tr>
					</c:if>

					<c:if test="${!empty rlist}">
						<c:set value="0" var="i" />
						<c:forEach var="map" items="${rlist }">
							<tr>
								<td><c:if test="${empty map['RESERV_CANCEL']}">
										<input type="checkbox" id="chk_${i }"
											name="reservItems[${i}].reservNum"
											value="${map['RESERV_NUM']}">
									</c:if></td>
								<td><a
									href='<c:url value="/admin/payInfo.do?searchCondition=reserv_num&searchKeyword=${map['RESERV_NUM'] }" />'>
										${map['RESERV_NUM'] }</a></td>
								<td>${map['USER_TEL1'] }-${map['USER_TEL2'] }-${map['USER_TEL3'] }
								</td>
								<td>${map['USER_ID'] }</td>
								<td><fmt:formatDate value="${map['RESERV_START_DATE'] }"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${map['RESERV_END_DATE'] }"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${map['CCAR_CAR_ID'] }</td>
								<td><fmt:formatDate value="${map['RESERV_DATE'] }"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td><fmt:formatDate value="${map['RESERV_CANCEL'] }"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td><c:if test="${empty map['PAY_CONDITION']}">
									결제내역없음
								</c:if> <c:if
										test="${!empty map['PAY_CONDITION'] && !empty map['PAY_CANCELDATE']}">
										<fmt:formatDate value="${map['PAY_CANCELDATE'] }"
											pattern="yyyy-MM-dd HH:mm" />에 취소
								</c:if> <c:if
										test="${!empty map['PAY_CONDITION'] && empty map['PAY_CANCELDATE']}">
									${map['PAY_CONDITION'] }
								</c:if></td>
							</tr>
							<c:set var="i" value="${i+1}" />
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>

		<div class="row">
			<div class="col-md-10"></div>
			<div>
				<button type="button" class="btn btn-primary" id="btCancelMulti"
					style="float: right;">선택한 예약을 취소 처리</button>
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

	<!-- 검색 입력폼 -->
	<div class="divSearch container">
		<div class="col-md-4">
			<form name="frmSearch" method="post"
				action="<c:url value="/admin/reserv/reservInfo.do" />">
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
