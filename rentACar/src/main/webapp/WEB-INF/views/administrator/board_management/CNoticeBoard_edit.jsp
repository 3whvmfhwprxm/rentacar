<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cNoModify").click(function(){
			if($("#cnoticeTitle").val()==''){
				alert("공지 제목을 입력하셔야 합니다.");
				return;
			}else if($("#cnoticeContent").val()==''){
				alert("공지 내용을 입력하세요.");
				return;
			}else{
				$("#frmEdit").prop("action", "<c:url value='/admin/Board/comNoticeEdit.do' />");
				$("#frmEdit").submit();				
			}			
		});
		
		$("#cNoList").click(function(){
			if(confirm("작성중인 내용을 저장하지 않고 이동하시겠습니까?")){
				location.href="<c:url value='/admin/Board/cNotice.do' />";
			}
		});
		
		$("#cNoDelete").click(function(){
			if(confirm("정말로 공지를 삭제하시겠습니까?")){
				$("#frmEdit").prop("action",'<c:url value="/admin/Board/comNoticeDel.do?cnoticeNo='+'${cnvo.cnoticeNo}'+'" />');
				$("#frmEdit").submit();
			}			
		});
		
		$("#cNoHide").click(function(){
			if(confirm("해당 공지를 안보이기 처리하시겠습니까?")){
				$("#frmEdit").prop("action",'<c:url value="/admin/Board/comNoticeVisibleNo.do?cnoticeNo='+'${cnvo.cnoticeNo}'+'" />');
				$("#frmEdit").submit();
			}			
		});
		
		$("#cNoShow").click(function(){
			if(confirm("해당 공지를 보이기 처리하시겠습니까?")){
				$("#frmEdit").prop("action",'<c:url value="/admin/Board/comNoticeVisibleYes.do?cnoticeNo='+'${cnvo.cnoticeNo}'+'" />');
				$("#frmEdit").submit();
			}			
		});
		
	});
</script>
<style>
	.bodyClass{padding-top: 30px;width: 80%;padding-left: 40px;}
</style>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<div class="w3-container bodyClass">
<h3><i class="fa fa-list"></i>&nbsp; 업체 공지 수정하기 </h3>
<pre>
* 입력되어 있는 공지 내용을 수정합니다.
* 입력되어 있는 공지를 감추기 또는 보이기 처리 하실 수 있습니다.
* 입력되어 있는 공지를 삭제 처리 하실 수 있습니다.
* 삭제 또는 감추기 처리된 공지는 업체 공지게시판에서 사라져서 보이지 않게 처리됩니다.
</pre>

	<form name="frmEdit" id="frmEdit" method="post">
		<input type="hidden" name="cnoticeNo" value="${cnvo.cnoticeNo }">
		
	 	<!-- 선택한 공지사항글 내용 표시 -->
	    <table class="table">
	      <tbody>
	        <tr>
	          <td colspan="2"> 제목: <input type="text" name="cnoticeTitle" id="cnoticeTitle" value="${cnvo.cnoticeTitle}" size="100"></td>
	        </tr>
	        <tr>
	          <td> 작성자: ${cnvo.adminId}</td>
	          <td> 등록일: <fmt:formatDate value="${cnvo.cnoticeRegdate}" pattern="yyyy-MM-dd hh:mm"/></td>
	        </tr>
	      </tbody>
	    </table>
	    <div class="form-group">     
			<textarea id="cnoticeContent" name="cnoticeContent" class="form-control" rows="40" >${cnvo.cnoticeContent}</textarea>
		</div>
		<script>CKEDITOR.replace('cnoticeContent');</script>
	    <br>
	    <input type="button" value="목록" name="cNoList" id="cNoList">
		<c:if test="${cnvo.cnoticeVisible=='Y' }">
			<input type="button" value="글 감추기" name="cNoHide" id="cNoHide">
		</c:if>
	    <c:if test="${cnvo.cnoticeVisible=='N' }">
			<input type="button" value="글 보이기" name="cNoShow" id="cNoShow">
		</c:if>    
	    <input type="button" value="수정" name="cNoModify" id="cNoModify">
	    <input type="button" value="삭제" name="cNoDelete" id="cNoDelete">    
    </form>
</div>
</body>
</html>