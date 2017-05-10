<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
	
	});
</script>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<div class="container">
	<form name="frmEdit" id="frmEdit">
	 	<!-- 선택한 공지사항글 내용 표시 -->
	    <table class="table">
	      <tbody>
	        <tr>
	          <td colspan="2">제목:<input type="text" value="${cnvo.cnoticeTitle}"></td>
	        </tr>
	        <tr>
	          <td>작성자:${cnvo.adminId}</td>
	          <td>등록일:<fmt:formatDate value="${cnvo.cnoticeRegdate}" pattern="yyyy-MM-dd hh:mm"/></td>
	        </tr>
	      </tbody>
	    </table>
	    <div class="form-group">     
			<textarea id="content" name="content" class="form-control" rows="40" >${cnvo.cnoticeContent}</textarea>
		</div>
		<script>CKEDITOR.replace('content');</script>
	    <br>
	    <input type="button" value="목록" name="cNoList" id="cNoList">
	    <%-- <a type="button" class="btn btn-sm btn-primary"
	          href="<c:url value='/admin/Board/cNotice.do'/>"><i>목록</i></a> --%>
		<c:if test="${vo.cnoticeVisible=='Y' }">
			<input type="button" value="글 감추기" name="cNoHide" id="cNoHide">
		</c:if>
	    <c:if test="${vo.cnoticeVisible=='N' }">
			<input type="button" value="글 보이기" name="cNoShow" id="cNoShow">
		</c:if>    
	    <input type="button" value="수정" name="cNoModify" id="cNoModify">
	    <input type="button" value="삭제" name="cNoDelete" id="cNoDelete">    
    </form>
</div>
</body>
</html>