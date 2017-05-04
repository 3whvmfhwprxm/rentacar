<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc_user/top.jsp" %>

<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
	<form name="frmPage" method="post" action='<c:url value="/user/confirm.do" />'>
		<input type="hidden" name="currentPage">
	</form>
<br><br>
<div class="container">	
	<div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h3 class="panel-title">${sessionScope.userId} 님</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table" width="100%">
                <thead>
                    <!-- <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="예약번호" disabled></th>
                        <th><input type="text" class="form-control" placeholder="회원아이디" disabled></th>
                        <th><input type="text" class="form-control" placeholder="대여시작일" disabled></th>
                        <th><input type="text" class="form-control" placeholder="대여시작시간" disabled></th>
                        <th><input type="text" class="form-control" placeholder="반납일" disabled></th>
                        <th><input type="text" class="form-control" placeholder="반납시간" disabled></th>
                        <th><input type="text" class="form-control" placeholder="업체보유차량" disabled></th>
                        <th><input type="text" class="form-control" placeholder="보험여부" disabled></th>
                        <th><input type="text" class="form-control" placeholder="예약일시" disabled></th>
                        <th><input type="text" class="form-control" placeholder="전화번호" disabled></th>
                    </tr> -->
                    <tr class="filters">
                        <th><input style="text-align: center;" type="text" class="form-control" placeholder="예약번호" disabled></th>
                        <th><input style="text-align: center;" type="text" class="form-control" placeholder="대여시작일" disabled></th>
                        <th><input style="text-align: center;" type="text" class="form-control" placeholder="대여반납일" disabled></th>
                        <!-- <th><input type="text" class="form-control" placeholder="대여시작시간" disabled></th> -->
                        <th><input style="text-align: center;" type="text" class="form-control" placeholder="차량넘버" disabled></th>
                        <!-- <th><input type="text" class="form-control" placeholder="반납시간" disabled></th> -->
                        <th><input style="text-align: center;" type="text" class="form-control" placeholder="예약일시" disabled></th>
                        <th><input style="text-align: center;" type="text" class="form-control" placeholder="차량대여업체명" disabled></th>
                        <th><input style="text-align: center;" type="text" class="form-control" placeholder="업체전화번호" disabled></th>
                        <th><input style="text-align: center;" type="text" class="form-control" placeholder="예약취소" disabled></th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${empty alist}">
                	<tr>
				  		<td colspan="5" style="text-align: right;"><b>예약 데이터가 존재하지 않습니다.</b></td>
				  	</tr>
				</c:if> 
                	<c:forEach var="vo" items="${alist }">
                    <tr>
                        <td style="text-align: center;"><a data-toggle="modal" href="#myModal1">${vo.reservNum}</a></td>
                        <%-- <td style="text-align: center;"><fmt:formatDate value="${vo.reservStartDate}" pattern="yyyy-MM-dd"/> </td> --%>
                        <td style="text-align: center;">${vo.reservStartDate}</td>
                        <td style="text-align: center;">${vo.reservEndDate}</td>
                        <%-- <td>${vo.reservStartTime} 시</td> --%>
                        <td style="text-align: center;">09허4055</td>
                        <%-- <td>${vo.reservEndTime} 시</td> --%>
                        <td style="text-align: center;">${vo.reservDate}</td>
                        <td style="text-align: center;">renGo</td>
                        <td style="text-align: center;">${vo.userTel1}-${vo.userTel2}-${vo.userTel3}</td>
                        <td style="text-align: center;"><input data-toggle="modal" href="#myModal2" type="button" id="cancle" value="취소" width="10"></td>
                    </tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<nav style="text-align: center;">
				<ul class="pagination">
					<c:if test="${pagingInfo.firstPage>1 }">
						<li><a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
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
</div>

<!-- 예약번호클릭시 정보보기 -->
<div class="container">
	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
		<div class="modal fade" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">예약정보</h4>
					</div>
					<div class="modal-body">
						<form method="post" name="login_form" id="condetail" action="<c:url value="/user/confirm.do"/>">
							<div class="row">
					            <label class="control-label col-md-3" for="userId" style="text-align: right;">예약번호
					            </label>
					            <div class="col-md-5">
					              <input id="userId" name="userId" class="form-control" data-validate-length-range="6" data-validate-words="2"  required="required" value="${vo.reservNum}" type="text" disabled>
					            </div>
					        </div>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">예약자 이름
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2" required="required" type="text" disabled>
					            </div>
					        </div>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">대여시작일
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2"  required="required" type="text" disabled>
					            </div>
					        </div>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">대역반납일
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2"  required="required" type="text" disabled>
					            </div>
					        </div>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">차량넘버
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2"  required="required" type="text" disabled>
					            </div>
					        </div>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">예약일시
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2"  required="required" type="text" disabled>
					            </div>
					        </div>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">차량대여 업체명
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2"  required="required" type="text" disabled>
					            </div>
					        </div>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">업체 전화번호
					            </label>
					            <div class="col-md-5">
					              <input id="userEmail" name="userEmail" class="form-control" data-validate-length-range="6" data-validate-words="2"  required="required" type="text" disabled>
					            </div>
					        </div><br>
					        <div class="row">
					            <label class="control-label col-md-3" for="name" style="text-align: right;">반납인수 위치
					            </label>
								<!-- 1. 지도 노드 -->
					            <!-- * Daum 지도 - 지도퍼가기 -->
									<div id="daumRoughmapContainer1493816565568" class="root_daum_roughmap root_daum_roughmap_landing"></div>
					        </div><br>
							
							<!--
								2. 설치 스크립트
								* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
							-->
							<script charset="UTF-8" class="daum_roughmap_loader_script" src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
							
							<!-- 3. 실행 스크립트 -->
							<script charset="UTF-8">
								new daum.roughmap.Lander({
									"timestamp" : "1493816565568",
									"key" : "hhv9",
									"mapWidth" : "300",
									"mapHeight" : "200"
								}).render();
							</script>
					        
					        <div class="modal-footer">
			           		 <button type="submit" class="btn btn-primary" id="pwdSearch" data-dismiss="modal">확인</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.modal -->


<!-- 예약취소 -->
<div class="container">
	<div class="col-xs-12 col-sm-8 col-sm-offset-2">
		<div class="modal fade" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">예약취소을 취소하겠습니까?</h4>
					</div>
					<div class="modal-body">
						<form method="post" name="login_form" id="cancle" action="<c:url value="/user/#"/>">
					        <div class="modal-footer">
			           		 <button type="reset" class="btn btn-primary" id="reset" data-dismiss="modal">이전단계로</button>
			           		 <button type="submit" class="btn btn-primary" id="cancleBtn" data-dismiss="modal">예약취소</button>
						</div>
						</form>
					</div>
						
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.modal -->



<%@ include file="../inc_user/bottom.jsp" %>







