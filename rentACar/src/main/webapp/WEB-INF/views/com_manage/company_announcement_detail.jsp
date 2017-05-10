<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
	
	});
</script>
<style>
.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:5%;
}

</style>

<div class="container">
<legend>공지사항 상세페이지</legend>
      <div class="row">
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">공지사항 상세보기</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>제목:</td>
                        <td>${CompanyNoticeVo.cnoticeTitle}</td>
                      </tr>
                      <tr>
                        <td>작성자:</td>
                        <td>${CompanyNoticeVo.adminId}</td>
                      </tr>
                      <tr>
                        <td>등록일:</td>
                        <td><fmt:formatDate value="${CompanyNoticeVo.cnoticeRegdate}" pattern="yyyy-MM-dd hh:mm"/></td>
                      </tr>
                      <tr>
                        <td>내용</td>
                        <td>${CompanyNoticeVo.cnoticeContent}</td>
                      </tr>
                    </tbody>
                  </table>

                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"
                        href="<c:url value='/com_manage/company_announcement.do'/>"><i>목록</i></a>
                 </div>
          </div>
        </div>
      </div>
<style>
.footer{
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
	<footer class="footer">
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