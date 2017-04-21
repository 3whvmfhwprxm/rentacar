<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<style type="text/css">
	table tr th{
		background-color: #d8ffb0;
		text-align: center;
	}
	
	table tr td{
		text-align: center;
	}
	

</style>
<!-- 업체 차량 조회 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<body>
    <div class="container">
        <legend>차량 현황</legend>
        <!--dropdown menu-->
        <div class="collapse navbar-collapse" id="MainMenu">
            <ul class="nav navbar-nav menu-list">
            	 <li class="dropdown list-category">
                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-navicon"></i> 정렬기준 <i class="fa fa-angle-down" aria-hidden="true"></i>
                    </a>
                    <ul class="dropdown-menu mega-dropdown-menu">
                        <li><a href="#">모델(차량)별</a></li>
                        <li><a href="#">사용가능별</a></li>
                        <li><a href="#">차량번호별</a></li>
                    </ul>
                </li>
        <br><br>
        <!--table-->
       <table class="table table-striped">
       <thead>
       		<tr>
       			<th><input type="checkbox" id="" name=""></th>
  				<th>차량번호</th>
				<th>차량모델코드</th>
				<th>모델명</th>
				<th>옵션</th>
				<th>차량사용가능여부</th>
				<th>차량상태변경</th>
				<th>차량상태</th>
				<th>차량상태변경버튼</th>
			</tr>
        </thead>
        <tbody>
      	
        
        <!-- 반복시작 -->
	<c:forEach var="map" items="${cclist }">
		<tr>
			<td><input type="checkbox" id="" name=""></td>
			<td><a href="<c:url value='/com_manage/company_ccarDetail.do?ccarCarId=${map["CCAR_CAR_ID"] }' /> " />${map['CCAR_CAR_ID']}</td>
			<td>${map['CAR_CODE'] }</td>
			<td>${map['CAR_NAME'] }</td>
			<td><a href="#">옵션상세보기</a></td>
			<c:if test="${map['CCAR_USE_YN']=='Y' }"><td>사용가능</td>  </c:if>
			<c:if test="${map['CCAR_USE_YN']=='N' }"><td>사용불가</td>  </c:if>
			<td><button>여부변경</button></td>
			<td></td>
			<td><button>상태변경</button></td>
		</tr>
	</c:forEach>
	 <!-- 반복끝 --> 
        
        
        
        </tbody>
    </table>
    </div>
</body>

</html>


<table border="1" width=100%>
	
	
            <%-- <c:forEach var="map" items="${authList}">
            	<option value="${map['AUTHCODE'] }">${map['AUTHNAME']}</option>
            </c:forEach>
            --%>
	
	 
</table>


<%@ include file="../inc_company/company_bottom.jsp" %>