<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp" %>
<div class="container">
	<h2>관리자 정보 수정</h2>
	<form name="AdminEditfrm" id="AdminEditfrm" method="post" action="<c:url value='/admin/Mng/adminEdit.do' />">
		<input type="hidden" name="adminId" value="${avo.adminId }">
		<div>
			<label>관리자 ID:</label> ${avo.adminId }
		</div>
		<div>
			<label>관리자 이름:</label> ${avo.adminName }
		</div>
		<div>
			<label>등록일:</label> ${avo.adminRegdate }
		</div>
		<div>
			<label>연락처:</label>
			<input type="text" name="adminTel1" id="adminTel1" 
				value="${avo.adminTel1}">-<input type="text" name="adminTel2" id="adminTel2"
				value="${avo.adminTel2}">-<input type="text" name="adminTel3" id="adminTel3"
				value="${avo.adminTel3}">
		</div>
		<br>
		<div>
			<label>이메일:</label>
			<input type="text" name="adminEmail1" id="adminEmail1" 
			value="${avo.adminEmail1}">@<input type="text" name="adminEmail2" id="adminEmail2" value="${avo.adminEmail2}">
		</div>
		<br>
		<div>
			<label>관리자 등급:</label>
			<select name="adminAuthcode" id="adminAuthcode">
				<option value="0" 
					<c:if test='${avo.adminAuthcode==0}'>selected           	
			        </c:if>>선택</option>
			    <option value="1"
					<c:if test='${avo.adminAuthcode==1}'>selected           	
			        </c:if>>관리자</option>
				<option value="2"
					<c:if test='${avo.adminAuthcode==2}'>selected           	
			        </c:if>>부관리자</option>
				<option value="3"
				<c:if test='${avo.adminAuthcode==3}'>selected           	
			        </c:if>>상담장</option>
				<option value="4"
				<c:if test='${avo.adminAuthcode==4}'>selected           	
			        </c:if>>상담사</option>
				<option value="5"
				<c:if test='${avo.adminAuthcode==5}'>selected           	
			        </c:if>>기타</option>
			</select>
		</div>
	<div>
		<input type="submit" value="정보 수정" name="btsubmit" id="btsubmit" >
	</div>
	</form>
</div>
</body>
</html>