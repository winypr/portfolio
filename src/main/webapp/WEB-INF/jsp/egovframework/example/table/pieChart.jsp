<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">

	var chart = {
		pieChart : pieChartFn,
		barChart : barChartFn
	}

	function pieChartFn() {
		var dataPreferences = {
			labels : [ '62%', '32%', '6%' ],
			series : [ 62, 32, 6 ]
		};

		var optionsPreferences = {
			donut : false,
			donutWidth : 40,
			startAngle : 0,
			height : "245px",
			total : 100,
			showLabel : true 
		};
 
		var labelsArr = [], seriesArr = [];

		<c:forEach items="${pieChart}" var="pieChartVar" varStatus="status">
		labelsArr["<c:out value='${status.index}'/>"] = "<c:out value='${pieChartVar.labels}'/>";
		seriesArr["<c:out value='${status.index}'/>"] = "<c:out value='${pieChartVar.series}'/>";
		</c:forEach>

		dataPreferences.labels = labelsArr;
		dataPreferences.series = seriesArr;

		Chartist.Pie('#piePreferences', dataPreferences, optionsPreferences);
			
	}
	
	function barChartFn() {
		var dataPreferences = {
			labels : [ '62%', '32%', '6%' ],
			series : [
				[ 62, 32, 6 ]
				]
		};

		var optionsPreferences = {
				 high: 12,
				 
		};

		var labelsArr = [], seriesArr = [];

		<c:forEach items="${barChart}" var="barChartVar" varStatus="status">
			labelsArr["<c:out value='${status.index}'/>"] = "<c:out value='${barChartVar.labels}'/>";
			seriesArr["<c:out value='${status.index}'/>"] = "<c:out value='${barChartVar.series}'/>";
		</c:forEach> 

		dataPreferences.labels = labelsArr;
		dataPreferences.series = [seriesArr]; 

		Chartist.Bar('#BarPreferences', dataPreferences, optionsPreferences);
			
	}

	$(function() {

		chart.pieChart();
		chart.barChart();

	});
</script>

<div class="matter">
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<div class="widget wred">
				<div class="widget-head">
					<div class="pull-left">Pie Chart</div>
					<div class="widget-icons pull-right">
						<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
						<a href="#" class="wclose"><i class="fa fa-times"></i></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="widget-content">
					<div class="card">
						<div class="header">
							공연전시 타입별 통계 (파이)
						</div>
						<div class="content">
							<div id="piePreferences" class="ct-chart "></div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="widget wlightblue">
				<div class="widget-head">
					<div class="pull-left">Bar Chart</div>
					<div class="widget-icons pull-right">
						<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
						<a href="#" class="wclose"><i class="fa fa-times"></i></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="widget-content">
					<div class="card">
						<div class="header">
							공연전시 전시 기간별 통계 (바)
						</div>
						<div class="content">
							<div id="BarPreferences" class="ct-chart "></div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
