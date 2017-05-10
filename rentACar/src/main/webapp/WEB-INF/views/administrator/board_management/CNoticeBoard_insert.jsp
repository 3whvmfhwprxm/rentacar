<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cNoInsert").click(function(){
						
			if($("#cnoticeTitle").val()==''){
				alert("공지 제목을 입력하셔야 합니다.");
				return;
			}else{
				$("#frmInsert").prop("action", "<c:url value='/admin/Board/comNoticeInsert.do' />");
				$("#frmInsert").submit();				
			}			
		});
		
		$("#cNoList").click(function(){
			if(confirm("작성중인 내용을 저장하지 않고 이동하시겠습니까?")){
				location.href="<c:url value='/admin/Board/cNotice.do' />";
			}
		});
	});
	
	
</script>
<style>
	.bodyClass{padding-top: 30px;width: 80%;padding-left: 40px;}
</style>

<div class="w3-container bodyClass">
<h3><i class="fa fa-list"></i>&nbsp; 업체 공지 입력하기 </h3>
<pre>
* 업체에서 보게될 공지 내용을 작성합니다.
* 작성 완료후 바로 업체 공지 게시판에 보이지는 않습니다.
* 작성 완료후 작성하신 목록에서 해당글을 선택하시고 보이기 처리 하셔야지 해당 업체에서 보이게 됩니다.
</pre>
	<form name="frmInsert" id="frmInsert" method="post">
		
	 	<!-- 선택한 공지사항글 내용 표시 -->
	    <table class="table">
	      <tbody>
	        <tr>
	          <td colspan="2"> 제목: <input type="text" name="cnoticeTitle" id="cnoticeTitle" size="100"></td>
	        </tr>
	        <tr>
	          <td> 작성자: ${sessionScope.Admin_Id}</td>
	          <td></td>
	        </tr>
	      </tbody>
	    </table>
	    <div>	    	  
			<textarea id="cnoticeContent" name="cnoticeContent" class="form-control" rows="40" ></textarea>
			<script>CKEDITOR.replace('cnoticeContent');</script>   
		</div>		
	    <br>
	    <input type="button" value="목록" name="cNoList" id="cNoList">
	    <input type="button" value="입력" name="cNoInsert" id="cNoInsert"> <strong>(*입력하셔도 글이 바로 노출되지 않습니다.)</strong>  
    </form>
</div>
</body>
</html>