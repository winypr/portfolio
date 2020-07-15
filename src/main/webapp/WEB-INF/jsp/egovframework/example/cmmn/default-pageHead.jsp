<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>

var initFn = {
	pageHead :function() {
		var pageHeadName= "";
		
		if ($("li.open").text() !== "") pageHeadName = $("li.open > a").text();
		else if ($(".current").text() !== "") pageHeadName = $(".current").text();
		
		$(".bread-current").text(pageHeadName);	
		$(".page-head > h2").text(pageHeadName);	
		$(".page-head > h2").append('<span class="page-meta">Something Goes Here</span>'); 
	},
	
	navRightMenu :function(){

		
		if (typeof loginField.urIdCookie !== "undefined" ) {  // 로그인 상태일 때
			
			$(".nav > div").eq(0).addClass("hide");	  //로그인 / 회원가입 UI 숨기기		
			$(".nav > div").eq(1).removeClass("hide");
			$(".nav > div").eq(1).children("span").text("안녕하세요.  " + loginField.urNmCookie+ "님") 
		}
	}
}

function LoginOutClick() {
	
	$(".logout").click(function() {
		
		$.ajax({
			url : "/logout.do",
			type : "post",
			success : function(d) {
				alert("로그아웃 되었습니다.")
			}
		})
	})	
}

$(function () {
	initFn.navRightMenu();
	initFn.pageHead();
	LoginOutClick();
	
}) 

	
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
				