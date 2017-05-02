<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc_user/top.jsp" %>
<script type="text/javascript">	
	function pageFunc(curPage){
		document.frmPage.currentPage.value=curPage;
		frmPage.submit();
	}
	
	$(document).ready(function() {
	    var panels = $('.user-infos');
	    var panelsButton = $('.dropdown-user');
	    panels.hide();

	    //Click dropdown
	    panelsButton.click(function() {
	        //get data-for attribute
	        var dataFor = $(this).attr('data-for');
	        var idFor = $(dataFor);

	        //current button
	        var currentButton = $(this);
	        idFor.slideToggle(400, function() {
	            //Completed slidetoggle
	            if(idFor.is(':visible'))
	            {
	                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
	            }
	            else
	            {
	                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
	            }
	        })
	    });


	    $('[data-toggle="tooltip"]').tooltip();

	    $('button').click(function(e) {
	        e.preventDefault();
	        alert("This is a demo.\n :-)");
	    });
	});
</script>

<style type="text/css">
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
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/logincss.css"/>
	<form name="frmPage" method="get" action='<c:url value="/user/serviceCenter.do" />'>
		<input type="hidden" name="currentPage">
	</form>
<div class="container">
<h1 class="welcome text-center"><br>공지사항</h1>
 <div class="well col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
 	<c:forEach var="vo" items="${unList }">
        <div class="row user-row">
            <div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
                <img class="img-circle"
                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                     alt="User Pic">
            </div>
            <div class="col-xs-8 col-sm-9 col-md-10 col-lg-10">
                <strong>${vo.unoticeTitle}</strong><br>
                <span class="text-muted">${vo.adminId}</span>
            </div>
            
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 dropdown-user" data-for=".row_id_${vo.unoticeNo }">
                <i class="glyphicon glyphicon-chevron-down text-muted"></i>
            </div>
        </div>
    
        <div class="row user-infos row_id_${vo.unoticeNo }">
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">${vo.unoticeTitle}</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
                                <img class="img-circle"
                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=100"
                                     alt="User Pic">
                            </div>
                            <div class="col-xs-2 col-sm-2 hidden-md hidden-lg">
                                <img class="img-circle"
                                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                                     alt="User Pic">
                            </div>
                            <div class="col-xs-10 col-sm-10 hidden-md hidden-lg">
                                <dl>
                                    <dt>글번호</dt>
                                    <dd>${vo.unoticeNo }</dd>
                                    <dt>글제목</dt>
                                    <dd>${vo.unoticeTitle }</dd>
                                    <dt>작성시간</dt>
                                    <dd>${vo.unoticeRegdate }</dd>
                                    <dt>공지사항 내용</dt>
                                    <dd>${vo.unoticeContent }</dd>
                                </dl>
                            </div>
                            <div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
                                <table class="table table-user-information">
                                    <tbody>
                                    <tr>
                                        <td>글번호</td>
                                        <td>: ${vo.unoticeNo }</td>
                                    </tr>
                                    <tr>
                                        <td>글제목</td>
                                        <td>: ${vo.unoticeTitle }</td>
                                    </tr>
                                    <tr>
                                        <td>작성시간</td>
                                        <td>: ${vo.unoticeRegdate }</td>
                                    </tr>
                                    <tr>
                                        <td>공지사항 내용</td>
                                        <td>: ${vo.unoticeContent }</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>

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
	

<%@ include file="../inc_user/bottom.jsp" %>















