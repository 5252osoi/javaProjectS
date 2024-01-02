<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>bubbleChart.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
	  google.charts.load('current', {'packages':['corechart']});
	  google.charts.setOnLoadCallback(drawSeriesChart);
		
		function drawSeriesChart() {
		
		  var data = google.visualization.arrayToDataTable([
		    ['ID', 'Life Expectancy', 'Fertility Rate', 'Region',     'Population'],
		    ['CAN',    80.66,              1.67,      'North America',  33739900],
		    ['DEU',    79.84,              1.36,      'Europe',         81902307],
		    ['DNK',    78.6,               1.84,      'Europe',         5523095],
		    ['EGY',    72.73,              2.78,      'Middle East',    79716203],
		    ['GBR',    80.05,              2,         'Europe',         61801570],
		    ['IRN',    72.49,              1.7,       'Middle East',    73137148],
		    ['IRQ',    68.09,              4.77,      'Middle East',    31090763],
		    ['ISR',    81.55,              2.96,      'Middle East',    7485600],
		    ['RUS',    68.6,               1.54,      'Europe',         141850000],
		    ['USA',    78.09,              2.05,      'North America',  307007000]
		  ]);
		
		  var options = {
		    title: 'Fertility rate vs life expectancy in selected countries (2010).' +
		      ' X=Life Expectancy, Y=Fertility, Bubble size=Population, Bubble color=Region',
		    hAxis: {title: 'Life Expectancy'},
		    vAxis: {title: 'Fertility Rate'},
		    bubble: {textStyle: {fontSize: 11}}
		  };
		
		  var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
		  chart.draw(data, options);
		}
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>버블(풍성형) 차트</h2>
  <div id="series_chart_div" style="width: 900px; height: 500px;"></div>
</div>
</body>
</html>