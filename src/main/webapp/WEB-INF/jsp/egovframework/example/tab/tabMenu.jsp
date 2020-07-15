<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
var CmmnField = {
		
	tabArr : []	
}

var tabClick = {
		
	init: function() {
		
		$(".tab-button > button").click(this, tabClickFn.menuClickFn);
		
		$("#tabList").on("click", "li i.fa", this, tabClickFn.tabDeleteFn);
		
		$("#tabList").on("click", "li a", this, tabClickFn.activeFn);
	}	
}

var tabClickFn = {
		
	menuClickFn : function() {
		
		var tabPageName = $(this).text();
		
			if (CmmnField.tabArr.length > 4 ) {
			
				alert("탭은 5개까지 만들 수 있습니다.")
				return;
				
			} else {
				
				// 탭 셍성
				createC.createHtmlFn.call(this)
				
				//탭 페이지 호출
				ajaxTab(tabPageName);
				
			}
			
			// 탭 하이라이트 처리
			activeC.tabHighlightFn.call(this);
			
			// 탭 버튼 하이라이트 처리
			activeC.btnHighlightFn.call(this);
		
		
	}, 
	tabDeleteFn : function() {
		var $li 		= $(this).parents("li");
			$next 		= $(this).parent("li").next(),
			$liActive 	= $next.is("li") ?  $next  : $li.prev();
		
		console.log($liActive.text());
		
		console.log($(this).parent().parent("li").next());
		$li.remove();
		
		// 탭 삭제 시 컨텐츠 div 도 삭제
		$("div#" + $li.data("code")).remove();
		
		CmmnField.tabArr.splice(CmmnField.tabArr.indexOf($li.data("code")),1)
		
		activeC.tabHighlightFn.call($liActive);
		
		activeC.btnHighlightFn.call($liActive);

	},
	activeFn : function() {
		
		// 탭 하이라이트 처리
		activeC.tabHighlightFn.call(this);
		
		// 탭 버튼 하이라이트 처리
		activeC.btnHighlightFn.call(this);
	}
}

function ajaxTab(tabPageName) {
	
	$.ajax({
		url : "tab/" +tabPageName + ".do",
		dataType : "text",
		data : {"pageName" : tabPageName},
		type : "post",
		success : function(d) {
			
			$("div#"+tabPageName).append(d)
			
		}
	}) 
}

var activeC = {
	
	btnHighlightFn : function() {
		var strLastInt = $(this).text()
	
		$(".tab-button > button").removeClass("label-default")
		
		$(".tab-button > button").eq(strLastInt.substr(strLastInt.length-1,1)-1).addClass("label-default")
		//$(this).addClass("label-default");
	},
	
	tabHighlightFn : function() {
		
		var tabPageName = $(this).text()
		
		$("#tabList > li").removeClass("active");
		
		$("#tabList > li[data-code=" + tabPageName + "]").addClass("active"); 
		
		$("#tabCon > div").hide();
		
		$("#tabCon > div#" + tabPageName).show();
	}	
}

var createC = {
	createHtmlFn : function() {
		var htmlObj = {

				$a 		: $(this),
				$id 	: $(this).text(),
				tagLi 	: document.createElement("li"),
				tagA 	: document.createElement("a"),
				tagSpan : document.createElement("span"),
				tagDiv 	: document.createElement("div"),
				tagI 	: document.createElement("i")
			}	
		
		createC.tabCreateFn(htmlObj);
		
		createC.contentsCreateFn(htmlObj);
		
		CmmnField.tabArr.push(htmlObj.$id)
		
	},	
		
	tabCreateFn : function() {
		
		arguments[0].tagA.setAttribute("href", "#");   
		arguments[0].tagA.setAttribute("data-toggle", "tab"); 
		arguments[0].tagSpan.textContent = arguments[0].$id; 
		arguments[0].tagI.setAttribute("class", "fa fa-times"); 
		
		arguments[0].tagLi.appendChild(arguments[0].tagA); 
		arguments[0].tagLi.appendChild(arguments[0].tagI); 
		arguments[0].tagLi.setAttribute("data-code", arguments[0].$id)
		arguments[0].tagA.appendChild(arguments[0].tagSpan);  
		
		$("#tabList").append(arguments[0].tagLi);
	},
	
	//컨텐츠를 감쌀  div html 생성 메서드. arguments[0]는 htmlObj 입니다. 
	contentsCreateFn : function() {
		
		arguments[0].tagDiv.setAttribute("id", arguments[0].$id);

		$("#tabCon").append(arguments[0].tagDiv);	
		
	}
}

$(function() {

	tabClick.init();
	
})
</script>

			
	

<div class="col-md-12">

	<div class="widget ">
	
	<div class="widget-foot tab-menu">
	
		<!-- Buttons -->
		<div class="tab-button col-md-offset-4 col-md-12">
			<c:forEach var="btnList" begin="1" end="6">
				<button type="button" class="btn btn-default">page<c:out value="${btnList}"/></button>
		</c:forEach>
	  	</div>
	  	<div class="clearfix"></div>
	 </div>
	  	<div class="tabbable" >
			<ul id="tabList" class="nav nav-tabs">	
				 
			</ul>
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

