<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="<c:url value='/jquery/jquery-ui.min.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery-ui.min.css'/>" >
	
<script type="text/javascript">
	$(function(){
		$.setToday();
		
		$("#startDay").datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월',
				'9월','10월','11월','12월']
		});	
		$("#endDay").datepicker({
			dateFormat:"yy-mm-dd",
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월',
				'9월','10월','11월','12월']
		});	
		
		$("#btWeek").click(function(){
			$.setTerm('d', 7);
		});
		$("#btMonth1").click(function(){
			$.setTerm('m', 1);
		});
		$("#btMonth3").click(function(){
			$.setTerm('m', 3);
		});
	});
	
	$.setTerm = function(type, term){
		//종료일 기준으로 7일전, 1개월전, 3개월전 날짜 구하기
		var arr = $("#endDay").val().split('-'); //2017-04-28
		var d = new Date(arr[0],arr[1]-1, arr[2]); 
			//=> new Date(2017,3,28)
		if(type=='d'){  //7일전
			d.setDate(d.getDate()-term);	
		}else if(type=='m'){ //1개월전, 3개월전
			d.setMonth(d.getMonth()-term);
		}

		var sDay= $.dateToString(d);
		
		$("#startDay").val(sDay);
	}
	
	$.findDate=function(d){
		var result=d;
		if(d<10){
			result="0"+d;
		}	
		return result;
	}
	
	$.dateToString=function(d){
		var sDay= d.getFullYear()+"-"+ $.findDate(d.getMonth()+1) 
			+ "-"+ $.findDate(d.getDate());
		
		return sDay;
	}
	
	$.setToday=function(){
		//시작일, 종료일에 현재일자 셋팅
		if($("#startDay").val()==''){
			var d = new Date();
			var str =$.dateToString(d);
			
			$("#startDay").val(str);
			$("#endDay").val(str);			
		}
	}
</script>
    
<b>조회기간</b>
	<input type="button" id="btWeek" value="1주일" style="color: black;">
	<input type="button" id="btMonth1" value="1개월" style="color: black;">
	<input type="button" id="btMonth3" value="3개월" style="color: black;">
		
	<input type="text" name="startDay" id="startDay"
		value="${dateSearchVO2.startDay }"> 
	~ 
	<input type="text" name="endDay" id="endDay"
		value="${dateSearchVO2.endDay }">