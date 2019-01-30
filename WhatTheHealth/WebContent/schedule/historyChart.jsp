<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src='/resources/javascript/Chart.bundle.js'></script>
<script src='/resources/javascript/utils.js'></script>
<script src='/resources/javascript/jquery.min.js'></script>

<title>Insert title here</title>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div id="container" style="width: 75%;">
		<canvas id="canvas"></canvas>
	</div>
	<button id="randomizeData">Randomize Data</button>
	<button id="addDataset">Add Dataset</button>
	<button id="removeDataset">Remove Dataset</button>
	<button id="addData">Add Data</button>
	<button id="removeData">Remove Data</button>
	<script>
	Date.prototype.getWeekNumber = function(){
		  var d = new Date(Date.UTC(this.getFullYear(), this.getMonth(), this.getDate()));
		  var dayNum = d.getUTCDay() || 7;
		  d.setUTCDate(d.getUTCDate() + 4 - dayNum);
		  var yearStart = new Date(Date.UTC(d.getUTCFullYear(),0,1));
		  return Math.ceil((((d - yearStart) / 86400000) + 1)/7)
		};

		console.log("현재주차"+new Date().getWeekNumber());
	///////////////////////
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
	 

	 console.log(woy);
	 console.log("exCounts",exCounts);
	 console.log("dietCounts",dietCounts);
	 console.log("c??",c);
	 
	
		var MONTHS =woy;
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
				fill: false,
				borderWidth: 2,
				label: '평균 칼로리',
				backgroundColor: color(window.chartColors.yellow).alpha(0.5).rgbString(),
				borderColor: window.chartColors.yellow,
				borderWidth: 1,
				data:averageCounts,
			}]

		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					responsive: true,
					title: {
						display: true,
						text: 'Chart.js Combo Bar Line Chart'
					},
					tooltips: {
						mode: 'index',
						intersect: true
					}
				}
				
			});

		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			var zero = Math.random() < 0.2 ? true : false;
			barChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return zero ? 0.0 : randomScalingFactor();
				});

			});
			window.myBar.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[barChartData.datasets.length % colorNames.length];
			var dsColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset ' + (barChartData.datasets.length + 1),
				backgroundColor: color(dsColor).alpha(0.5).rgbString(),
				borderColor: dsColor,
				borderWidth: 1,
				data: []
			};

			for (var index = 0; index < barChartData.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			barChartData.datasets.push(newDataset);
			window.myBar.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (barChartData.datasets.length > 0) {
				var month = MONTHS[barChartData.labels.length % MONTHS.length];
				barChartData.labels.push(month);

				for (var index = 0; index < barChartData.datasets.length; ++index) {
					// window.myBar.addData(randomScalingFactor(), index);
					barChartData.datasets[index].data.push(randomScalingFactor());
				}

				window.myBar.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			barChartData.datasets.pop();
			window.myBar.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			barChartData.labels.splice(-1, 1); // remove the label first

			barChartData.datasets.forEach(function(dataset) {
				dataset.data.pop();
			});

			window.myBar.update();
		});
	</script>
</body>
</html>
