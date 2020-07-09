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
			
			// 탭 클릭 시				
			$("#tabList").on("click", "li span", this, leftChkFn.tabClickFn)
			
			// 탭에 X버튼 클릭 시
			$("#tabList").on("click", "li i.fa", this, leftChkFn.tabDeleteFn);
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
		
		tabDeleteFn :function(e) {
		
			 var $li 		= $(this).parents("li");
				 $next 		= $(this).parent("li").next(),
				$liActive 	= $next.is("li") ?  $next  : $li.prev();
				
			$li.remove();
				
			// 탭 삭제 시 컨텐츠 div 도 삭제
			$("div#" + $li.data("code")).remove();
			
			// 저장 목록에서 제거
			CmmnField.tabArr.splice(CmmnField.tabArr.indexOf($li.data("code")),1);  
			
			// 삭제 후 다음으로 지정할 Tab
			highLightC.activeTabFn.call($liActive);
			
			highLightC.activeFn( $liActive.data("code"));
			
		},
			tabClickFn : function() {	
			
			var $li = $(this).parent();
			console.log($li.data("code"));
			
			// 탭 하이라이트
			highLightC.activeTabFn.call($li);
		
			 // 레프트 하이라이트
			highLightC.activeFn($li.data("code")); 

		}
	}	
	
	var submitC = {
		pageSubmitFn :function (lftMenuStr) {
			
			$("#leftFrm").attr("action", lftMenuStr + ".do");

			$("#pageName").val(lftMenuStr);		
			
			$("#leftFrm").submit();
			
		},
		
		ajaxFn : function(lftMenuStr) {
			
			var	urlStr 	= lftMenuStr + ".do";
			
			$.ajax({
				
				type	: "POST",
				url 	: urlStr,
				data	: {"pageName" : lftMenuStr} ,
				dataType : "html",
				success : function(data) {
					
					if (lftMenuStr.indexOf("_") > -1) {
						
						$("#tabCon > div#"+ lftMenuStr).append(data)
					} else {
						location.href = urlStr;
					}   
				}
			});
		}
	}
	// 탭 생성
	var createC = {
			createHtmlFn : function() {
				
				var htmlObj = {

					$a 		: $(this),
					$id 	: $(this).parent().attr("id"),
					tagLi 	: document.createElement("li"),
					tagA 	: document.createElement("a"),
					tagSpan : document.createElement("span"),
					tagDiv 	: document.createElement("div"),
					tagI 	: document.createElement("i")
				}

				if (htmlObj.$id.indexOf("_") > -1) {
				
					createC.tabCreateFn(htmlObj);

					// 컨텐츠 영역 생성
					createC.contentsCreateFn(htmlObj);
				
					// a태그의 data-code 속성으로 생성된 탭 구분
					CmmnField.tabArr.push(htmlObj.$id);		
				}
			},
			
			// 탭 생성 메서드. arguments[0]는 htmlObj 입니다. 
			 tabCreateFn : function() {

				arguments[0].tagA.setAttribute("href", "#");   
				arguments[0].tagA.setAttribute("data-toggle", "tab"); 
				arguments[0].tagSpan.textContent = arguments[0].$a.text(); 
				arguments[0].tagI.setAttribute("class", "fa fa-times"); 

				arguments[0].tagLi.appendChild(arguments[0].tagA); 
				arguments[0].tagA.appendChild(arguments[0].tagSpan);  
				arguments[0].tagA.appendChild(arguments[0].tagI);  
				arguments[0].tagLi.setAttribute("data-code", arguments[0].$id)
			
				$("#tabList").append(arguments[0].tagLi);
			},
			
			//컨텐츠를 감쌀  div html 생성 메서드. arguments[0]는 htmlObj 입니다. 
			contentsCreateFn : function() {
				arguments[0].tagDiv.setAttribute("id", arguments[0].$id);

				$("#tabCon").append(arguments[0].tagDiv);
			}				
	}
	
	 var highLightC = {
	
		// left 메뉴 하이라이트 메소드
		activeFn : function(id) {
		
			// 하이라이트를 줄 위치 정하기	
			var paramName = "";	
			
			if (typeof id !=="undefined") {  // 
				
				paramName = id;
			 
			} else { 						// 기타 다른 메뉴일 때
				var pathName = window.location.pathname,
				pathNameArr = pathName.split("/"),
				
				requestName = pathNameArr[pathNameArr.length - 1];
				
				paramName = (requestName.indexOf(".do") > 0) ? requestName.substring(0, requestName.indexOf(".do")) : "main"
			}
				
			
			// 하이라이트 주기 전 기존 하이라이트 제거
			$("#leftUL li").removeClass("current");
			$("#leftUL li").removeClass("active");
		
			// 하이라이트 주기
			if ($("li#" + paramName).hasClass("has_submenu")) {
				
				$("li#" + paramName).addClass("open");
			} else if ($("li#" + paramName).parents("li").hasClass("has_submenu")){
				
				$("li#" + paramName).parents("li").addClass("open");
				$("li#" + paramName).addClass("active");
			} else {
				$("li#" + paramName).addClass("current");
			}    
		},
		
		// tab 하이라이트 메소드
		activeTabFn : function() {
			
			var $id = "";
			
			$id = ($(this).parents("li").hasClass("has_submenu")) ?  $(this).parents().attr("id") : $(this).data("code");
			
			$("#tabList > li").removeClass("active");
			
			console.log("값" + $id);
			$("#tabList > li[data-code=" + $id + "]").addClass("active");  //html 에서는 "/"를 사용하지 말 것	
			
			$("#tabCon > div").hide();
			$("#tabCon > div#" + $id).show();
			
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
				                    <a data-toggle="collapse"  class="collapsed">
				                        	김주현
				                       
				                    </a>
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
						<li id="tabMenu" class="ngreen">
							<a>
								<i class="fa fa-file-o"></i> 탭 기능
							</a>
							<!-- <ul>
								<li id="tab_page1"><a href="#">section 1</a></li>
								<li id="tab_page2"><a href="#">section 2</a></li>
								<li id="tab_page3"><a href="#">section 3</a></li>
								<li id="tab_page4"><a href="#">section 4</a></li>
								<li id="tab_page5"><a href="#">section 5</a></li>
								<li id="tab_page6"><a href="#">section 6</a></li>
							</ul> -->
						</li>
						
						<li id="forum" class="norange"><a><i class="fa fa-list"></i> 게시판 </a></li>
			<!--/ Sidebar navigation -->

					<!-- Date -->
					<div class="sidebar-widget">
						<div id="todaydate"></div>
					</div>
				</div>
			</div>