<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(function() {

	$(".tab-button > button").click(function() {
		console.log(this);
		$(".tab-button > button").removeClass("btn-success")
		$(this).addClass("btn-success");
	})
	
})

</script>


<div class="col-md-12">

	<div class="widget ">
	
	<div class="widget-foot" style="border-top-width: 1px; border-top-color: rgb(221, 221, 221); border-top-style: solid;">
	
		<!-- Buttons -->
		<div class="tab-button col-md-offset-4 col-md-12">
			<c:forEach var="btnList" begin="1" end="6">
				<button type="button" class="btn btn-default">page<c:out value="${btnList}"/></button>
		</c:forEach>
	  	</div>
	  	<div class="clearfix"></div>
  	
  	</div>
		<div class="padd">
			<h5 class="tit">탭을 만들어보아요.</h5>


			<div id="tabCon" class="table-wrap type2 mgt-20">
				<!-- 본문내용 작성   -->
			</div>
		</div>
	</div>
</div>


	<!--
        <li class="on"><a href="#">25기</a><button type="button"></button></li>
        <li><a href="#">26기</a><button type="button"></button></li>
  -->

