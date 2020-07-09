<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>

$(function() {
	console.log("${forumView}")

})
var dataForum = {
	fmNo : "",
	fmWriter : "",
	fmSubj : "",
	fmContent : ""
		
}

function dataFn(){
		<c:forEach var="forumView" items="${forumView}" varStatus="status">	
			this.fmNo = "${forumView.fmNo}"
			this.fmWriter = "${forumView.fmWriter}"
			this.fmSubj = "${forumView.fmSubj}"
			this.fmContent = "${forumView.fmContent}"
		</c:forEach>	
}


function editfn() {
	dataFn.call(this);
	 $("#fmEdit").attr("action", "/forum/write.do")
		
	 $("#data").val(dataForum)
	 $("#fmEdit").submit(); 
}
</script>
<form id="fmEdit">
<input type="hidden" id="data" name="data"/>


</form>

<div class="matter">
	<div class="container">

		<div class="row">

			<!-- Recent comments widget -->
			<div class="col-md-12">
				<!-- Widget -->
				<div class="widget worange">
					<!-- Widget title -->
					<div class="widget-head">
						<div class="pull-left">게시판</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="widget-content forum-view">
						<!-- Widget content -->
						<div class="padd forumView">
						<c:forEach items="${forumView}" var="forumViewVar" 	varStatus="status"> 
							<div class="recent-content">
								<div class="subj recent-meta">
									<h5><c:out value="${forumViewVar.fmSubj}" /> </h5>
								</div>
								<hr>
								<div class="recent-meta date" >
									<h6>
										<c:out value="${forumViewVar.fmDate}" /> by <b><c:out value="${forumViewVar.fmWriter}" /></b>
										<span class="pull-right">조횟수 <c:out value="${forumViewVar.fmViews}" /></span> 
									</h6>
									</span>
								</div>
								<hr>
								<div class="content"><c:out value="${forumViewVar.fmContent}" /> </div>
								<div class="clearfix"></div>
							</div>
					</c:forEach> 
						</div>
					</div>
					<!-- Widget footer -->
					<div class="widget-foot">
						<div class="form-group">
									
						<button type="button" class="btn btn-primary  pull-right" style="padding-top: 5px;" onclick="editfn()">수정</button>
						<div class="clearfix"></div>
						</div>
					
						<div class="col-md-12">
							<!-- Widget -->
							<div class="widget wviolet">
								<!-- Widget title -->
								<div class="widget-head">
									<div class="pull-left">댓글</div>
									<div class="widget-icons pull-right">
										<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
										<a href="#" class="wclose"><i class="fa fa-times"></i></a>
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="widget-content">
									<!-- Widget content -->
									<div class="padd">

										<ul class="recent">
											<li>
												<div class="recent-content">
													<div class="recent-meta">Posted on 25/1/2120 by Ashok</div>
													<div>Vivamus diam elit diam, consectetur fermentum
														sed dapibus eget, Vivamus consectetur dapibus adipiscing
														elit.
													</div>
													<div class="btn-group ">
														<button class="btn btn-xs btn-success">
															<i class="fa fa-check"></i>
														</button>
														<button class="btn btn-xs btn-primary">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-xs btn-danger">
															<i class="fa fa-times"></i>
														</button>
													</div>

													<div class="clearfix"></div>
												</div>
											</li>
										</ul>
										<ul class="recent">
											<li>
												<div class="recent-content">
													<div class="recent-meta">Posted on 25/1/2120 by Ashok</div>
													<div>Vivamus diam elit diam, consectetur fermentum
														sed dapibus eget, Vivamus consectetur dapibus adipiscing
														elit.</div>
													<div class="btn-group ">
														<button class="btn btn-xs btn-primary">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-xs btn-danger">
															<i class="fa fa-times"></i>
														</button>
													</div>

													<div class="clearfix"></div>
												</div>
											</li>
										</ul>
										<ul class="pagination">
											<li><a href="#">Prev</a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">Next</a></li>
										</ul>
									</div>

									<div class="clearfix"></div>


								</div>
								<div class="widget-foot">
									<div class="recent-meta">Posted on 25/1/2120 by Ashok</div>
									<div class="text-area">
										<!-- Add the "cleditor" to textarea to add CLeditor -->
										<textarea name="input" class="form-control col-lg-12" placeholder="댓글을 남겨주세요"></textarea>
										
									</div>
									<div class="form-group" style="padding-top: 5px;">
										<button type="button" class="btn btn-success pull-right" style="padding-top: 5px;">등록</button>
										
										</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>

<!-- Matter ends -->

