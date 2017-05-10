<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company.css/company_announcement.css"/>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
<!-- 공지사항 -->
<!-- 페이지 처리용 폼 -->
	<form name="frmPage" method="post" action='<c:url value="/com_manage/company_announcement.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>
	

<div class="container">
<legend>공지사항</legend>
	<pre>
		<code>
		업체에 공지사항를 보여주며, 페이지당 10개의 목록을 보여줍니다.
		검색은 제목, 내용, 작성자 으로 검색이 가능하며 대소문자 구분없이 쓰셔도 검색이 됩니다.
		글제목을 클릭할 경우 상세정보 페이지가 나오며 더 자세한 볼수 있습니다
		**<strong>DB(데이터베이스)</strong> 관리는 관리자에게만 주어지는 기능이나 임의 삭제는 불가하며, 요청시 사 내 규정에 따라 처리됩니다.
    	</code>
	</pre>
	<div class="row1">
		<div class="col-lg-12">
			<table class="table table-stripped">
				<thead>
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>관리자 아이디</th>
						<th>작성시간</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty cnList}">
						<tr>
							<td colspan="8" class="align_center">공지사항이 존재하지 않습니다.</td>
						</tr>
					</c:if>

					<c:if test="${!empty cnList }">
						<c:forEach var="vo" items="${cnList }">
							<c:if test='${vo.cnoticeVisible!="N" }'>
							<tr>
								<c:if test="${!empty vo.cnoticeDeldate }"> class="danger" </c:if>
								<td>${vo.cnoticeNo }</td>
								<td class="style">					
									<!-- 제목이 긴 경우 일부만 보여주기 -->
									<a href='<c:url value="/com_manage/countUpdate.do?cnoticeNo=${vo.cnoticeNo}"/>'>
									<c:if test="${fn:length(vo.cnoticeTitle)>30 }">
											${fn:substring(vo.cnoticeTitle, 0, 30) }...
									</c:if>
									<c:if test="${fn:length(vo.cnoticeTitle)<=30 }">
											${vo.cnoticeTitle}
									</c:if>
									</a>
								</td>
								<td>${vo.adminId }</td>
								<td><fmt:formatDate value="${vo.cnoticeRegdate }" pattern="yyyy-MM-dd hh:mm"/></td>
								<td>${vo.cnoticeReadcount }</td>
							</tr>
							</c:if>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div class="row">
				<div class="col-md-8">
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
							<img
							src='${pageContext.request.contextPath}/images/first.JPG'
							alt="이전블럭으로">
						</a>
					</c:if>
					<c:forEach var="i" begin="${pagingInfo.firstPage}"
						end="${pagingInfo.lastPage}">
						<c:if test="${i==pagingInfo.currentPage }">
							<span class="a2">${i}</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a class="a1" href="#" onclick="pageFunc(${i})">[${i}]</a>
						</c:if>
					</c:forEach>

					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage}">
						<a class="a1" href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
							<img
							src='${pageContext.request.contextPath}/images/last.JPG'
							alt="다음블럭으로">
						</a>
					</c:if>
				</div>
		<div class="divSearch container">
			<form name="frmSearch" id="frmSearch" method="post"
				action="<c:url value="/com_manage/company_announcement.do" />">
				<select name="searchCondition">				
					<option value="cnotice_title"
						<c:if test="${'cnotice_title'==param.searchCondition}">
	            		selected            	
	            	</c:if>>제목</option>
	            	
					<option value="cnotice_content"
						<c:if test="${'cnotice_content'==param.searchCondition}">
	            		selected            	
	            	</c:if>>내용</option>
	            	
	            	<option value="admin_id"
						<c:if test="${'admin_id'==param.searchCondition}">
	            		selected            	
	            	</c:if>>작성자</option>	            	
				</select> 
				<input type="text" name="searchKeyword" title="검색어 입력"	value="${param.searchKeyword}"> 
				<input type="submit" value="검색" class="btn btn-primary btn-sm btn3d">
			</form>
		</div>
			</div>
			</div>
		</div>
	</div>

<style>
footer{
    padding: 10px;
    color: #fff;
    font-size: 14px;
    background-color: #2a8fcf;
    margin-top: 100px;
    bottom:0;
    position: absolute;
	width: 100%;
	height: 80px;
}
</style>
	<footer>
            <div class="row">
                <div class="col-md-12" style="size: 12px; text-align: center;">
                    뉴프랜 - 3조렌터카  대표 : 현대스쿨 사업자 번호 485-46-94541 통신판매번호 제 2014-서울광진-0718 호
					주소 : 서울특별시 영등포구 당산동 287-14<br>
					이메일 : 3teamRentCar@naver.com  전국대표번호 : 1530-5500(HP. 010-7844-0114)  팩스번호 : 0505-554-7000<br>
					Copyright ⓒ 3조렌터카. All Rights Reserved
                </div>
            </div>
    </footer>
</body>
</html>




