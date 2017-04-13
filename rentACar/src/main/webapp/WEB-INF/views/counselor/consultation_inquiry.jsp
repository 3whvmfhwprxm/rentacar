<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>consultation_inquiry</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div>
<div>
<div class="well">
    <table class="table">
      <thead>
      	<tr>
			<th>번호</th>
			<th>렌터카 업체</th>
			<th>예약차량</th>
			<th>결제가격</th>
			<th>예약날짜</th>
			<th>대여시간</th>
			<th>보험여부</th>
			<th>결제유무</th>
		</tr>
      </thead>
      <tbody>
       <tr>
			<td>1</td>
			<td>소나타렌터카</td>
			<td>부가티</td>
			<td>25,000원</td>
			<td>17년 4월 11일~12일</td>
			<td>23시간</td>
			<td>자차</td>
			<td>유</td>
		</tr>
        <tr>
			<td>1</td>
			<td>소나타렌터카</td>
			<td>부가티</td>
			<td>25,000원</td>
			<td>17년 4월 11일~12일</td>
			<td>23시간</td>
			<td>자차</td>
			<td>유</td>
		</tr>
       <tr>
			<td>1</td>
			<td>소나타렌터카</td>
			<td>부가티</td>
			<td>25,000원</td>
			<td>17년 4월 11일~12일</td>
			<td>23시간</td>
			<td>자차</td>
			<td>유</td>
		</tr>
        <tr>
			<td>1</td>
			<td>소나타렌터카</td>
			<td>부가티</td>
			<td>25,000원</td>
			<td>17년 4월 11일~12일</td>
			<td>23시간</td>
			<td>자차</td>
			<td>유</td>
		</tr>
       <tr>
			<td>1</td>
			<td>소나타렌터카</td>
			<td>부가티</td>
			<td>25,000원</td>
			<td>17년 4월 11일~12일</td>
			<td>23시간</td>
			<td>자차</td>
			<td>유</td>
		</tr>
        <tr>
			<td>1</td>
			<td>소나타렌터카</td>
			<td>부가티</td>
			<td>25,000원</td>
			<td>17년 4월 11일~12일</td>
			<td>23시간</td>
			<td>자차</td>
			<td>유</td>
		</tr>
      </tbody>
    </table>
</div>
<div class="pagination">
    <ul>
        <li><a href="#">Prev</a></li>
        <li><a href="#">1</a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">Next</a></li>
    </ul>
</div>
<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">Delete Confirmation</h3>
    </div>
    <div class="modal-body">
        <p class="error-text">Are you sure you want to delete the user?</p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
        <button class="btn btn-danger" data-dismiss="modal">Delete</button>
    </div>
</div>
<div class="well">
    <table class="table">
			<tr>
			<th>상담사 이름</th>
			<th>상담내용</th>
			<th>처리내용</th>
			<th>상담시간</th>
		</tr>
		<tr>
			<td>박주민 상담사</td>
			<td>내용내용 내용내용내용내용 내용내용내용내용 내용내용</td>
			<td>내용내용 내용내용내용내용 내용내용내용내용 내용내용</td>
			<td>2017-04-11 오후 7시 15분</td>
		</tr>
	</table>
	</div>
</div>
</div>


<div>
	<span>상담내용</span>
	<textarea rows="5" cols="50">상담내용 입력란</textarea>
	<button value="상담버튼">상담버튼</button>
</div>

<div>
	<span>처리내용</span>
	<textarea rows="5" cols="50">상담내용 입력란</textarea>
	<button value="처리버튼">처리버튼</button>
</div>
</body>
</html>