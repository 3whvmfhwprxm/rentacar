<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company.css/company_epilogue.css"/>
<!--전체 후기  -->
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>


<form name="frmPage" method="post" action='<c:url value="/com_manage/company_epilogue.do" />'>
		<input type="hidden" name="currentPage"> 
		<input type="hidden" name="searchCondition" value="${param.searchCondition}"> 
		<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
	</form>

    <div class="container">
    <legend>업체후기</legend>
        <!--dropdown menu-->
        <div class="collapse navbar-collapse" id="MainMenu"><br><br>
        <pre>
		<code>
		업체의 현재 등록된 후기리스트를 보여주며, 페이지당 15개의 목록을 보여줍니다.
		검색은 회원아이디, 후기내용 으로 검색이 가능하며 대소문자 구분없이 쓰셔도 검색이 됩니다.
		**<strong>DB(데이터베이스)</strong> 관리는 관리자에게만 주어지는 기능이나 임의 삭제는 불가하며, 요청시 사 내 규정에 따라 처리됩니다.
    	</code>
		</pre>
            <ul class="nav navbar-nav menu-list">
            	 <li class="dropdown list-category">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                       <i class="fa fa-navicon"></i> 정렬기준 <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                    	<li><a href="javascript:fncSort('date')">최근등록순</a></li>
                    </ul>
                </li>
        <br><br>
        <!--table-->
       <table class="table table-striped">
       <thead>
       		<tr>
				<th>글번호</th>
				<th>후기내용</th>
				<th>회원아이디</th>
				<th>친절도</th>
				<th>청결도</th>
				<th>편의성</th>
				<th>작성일</th>
			</tr>
        </thead>
        <tbody>
        <!-- 반복시작 -->
		<c:if test="${empty cList }">
			<td colspan="10">데이터가 없습니다.</td>
		</c:if>
		
	<c:forEach var="vo" items="${cList }" varStatus="i">
		<tr>
			<td>${vo.cmtNo}</td>
			<td>${vo.cmtContent}</td>
			<td>${vo.userId}</td>
			<c:if test="${vo.cmtKindScore=='0'}">
				<td><img src="<c:url value='/images/star/rating0.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtKindScore=='1'}">
				<td><img src="<c:url value='/images/star/rating02.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtKindScore=='2'}">
				<td><img src="<c:url value='/images/star/rating04.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtKindScore=='3'}">
				<td><img src="<c:url value='/images/star/rating06.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtKindScore=='4'}">
				<td><img src="<c:url value='/images/star/rating08.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtKindScore=='5'}">
				<td><img src="<c:url value='/images/star/rating10.png'/>"></td>
			</c:if>
			
			<c:if test="${vo.cmtCleanScore=='0'}">
				<td><img src="<c:url value='/images/star/rating0.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtCleanScore=='1'}">
				<td><img src="<c:url value='/images/star/rating02.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtCleanScore=='2'}">
				<td><img src="<c:url value='/images/star/rating04.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtCleanScore=='3'}">
				<td><img src="<c:url value='/images/star/rating06.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtCleanScore=='4'}">
				<td><img src="<c:url value='/images/star/rating08.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtCleanScore=='5'}">
				<td><img src="<c:url value='/images/star/rating10.png'/>"></td>
			</c:if>
			
			<c:if test="${vo.cmtConvScore=='0'}">
				<td><img src="<c:url value='/images/star/rating0.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtConvScore=='1'}">
				<td><img src="<c:url value='/images/star/rating02.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtConvScore=='2'}">
				<td><img src="<c:url value='/images/star/rating04.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtConvScore=='3'}">
				<td><img src="<c:url value='/images/star/rating06.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtConvScore=='4'}">
				<td><img src="<c:url value='/images/star/rating08.png'/>"></td>
			</c:if>
			<c:if test="${vo.cmtConvScore=='5'}">
				<td><img src="<c:url value='/images/star/rating10.png'/>"></td>
			</c:if>
			<td><fmt:formatDate value="${vo.cmtRegdate}" pattern="yyyy-MM-dd hh:mm"/></td>
		</tr>
	</c:forEach>

	 <!-- 반복끝 --> 
        </tbody>
    </table>
    </div>
	<div class="row">
		<div class="col-md-4">
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
		</div>
	</div>
		<div class="divSearch">
			<form name="frmSearch" id="frmSearch" method="post"
				action="<c:url value="/com_manage/company_epilogue.do" />">
				<select name="searchCondition">				
					<option value="user_id"
						<c:if test="${'user_id'==param.searchCondition}">
	            		selected            	
	            	</c:if>>회원아이디</option>
	            	
					<option value="cmt_content"
						<c:if test="${'cmt_content'==param.searchCondition}">
	            		selected            	
	            	</c:if>>후기내용</option>
				</select> 
				<input type="text" name="searchKeyword" id="searchKeyword" title="검색어 입력"	value="${param.searchKeyword}"> 
				<input type="submit" value="검색" id="submit" class="btn btn-primary btn-sm btn3d">
			</form>
		</div>
	</div>

<%@ include file="../inc_company/company_bottom.jsp" %>