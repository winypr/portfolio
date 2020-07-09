<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>

$(function () {
	pageHead();
}) 

function pageHead() {
	
	var pageHeadName= "";
	
	if ($("li.active").text() !== "") pageHeadName = $("li.active").text();
	else if ($(".current").text() !== "") pageHeadName = $(".current").text();
	else  pageHeadName = $(".open > a").text();
	
	$(".bread-current").text(pageHeadName);	
	$(".page-head > h2").text(pageHeadName);	
	$(".page-head > h2").append('<span class="page-meta">Something Goes Here</span>'); 
} 
	
</script>
      	<div class="page-head">
				<!-- Page heading -->
					<h2  class="pull-left">이력서
					  <!-- page meta -->
					  <span class="page-meta">Something Goes Here</span>
					</h2>
					<!-- Breadcrumb -->
					<div class="bread-crumb pull-right">
					  <a href="main.do"><i class="fa fa-home"></i> Home</a> 
					  <!-- Divider -->
					  <span class="divider">/</span> 
					  <a href="#" class="bread-current"> 이력서
					  
					</a>
					</div>
					<div class="clearfix"></div>
				</div><!--/ Page heading ends -->
				