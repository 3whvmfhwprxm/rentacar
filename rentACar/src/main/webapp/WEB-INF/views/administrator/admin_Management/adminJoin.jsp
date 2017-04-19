<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<div class="container">
	<h2>새 관리자 추가</h2>
	<form name="AdminEditfrm" id="AdminEditfrm" method="post" action="<c:url value='/admin/Mng/adminJoin.do' />">
		<div>
			<label>관리자 ID:</label><input type="text" name="adminId"><br>
		</div>
		<div>
			<label>관리자 PWD:</label><input type="password" name="adminPwd"><br>
		</div>
		<div>
			<label>관리자 이름:</label><input type="text" name="adminName"><br>
		</div>
		<div>
			<label>연락처:</label>
			<input type="text" name="adminTel1" id="adminTel1">-<input type="text" 
				name="adminTel2" id="adminTel2">-<input type="text" name="adminTel3" id="adminTel3"><br>
		</div>		
		<div>
			<label>이메일:</label>
			<input type="text" name="adminEmail1" id="adminEmail1">@<input type="text" name="adminEmail2" id="adminEmail2">
		</div>
		<br>
		<div>
			<label>관리자 등급:</label>
			<select name="adminAuthcode" id="adminAuthcode">
				<option value="0">선택</option>
			    <option value="1">관리자</option>
				<option value="2">부관리자</option>
				<option value="3">상담장</option>
				<option value="4">상담사</option>
				<option value="5">기타</option>
			</select>
		</div>
	<div>
		<input type="submit" value="관리자 입력" name="btsubmit" id="btsubmit" >
	</div>
	</form>
</div>
</body>
</html>