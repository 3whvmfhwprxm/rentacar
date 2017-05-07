<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery-ui.min.css' />" />
<script type="text/javascript" src='<c:url value="/jquery/jquery-ui.min.js"/>'></script>
<script type="text/javascript">	
	$(function(){
		$.setDefaultDate();
		
		$("#startDay").datepicker({
			dateFormat:'yy-mm-dd',
			changeYear: true,
			dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			monthNames:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});
		
		$("#endDay").datepicker({
			dateFormat:'yy-mm-dd',
			changeYear: true,
			dayNamesMin:['일', '월', '화', '수', '목', '금', '토'],
			monthNames:['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
		});
		
		$("#btWeek").click(function(){
			$.setTerm('d', 7);
		});
		
		$("#btMonth").click(function(){
			$.setTerm('m', 1);
		});
		
		$("#bt3Months").click(function(){
			$.setTerm('m', 3);
		});		
		
	});

	$.findDate=function(number){
		if(number<10){
			return number="0"+number;	
		}
		return number;
	}
	
	$.setTerm=function(type, term){
		//종료일 기준으로 7일전, 1개월전, 3개월전 날짜 구하기
		var arr = $("#endDay").val().split('-');	//2017-04-28
		var d=new Date(arr[0], arr[1]-1, arr[2]);	//new Date(2017.3,28)
		if(type=='d'){	//7일전
			d.setDate(d.getDate()-term);
		}else if(type=='m'){	//1개월전, 3개월전
			d.setMonth(d.getMonth()-term);
		}
	
		var sDay= $.setDateToString(d);

		$("#startDay").val(sDay);
	}
	
	$.setDefaultDate=function(){
		//시작일, 종료일에 현재일자 셋팅
		if($("#startDay").val()==''){
			var d=new Date();
			var stringDate=$.setDateToString(d);
			$("#startDay").val(stringDate);
			$("#endDay").val(stringDate);
		}
	}
	
	$.setDateToString=function(date){
		return date.getFullYear()+"-"+$.findDate((date.getMonth()+1))+"-"+$.findDate(date.getDate());
	}

</script>
조회기간
<input type="button" value="1주일" id="btWeek">
<input type="button" value="1개월" id="btMonth">
<input type="button" value="3개월" id="bt3Months">
	
<input type="text" name="startDay" id="startDay" value="${dateSearchVO2.startDay }"> 
~ 
<input type="text" name="endDay" id="endDay" value="${dateSearchVO2.endDay }">