<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<tiles:insertAttribute name="header"/>
	<tiles:insertAttribute name="script" />
	</head>
	
	<body>
	<tiles:insertAttribute name="nav" />

	<!-- Main content starts -->
	<div class="content">
		<!-- Sidebar -->
		<tiles:insertAttribute name="left" /> 
		<!-- Sidebar ends -->
		
		<!-- Main bar -->
		<div class="mainbar">
		<tiles:insertAttribute name="pageHead" />
		
		
		<!-- Matter -->
		
		<tiles:insertAttribute name="tab" />
		<tiles:insertAttribute name="content" />
		</div><!--/ Mainbar ends -->	    	
			<!--/ Content ends -->
		
		<!-- Scroll to top -->
		<span class="totop"><a href="#"><i class="fa fa-chevron-up"></i></a></span> 
	

	</body>
</html>
		