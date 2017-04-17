<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="top.jsp" %>
	<h1>confirm.jsp</h1>
	
	<div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">${sessionScope.userId} 님</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="예약번호" disabled></th>
                        <th><input type="text" class="form-control" placeholder="회원아이디" disabled></th>
                        <th><input type="text" class="form-control" placeholder="대여시작일" disabled></th>
                        <th><input type="text" class="form-control" placeholder="대여시작시간" disabled></th>
                        <th><input type="text" class="form-control" placeholder="반납일" disabled></th>
                        <th><input type="text" class="form-control" placeholder="반납시간" disabled></th>
                        <th><input type="text" class="form-control" placeholder="업체보유차량" disabled></th>
                        <th><input type="text" class="form-control" placeholder="보험여부" disabled></th>
                        <th><input type="text" class="form-control" placeholder="예약일시" disabled></th>
                        <th><input type="text" class="form-control" placeholder="전화번호" disabled></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${vo.reservNum}</td>
                        <td>${sessionScope.userId}</td>
                        <td>${vo.reservStartDate}</td>
                        <td>${vo.reservStartTime} 시</td>
                        <td>${vo.reservEndDate}</td>
                        <td>${vo.reservEndTime} 시</td>
                        <td>${vo.ccarCarId}</td>
                        <td>${vo.reservInsurance}</td>
                        <td>${vo.reservDate}</td>
                        <td>${vo.userTel1}-${vo.userTel2}-${vo.userTel3}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
<%@ include file="bottom.jsp" %>