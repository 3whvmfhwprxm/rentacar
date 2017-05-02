<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp" %>

<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
</script>
	<form name="frmPage" method="get" action='<c:url value="/user/review.do" />'>
		<input type="hidden" name="currentPage">
	</form>

<div class="container">
<h2 style="font-family:'Saysettha OT'; src:url(http://foton.com.la/font/Saysettha OT.ttf); color:#00679a;">이용후기</h2>

<table width="100%" border="0">
	<c:set var="i"  value="0"/>
	<c:forEach var="vo" items="${alist }">
		<c:if test="${i%2==0 }">
			<tr>
		</c:if>		   
		<c:if test="${i%2!=0 }">
			<td width="10%"></td>
		</c:if>
        <td width="40%" style="vertical-align:top">
            <h4 style="font-family:'IowanOldSt BT'; src:url(http://foton.com.la/font/iowaosbd.ttf)"><b>${vo.comId}</b></h4>
            <span class="thumbnail">
                <img src="<c:url value='/user_img/${vo.cmtImg1}'/>">
                <div style="padding: 15px;">
                <span><b>사용자 : ${vo.userId}</b></span>
               	<span style="float: right;">친절도<span>${vo.cmtKindScore }</span>     |     청결도<span>${vo.cmtCleanScore }</span>     |     편의성<span>${vo.cmtConvScore }</span></span>
                </div>
               	<hr>
               	<div style="padding: 15px;">
               		<span><b>${vo.cmtContent }</b></span><br>
              		<span><b>${vo.cmtRegdate}</b></span>
               	</div>
            </span>
            <hr>
        </td>
        <c:if test="${i%2!=0 }">
			</tr>
		</c:if>
		<c:set var="i" value="${i+1 }"/>
    </c:forEach>
</table>
</div>


<!-- 페이징 -->
<div class="row">
	<div class="col-md-4"></div>
		<div class="col-md-4">
			<nav>
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











	<!-- 지도 -->
	<!-- <div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0f24996b0e58b92f5c277a3bf3b4f066"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script> -->
<%@ include file="../inc_user/bottom.jsp" %>