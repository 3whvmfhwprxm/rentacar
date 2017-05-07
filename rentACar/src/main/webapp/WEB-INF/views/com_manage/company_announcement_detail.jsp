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
                        <td>${CompanyNoticeVo.cnoticeRegdate}</td>
                      </tr>
                   
              
                      <tr>
                        <td>조회수</td>
                        <td>${CompanyNoticeVo.cnoticeReadcount}</td>
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
<%@ include file="../inc_company/company_bottom.jsp" %>