<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<script type="text/javascript">	
	$(document).ready(function(){
		$('#myInModal').on('shown.bs.modal', function () {
			$('#myInput').focus()
		});
		
		$("input[name='chkAll']").click(function(){
			$("tbody input[type=checkbox]").prop("checked", this.checked);
		});
		
		$("#btWithdrawMulti").click(function(){	
			if($("tbody input[type=checkbox]:checked").length==0){
				alert("탈퇴처리할 업체를 선택해주세요.");
				return;
			}else if(confirm("정말로 탈퇴처리하시겠습니까? 탈퇴 처리 시 해당 회원은 탈퇴회원리스트로 이동합니다.")){
				$("#frmList").prop("action", 
					"<c:url value='/administrator/user/userMultiWithdraw.do'/>");
				$("#frmList").submit();
			}
		});
	});
		
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>

<style type="text/css">
th {
	text-align: center;
}

.col-md-4 {
	float: left;
	width: 100%;
	margin: 0 auto;
	text-align: center;
}
</style>

<form name="frmPage" method="post"
	action='<c:url value="/administrator/user/userInList.do" />'>
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<div class="w3-container">
	<h3>회원페이지 가이드</h3>
	<pre>
		<code>
		현재 등록된 회원 리스트와 탈퇴회원 리스트를 보여줍니다.
		아이디 버튼을 누르면 해당 아이디회원의 상세정보를 보여줍니다. 
		검색은 아이디, 이름으로 가능하며 아이디는 대소문자 구분없이 쓰셔도 검색이 됩니다.
    	</code>
	</pre>

	<br>

	<div role="tabpanel">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active">
				<a href='<c:url value="/administrator/user/userInList.do" />' aria-controls="userInList" role="tab">
					회원 리스트 
				</a>
			</li>

			<li role="presentation">
				<a href='<c:url value="/administrator/user/userOutList.do" />' aria-controls="userOutList" role="tab">
					탈퇴회원 리스트
				</a>
			</li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<div style="float: right;">
				<button type="button" class="btn btn-default btn-lg"
					id="btWithdrawMulti" style="color: black;">회원 탈퇴</button>
			</div>
			<!-- ★★★★★★★★★★회원 리스트★★★★★★★★★★ -->
			<div role="tabpanel" class="tab-pane active" id="userInList">
				<div class="row">
					<div class="col-md-12">
						<br>
						<form name="frmList" id="frmList" method="post"
							action='<c:url value="/administrator/user/userInList.do" />'>
						<table class="table table-hover">
							<colgroup>
				       		  	<col width="5%">
					    		<col width="13%">
					    		<col width="10%">
					    		<col width="*%">
					    		<col width="8%">
					    		<col width="12%">
					    		<col width="8%">
					    		<col width="10%">
					    		<col width="8%">
					    		<col width="10%">
				    		</colgroup>
							<thead>
								<tr class="info">
									<th><input type="checkbox" name="chkAll"></th>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">전화번호</th>
									<th scope="col">생일</th>
									<th scope="col">주소</th>
									<th scope="col">성별</th>
									<th scope="col">면허증</th>
									<th scope="col">가입일</th>
								</tr>
							</thead>

							<tbody>
								<c:if test="${empty userInList}">
									<tr>
										<td colspan="10" style="text-align: center;">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								
								<c:set var="u" value="0" />
								<c:forEach var="vo" items="${userInList}" varStatus="i">
									<tr style="text-align: center">
										<td>
											<input type="checkbox" id="chk_${u}"
												name="userItems[${u}].userId" value="${vo.userId}">
										</td>
										<td>
											<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myInModal_${i.index}">
												${vo.userId}
											</button>
											<div class="modal fade" id="myInModal_${i.index}" tabindex="-1" role="dialog" aria-labelledby="myInModalLabel" aria-hidden="true">
												<div class="modal-dialog">
											    	<div class="modal-content">
											      		<div class="modal-header" style="background-color: skyblue;">
											       			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											       				<span aria-hidden="true">&times;</span>
											       			</button>
											        		<h4 class="modal-title" id="myInModalLabel">
											        			<i class="fa fa-user-o"></i>${vo.userName}님의 상세정보
											        		</h4>
											      		</div>
													    <div class="modal-body">
													    	<table class="table table-user-information">
																<tbody>
																	<tr>
																		<td>아이디</td>
																		<td>${vo.userId}</td>
																	</tr>
																	<tr>
																		<td>성별</td>
																		<td>${vo.userGender}</td>
																	</tr>
																	<tr>
																		<td>전화번호</td>
																		<td>${vo.userTel1}-${vo.userTel2}-${vo.userTel3}</td>
																	</tr>
																	<tr>
																		<td>이메일</td>
																		<td>${vo.userEmail}</td>
																	</tr>
																	<tr>
																		<td>주소</td>
																		<td>${vo.userAddress}</td>
																	</tr>
																	<tr>
																		<td>생일</td>
																		<td>${vo.userBirth}</td>
																	</tr>
																	<tr>
																		<td>면허증</td>
																		<td>${vo.userLicense}</td>
																	</tr>
																	<tr>
																		<td>가입일</td>
																		<td>${vo.userRegdate}</td>
																	</tr>
																</tbody>
															</table>
													    </div>
											      		<div class="modal-footer">
											      		 	<a href='<c:url value="/administrator/user/userWithdraw.do?userId=${vo.userId}" />'>
											      			<button type="button" class="btn btn-default">
													            탈퇴
													        </button>
													        </a>
													        <button type="button" class="btn btn-default" data-dismiss="modal">
													        Close
													        </button>
											      		</div>
											    	</div>
												</div>
											</div>
										</td>
										<td style="text-align: center">${vo.userName}</td>
										<td>${vo.userEmail}</td>
										<td>${vo.userTel1}-${vo.userTel2}-${vo.userTel3}</td>
										<td>${vo.userBirth}</td>
										<td>${vo.userAddress}</td>
										<td>${vo.userGender}</td>
										<td>${vo.userLicense}</td>
										<td>
											<fmt:formatDate value="${vo.userRegdate}" pattern="yyyy-MM-dd" />
										</td>
									</tr>
									<c:set var="u" value="${u+1}" />
								</c:forEach>
							</tbody>
						</table>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<nav>
						<ul class="pagination">
							<c:if test="${pagingInfo.firstPage>1}">
								<li>
									<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"
										aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
	
							<c:forEach var="i" begin="${pagingInfo.firstPage}"
								end="${pagingInfo.lastPage}">
								<c:if test="${i==pagingInfo.currentPage}">
									<li class="active">
										<a href="#">${i}</a>
									</li>
								</c:if>
								
								<c:if test="${i!=pagingInfo.currentPage}">
									<li>
										<a href="#" onclick="pageFunc(${i})">${i}</a>
									</li>
								</c:if>
							</c:forEach>
	
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
								<li>
									<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"
										aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
				<div class="col-md-4"></div>
			</div>
			<div class="divSearch container">
				<div class="col-md-4">
					<form name="frmSearch" method="post"
						action="<c:url value="/administrator/user/userInList.do" />">
						<select name="searchCondition">
							<option value="user_id"
								<c:if test="${'user_id'==param.searchCondition}">
		            				selected            	
		            			</c:if>>회원아이디
							</option>
							<option value="user_name"
								<c:if test="${'user_name'==param.searchCondition}">
		            				selected            	
		            			</c:if>>회원이름
							</option>
						</select>
						<input type="text" name="searchKeyword" title="검색어 입력"
							value="${param.searchKeyword}">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
		</div>		
	</div>
</div>
<%@ include file="../include/bottom.jsp"%>