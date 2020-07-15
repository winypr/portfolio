<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<script>

var fmSubmit ={
		
	pageMoveFn : function(fmMenu) {
		
		if (typeof loginField.urIdCookie ==="undefined") {
			alert ("로그인해야만 글쓰기가 가능합니다.")
			location.href = "/login.do"
			return
		} 
		
		$("#frm").attr("action", "/forum/"+fmMenu+".do");
		$("#pageName").val(fmMenu);
		$("#frm").submit();
	}
		
}
	
function clickEventFn() {
	
	$("#forumTable tbody tr").click(function() {
		
		$("#fmNo").attr("disabled",false);
		$("#fmNo").val($(this).children().eq(0).text());
		
		fmSubmit.pageMoveFn("view"); 
		
	})	
}
	
$(function() {

	clickEventFn()
})
	 
	
</script>
		<div class="temp">
				<div class="matter">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
							<form id="frm" method="get">
							<input type="hidden" id="fmNo" name="fmNo" disabled />
							
								<div class="widget worange">
									<div class="widget-head">
									  <div class="pull-left">게시판</div>
									  <div class="widget-icons pull-right">
										<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
										<a href="#" class="wclose"><i class="fa fa-times"></i></a>
									  </div>
									  <div class="clearfix"></div>
									</div>
									
									<div class="widget-content">
										<div class="table-responsive">
											<table class="table table-bordered" id="forumTable">
												<thead>
													<tr>
													  <th>#</th>
													  <th>제목</th>
													  <th>작성자</th>
													  <th>작성일</th>
													  <th>조횟수</th>
													</tr>
												</thead>
												<tbody>
											<c:forEach items="${forumList}" var="forumListVar" varStatus="status">
											<tr>
												<td><c:out value="${forumListVar.fmNo}" /></td>
												<td><c:out value="${forumListVar.fmSubj}" /></td>
												<td><c:out value="${forumListVar.fmWriter}" /></td>
												<td><c:out value="${forumListVar.fmDate}" /></td>
												<td><c:out value="${forumListVar.fmViews}" /></td>
											</tr>
										</c:forEach>                                                     
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="widget-foot">
										<ul class="pagination pull-left">
										  <li><a href="#">Prev</a></li>
										  <li><a href="#">1</a></li>
										  <li><a href="#">2</a></li>
										  <li><a href="#">3</a></li>
										  <li><a href="#">4</a></li>
										  <li><a href="#">Next</a></li>
										</ul>
										<div class="pull-right">
									
										<button type="button" class="btn btn-success" onclick="fmSubmit.pageMoveFn('write')">글쓰기</button>
										</div>
										<div class="clearfix"></div> 
									</div>
									
								</div>
								</form>
								</div>
						</div>
						</div>
				</div><!--/ Matter ends -->
		</div>