<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>
<h2>차량 옵션 등록 페이지</h2>
<br>
<hr>
<h3>차량등록</h3>

<form name="frmCO" method="post"
	action="<c:url value='/com_manage/regist_option.do'/>">
	차량번호<input type="text" name="" id=""> &nbsp;&nbsp;&nbsp;
	모델명<input type="text" name="" id=""><br>
     제조사<input type="text" name="" id=""><br><br>
      연료<select name="" id="d" title="연료">
		<option>휘발유</option>
		<option>디젤</option>
		<option>LPG</option>
	</select><br> 승차인원<select>
		<option>2</option>
		<option>3</option>
		<option selected="selected">4</option>
		<option>5</option>
		<option>6</option>
		<option>기타</option>
	</select> 출시년도<select>
		<option>2017</option>
		<option>2016</option>
		<option>2015</option>
		<option>2014</option>
	</select><br> 변속기<select>
		<option>AUTO</option>
		<option>STICK</option>
	</select> 차량유형<select>
		<option>소형</option>
		<option>준중형</option>
		<option>중형</option>
		<option>대형</option>
		<option>승합</option>
		<option>RUV</option>
		<option>SUV</option>
	</select><br>
	<h3>옵션등록</h3>
	<input type="checkbox" name="" id="" value="">블랙박스 <input
		type="checkbox" name="" id="" value="">금연차 <input
		type="checkbox" name="" id="" value="">후방카메라 <input
		type="checkbox" name="" id="" value="">후방센서 <br> <input
		type="checkbox" name="" id="" value="">네비게이션 <input
		type="checkbox" name="" id="" value="">썬루프 <input
		type="checkbox" name="" id="" value="">블루투스 <input
		type="checkbox" name="" id="" value="">AUX <br> <input
		type="checkbox" name="" id="" value="">스마트키 <br>
	<h3>차량가격</h3>
	평일예약가격<input type="text" name="" id=""> 주말예약가격<input
		type="text" name="" id=""> 성수기예약가격<input type="text" name=""
		id=""> 극성수기예약가격<input type="text" name="" id=""> <br>
	<br>
	<hr>
	<input type="submit" value="등록"> <input type="reset" value="취소">
</form>

<br>
<br>
<br>
<hr>
<%@ include file="../inc_company/company_bottom.jsp"%>