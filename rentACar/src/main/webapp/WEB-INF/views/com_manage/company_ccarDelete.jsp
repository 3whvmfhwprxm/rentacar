<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>
<!-- 차량 상세보기  -->
<button class="btn btn-default" data-target="#layerpop" data-toggle="modal">모달출력버튼</button><br/>
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Header</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            Body
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-danger" data-dismiss="modal">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


<div id="dialog">
	<h2>삭제</h2>
	<p>다이알로그?</p>
</div>
<%@ include file="../inc_company/company_bottom.jsp"%>