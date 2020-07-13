<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">

	var CmmnField = {
		
		tabArr : []	
	}

	var leftClick = {
			
		init: function() {

			$("#leftUL a").click(this, leftChkFn.menuClickFn);	
		}
	}

	var leftChkFn = {
			
		menuClickFn : function(e) {
			
			var $id		  = $(this).parent("li").attr("id"),  //클릭한 사이드메뉴의 id 값
				parentsLi = $(this).parents("li")[1];
			
			 if ($(parentsLi).hasClass("has_submenu")) {
				 
				 submitC.pageSubmitFn($(parentsLi).attr("id") + "/" + $id);
				
			} else {
				 
				if (!$(this).parent("li").hasClass("has_submenu")) submitC.pageSubmitFn($id)
				
			} 
		},
	}	
	
	var submitC = {
		pageSubmitFn :function (lftMenuStr) {
			
			$("#leftFrm").attr("action", lftMenuStr + ".do");

			$("#pageName").val(lftMenuStr);		
			
			$("#leftFrm").submit();
			
		}	
	}
	
	 var highLightC = {
	
		// left 메뉴 하이라이트 메소드
		activeFn : function(id) {
			console.log("${pageContext}")
			// 하이라이트를 줄 위치 정하기	
			var paramName = "",
				category  = "",
				pathName = window.location.pathname,
				pathNameArr = pathName.split("/");
				console.log(pathNameArr)	
			
			if (pathNameArr[pathNameArr.length-1].indexOf(".do") < 0) 
				paramName = "main"
				
			else if (pathNameArr[pathNameArr.length-2] != "" ) {
				paramName = pathNameArr[pathNameArr.length-2]
				subParamName = pathNameArr[pathNameArr.length-1].replace(".do", "");
			
			} else {
				
				paramName = pathNameArr[pathNameArr.length-1].replace(".do", "");
			}
			
			// 하이라이트 주기 전 기존 하이라이트 제거
			$("#leftUL li").removeClass("current");
			$("#leftUL li").removeClass("active");
		
			//  하이라이트 주기
			   if ($("li#" + paramName).hasClass("has_submenu")){ // 상위 메뉴에 포함된 하위 메뉴를 선택했을 때
				
				$("li#" + paramName).addClass("open");
				$("li#" + subParamName).addClass("active");
				
			} else {
				$("li#" + paramName).addClass("current");
				
			}    
		}
	}
	$(function() {
		
		highLightC.activeFn();
		
		leftClick.init();

	});
</script>


<form id="leftFrm" method="post">
	<input type="hidden" id="pageName" name="pageName" >
</form>

<div class="sidebar">
				<div class="sidebar-dropdown"><a href="#">Navigation</a></div>
				<div class="sidebar-inner">
					
					<!--- Sidebar navigation -->
					<div class="userinfo">
				                <div class="photo">
				                    <img src="images/user.jpg">
				                </div>
				                <div class="info">
				                    <a data-toggle="collapse"  class="collapsed">김주현 </a>
				                </div>
				            </div>
					<!-- If the main navigation has sub navigation, then add the class "has_submenu" to "li" of main navigation. -->
					<ul id ="leftUL" class="navi">
						<!-- Use the class nred, ngreen, nblue, nlightblue, nviolet or norange to add background color. You need to use this in <li> tag. -->
							
						<li id="main" class="nred"><a><i class="fa fa-desktop"></i> 이력서</a></li>
						<!-- Menu with sub menu -->
						<li id="table" class="has_submenu nlightblue">
							<a>
								<!-- Menu name with icon -->
								<i class="fa fa-bar-chart-o"></i> 테이블과 차트 
								<!-- Icon for dropdown -->
								<span class="pull-right"><i class="fa fa-angle-right"></i></span>
							</a>
							<ul>
								<li id="dataTable"><a>요약</a></li>
								<li id="pieChart"><a>차트</a></li>
								<li id="tableList"><a>테이블</a></li>
								
							</ul>
						</li>
						<li id="tab" class="ngreen">
							<a>	<i class="fa fa-file-o"></i> 탭 기능</a>
						</li>
						
						<li id="forum" class="norange"><a><i class="fa fa-list"></i> 게시판 </a></li>
			<!--/ Sidebar navigation -->

					<!-- Date -->
					<div class="sidebar-widget">
						<div id="todaydate"></div>
					</div>
				</div>
			</div>