<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    var dateFormat = "yy/mm/dd",
      from = $( "#reservStartDate" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#reservEndDate" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
  <!-- 1.
	예약시작날짜, 예약종료날짜
	예약시작시간, 예약종료시간
	차종류(소형,중형,대형)
	조건을 입력받는 화면 보여주기
	
	2.
	위의 조건을 입력받고 '검색'을 누르면(post) 조건에 해당하는 리스트를 가져와서 보여준다
	이때 검색시 예약정보 테이블에서 예약시작날짜/예약종료날짜/예약시작시간/예약종료시간 -->
<h1>실시간 예약하기(예약가능차량 검색 조회/선택)</h1>
  
<div>

<form name="searchForm" id="searchForm" method="post" action="/inc_user/realTime.do"> 
<label for="from">대여일: </label>
<input type="text" id="reservStartDate" name="reservStartDate">
<label for="to">반납일: </label>
<input type="text" id="reservEndDate" name="reservEndDate">
차 종류(인승): <input type="text" id="carSize" name="carSize">
<p>
<input type="submit" value="조건에 맞는 차량 찾기">
</form>

</div>

<%@ include file="bottom.jsp" %>








