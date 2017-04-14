<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/logincss.css"/>
<div class="container">
    <div class="page-header">
        <h3>고객센터<span class="pull-right label label-default">:)</span></h3>
    </div>
    <div class="row">
    	<div class="col-md-6">
            <div class="panel with-nav-tabs panel-default">
                <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1default" data-toggle="tab">공지사항</a></li>
                            <li><a href="#tab2default" data-toggle="tab">자주찾는 질문</a></li>
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1default">[공지사항]3조 렌트카 서비스 점검 안내</div>
                        <div class="tab-pane fade" id="tab2default">여러 대를 한 번에 예약할 수 있나요?</div>
                    </div>
                </div>
            </div>
        </div>
      </div>
</div>	
	
	
<%@ include file="bottom.jsp" %>