<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc_company/company_top.jsp"%>
<!-- 매출현황  -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<style type="text/css">
#container, #sliders {
	min-width: 310px;
	max-width: 800px;
	margin: 0 auto;
}

#container {
	height: 400px;
}
	.divSales{margin: 10px 0;}
	.bodyClass{padding-top: 30px;}
	th{background-color: #EEEEEE;}
</style>
<script type="text/javascript">
$(function(){
	
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            type: 'column'
        },
        title: {
            text: '우리 업체 매출 현황'
        },
        
        xAxis: {
            categories: ${listDay}
        },
        
        subtitle: { 
            text: '일별 매출 현황'
        },
        plotOptions: {
            column: {
                depth: 10
            }
        },
        series:[{
	    	data : ${listPay}
	    }]
    });
/*     function showValues() {
        $('#alpha-value').html(chart.options.chart.options3d.alpha);
        $('#beta-value').html(chart.options.chart.options3d.beta);
        $('#depth-value').html(chart.options.chart.options3d.depth);
    }
	
    // Activate the sliders
    $('#sliders input').on('input change', function () {
        chart.options.chart.options3d[this.id] = this.value;
        showValues();
        chart.redraw(false);
    });
	
    showValues(); */
}); 
		</script>
<script>
	$().ready(function(){
		$.setYear();	
		$.setMonth();		
		
		$("#frmSales").submit(function(){
			if($("#year").val().length<1){
				alert("년도를 선택하세요");
				$("#year").focus();
				return false;
			}else if($("#month").val().length<1){
				alert("월을 선택하세요");
				$("#month").focus();
				return false;
			}
		});
	});
	
	
	
	$.setYear=function(){
		var today=new Date();
		var year=today.getFullYear();	//2017
		for(var i=year; i>=year-5; i--){
			if(i=='${param.year}'){		/* 항상 서버에서 값을 가져올때는 ''로 감싸도록해야한다 */
				$("#year").append("<option value='"+i+"' selected>"+i+"</option>");	
			}else{
				$("#year").append("<option value='"+i+"'>"+i+"</option>");
			}				
		}
	}
	
	$.setMonth=function(){
		for(var i=1; i<=12; i++){
			if(i=='${param.month}'){
				$("#month").append("<option value='"+i+"' selected>"+i+"</option>");	
			}else{
				$("#month").append("<option value='"+i+"'>"+i+"</option>");
			}
		}
	}
	
</script>

</head>
<body>
	<div class="container">
	<legend>일별 매출 현황</legend>
	<form name="frmSales" id="frmSales" method="post" 
		action='<c:url value="/com_manage/company_revenueDay.do" />'>
		<select name="year" id="year">
			<option value="">::선택::</option>
		</select> 년
		<select name="month" id="month">
			<option value="">::선택::</option>
		</select> 월
		<input type="submit" value="검색">	
	</form>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-3d.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>

	<div id="container"></div>
	
	<div>
		| <a href='<c:url value="/com_manage/company_revenueDay.do" />'>일별 매출</a> | <a
			href='<c:url value="/com_manage/company_revenueMonth.do" />'>월별 매출</a> | 
	</div>
	
	
	<div class="divSales">
		<table class="table table-bordered" summary="일별 매출액에 관한 표">
			<colgroup>
				<col width="40%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">매출일</th>
					<th scope="col">매출액</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty slist}">
					<tr>
						<td colspan="2" class="text-center">해당 월의 매출액이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty slist}">
					<c:set var="totalSum" value="0" />
					<c:forEach var="map" items="${slist }">
						<tr>
							<td class="text-center">${map['PAYDATE'] }</td>
							<td class="text-right">
								<fmt:formatNumber pattern="#,###" value="${map['TOTALPAY'] }"  /> 원
							</td>
						</tr>
						<c:set value="${map['TOTALPAY']+totalSum }" var="totalSum" />
					</c:forEach>
					<tr>
						<th class="text-right" colspan="2">매출액 합계</th>
					</tr>
					<tr>
						<td class="text-right" colspan="2">
							<fmt:formatNumber pattern="#,###" value="${totalSum }"  /> 원
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</div>
</div>
	<%@ include file="../inc_company/company_bottom.jsp"%>