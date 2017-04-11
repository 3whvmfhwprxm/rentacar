<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/jquery/jquery-3.1.1.min.js"></script>
<body>
<div id="counsel_div">
<p><a href='<c:url value="/counselor/consel_nonmember.do"/>'>비회원예약</a></p>
<p><a href='<c:url value="/counselor/consultation_inquiry.do"/>'>상담문의</a></p>
<p><a href='<c:url value="/counselor/consultation_notice_board.do"/>'>게시판</a></p>
<p><a href='<c:url value="/counselor/consel_statistics.do"/>'>통계</a></p>
<p><a href='<c:url value="/counselor/counselor_manage.do"/>'>상담사 관리</a></p>
</div>
<article>