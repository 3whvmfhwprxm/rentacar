<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc_user/top.jsp" %>

<h3>notice</h3>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">관리자 아이디</span> <span>${vo.adminId }</span>
		</div>
		<div class="firstDiv">
			<span class="sp1">글번호</span> <span>${vo.unoticeNo }</span>
		</div>
		<div class="firstDiv">
			<span class="sp1">글제목</span> <span>${vo.unoticeTitle }</span>
		</div>
		<div class="firstDiv">
			<span class="sp1">작성시간</span> <span>${vo.unoticeRegdate }</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span>${vo.unoticeReadcount }</span>
		</div>
	</div>

<%@ include file="../inc_user/bottom.jsp" %>