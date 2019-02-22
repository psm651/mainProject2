<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src='/resources/javascript/Chart.bundle.js'></script>
<script src='/resources/javascript/utils.js'></script>
<script src='/resources/javascript/jquery.min.js'></script>

<style>


#container {
	margin-top: 5%;
	margin-left: 7%;
}
/* #addData{margin-left:50%;margin-top:0.5%;width:5%;} */

 .card-img-user{width:30%;height:5%;margin-left:35%;margin-top:5%;}
 .card{width:60%;}
</style>

<title>Insert title here</title>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<div id="container">

		<div class="row">

			<div class="col-md-9">
				<canvas id="canvas"></canvas>
				<button id="addData" class="btn btn-danger btn-sm">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true">Next
						Week</span>
				</button>
			</div>
			
			<div class="col-md-5">
				 <div id="chartjs-tooltip"></div> 
			
			</div>
			

		</div>
		</div>

	<script>
	Date.prototype.getWeekNumber = function(){
		  var d = new Date(Date.UTC(this.getFullYear(), this.getMonth(), this.getDate()));
		  var dayNum = d.getUTCDay() || 7;
		  d.setUTCDate(d.getUTCDate() + 4 - dayNum);
		  var yearStart = new Date(Date.UTC(d.getUTCFullYear(),0,1));
		  return Math.ceil((((d - yearStart) / 86400000) + 1)/7);
		};


	var woy=new Array();;
	var exCounts = [];
	var dietCounts = [];
	var averageCounts = [];
	
	var c=${fn:length(exCalorie)} ;
	var b;
	<c:forEach items="${exCalorie}" var="info" begin="1">
	b = "${info}";
	 exCounts.push(-b);
	</c:forEach>
	
	<c:forEach items="${dietCalorie}" var="diet" begin="1">
	d = "${diet}";
	dietCounts.push(d);
	</c:forEach>
	
	<c:forEach items="${averageCalorie}" var="average" begin="1">
	p = "${average}";
	averageCounts.push(p);
	</c:forEach>
	
	 for (var i = 0 ; i <new Date().getWeekNumber()+5 ; i++) {
		woy[i]=(i+1)+"주차";
		if (i==new Date().getWeekNumber()) {
		}
	} 
	 
		var MONTHS =woy;
		console.log("MONTHS : " +MONTHS)
		var color = Chart.helpers.color;
		var barChartData = {
			labels: woy,
			datasets: [{
				type:'bar',
				label: '운동칼로리',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: exCounts,
			},{
				type:'bar',
				label: '식단칼로리',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data:dietCounts,
			},{
				type:'line',
				borderWidth: 2,
				label: '평균 칼로리',
				backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
				borderColor: window.chartColors.yellow,
				borderWidth: 1,
				data:averageCounts,
			}]

		};
    
            
		var myDoughnutChart = {
 				 datasets: [{
					 data: [barChartData.datasets[0].data, 20]
				  }], 
				 labels: [
					  '운동칼로리',
					  '식단칼로리'
				 ]
		};
		
		
		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					title: {
						fontSize : 20,
						display: true,
						text: 'Calories History Chart'
					},
					tooltips: {
						mode: 'index',
						intersect: true						
					}

				}
				
			});

		};


		document.getElementById('addData').addEventListener('click', function() {
			if (barChartData.datasets.length > 0) {
				var month = (MONTHS.length+1)+"주차";
				barChartData.labels.push(month);
				

				
				for (var index = 0; index < barChartData.datasets.length; ++index) {
					
					barChartData.datasets[index].data.push(randomScalingFactor());
				}

				window.myBar.update();
			}
		});

	</script>
</body>
</html>
