<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/top.jsp"%>

<div id="container" style="width: 100%; height: 450px; margin: 8px 0 8px 0; padding: 0 8px;"></div>
	
<script type="text/javascript">
	Highcharts.chart('container', {

	    title: {
	        text: '월별매출'
	    },

	    xAxis: { 
	    	categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'] 
	    },
	       
	    yAxis: {
	        title: {
	            text: '원'
	        }
	    },
	    
	    legend: {
	        layout: 'vertical',
	        align: 'right',
	        verticalAlign: 'middle'
	    },

/* 	    plotOptions: {
	        series: {
	            pointStart: 1
	        }
	    }, */

	    series:[{
	    	for(var i=0; i<=${salesByMonth.size()}; i++){
	    		 [data[i]]
	    	}
	    }]
	});
</script>
	
<%@ include file="../include/bottom.jsp"%>