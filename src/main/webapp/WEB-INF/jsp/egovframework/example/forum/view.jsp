<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>

$(function() {
	console.log("${forumView}");
	console.log("${forumReplyView}");
	dataFn();
	menuClick();
})

function dataFn(){
	
		$("#fmEdit").append("<input type='hidden'  name='fmNo' 		value=<c:out value='${forumView[0].fmNo}'/> />");
		$("#fmEdit").append("<input type='hidden'  name='fmWriter' 	value=<c:out value='${forumView[0].fmWriter}'/> />");
		$("#fmEdit").append("<input type='hidden'  name='fmSubj' 	value=<c:out value='${forumView[0].fmSubj}'/> />");
		$("#fmEdit").append("<input type='hidden'  name='fmContent' value=<c:out value='${forumView[0].fmContent}'/> />");
		$("#fmEdit").append("<input type='hidden'  name='editType' 	value=''/>");
}

function menuClick() {
	$(".post > .btn-primary").click(function() { // 수정
		clickC.editPostFn()
	})
	
	$(".post > .btn-danger").click(function() { // 삭제
		clickC.deletePostFn()
	})
	
	$(".reply > .btn-success").click(function() { // 등록
		clickReplyC.saveReplyFn()
	})
	$ (".btn-group > .btn-xs").click(function(){
		clickReplyC.deleteReplyFn($(this).parents('div').eq(1).children('input').val())
		
	})
	
}



var clickC = {
		
		editPostFn : function() {
			
			 $("#fmEdit").attr("action", "/forum/write.do")
			 $("#fmEdit").submit(); 
		},
		
		deletePostFn : function() {
			
			var deleteData = Cmmn.formToObj("fmEdit");
			deleteData.editType="delete";
			
			 $.ajax({
				url : "/ajaxForum.do" ,
				data : deleteData,
				dataType : "text",
				type : "post",
				success : function(d) {
					if(d.result === "SUCCESS") alert("해당 글이 삭제되었습니다.")
					location.href=("/forum.do")
				}
			});  	
		}
}
var clickReplyC= {
		
		saveReplyFn : function() {
			
			if ($("#fmReply").val() ==="") {
				alert("내용을 입력해주세요")
				return
			}
			
			var replyData = {
				fmNo : "${forumView[0].fmNo}",
				rpWriter : "system",
				rpContent : $("#fmReply").val(), 
				editType  : "insert" 
			}	
			
			  $.ajax({
				url : "/ajaxForumReply.do" ,
				data : replyData,
				dataType : "JSON",
				type : "post",
				success : function(d) {
					if(d.result === "SUCCESS") alert("댓글을 등록했습니다.")
					location.reload()
				}
			})
		},
		
		deleteReplyFn : function(rpNo) {
			var replyData = {
					rpNo : rpNo,
					editType  : "delete" 
				}	
			
			 $.ajax({
					url : "/ajaxForumReply.do" ,
					data : replyData,
					dataType : "JSON",
					type : "post",
					success : function(d) {
						if(d.result === "SUCCESS") alert("댓글을 삭제했습니다.")
						location.reload()
					}
				})
		}
}		

			
		


/* var editHtml = {
		
		appendFn : function() {

			<c:forEach var="forumView" items="${forumView}" varStatus="status">
				
				$("input[name=fmNo]").val("${forumView.fmNo}")
				$("input[name=forumName]").val("${forumView.fmWriter}")
				$("input[name=forumTitle]").val("${forumView.fmSubj}")
				$("textarea[name=forumContent]").text("${forumView.fmContent}")
			</c:forEach>
			
		}
	} 

	function editfn() {
		
		 $.ajax({
			url : "/forum/edit.do" ,
			//data : 	test.substring(1,test.length-1),
			dataType : "text",
			type : "post",
			success : function(d) {
			
				$('.temp').children().remove()// console.log(d);
				$('.temp').append(d);
				editHtml.appendFn();
			}
		}); 
		 
	} */

</script>
<form id="fmEdit">
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
						<div class="form-group pull-right post">
									
						<button type="button" class="btn btn-primary" style="padding-top: 5px;">수정</button>
						<button type="button" class="btn btn-danger" style="padding-top: 5px;" >삭제</button>
						<div class="clearfix"></div>
						</div>
					
						<div class="col-md-12">
							<!-- Widget -->
							<div class="widget wviolet replyList">
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
									<form id="replyfrm">
									
										<div class="recent-meta">Posted on 25/1/2120 by Ashok</div>
										<div class="text-area">
											<!-- Add the "cleditor" to textarea to add CLeditor -->
											<textarea name="input" id="fmReply" class="form-control col-lg-12" placeholder="댓글을 남겨주세요"></textarea>
											<div class="clearfix"></div>
										</div>
										<div class="form-group reply" style="padding-top: 10px;">
											<button type="button" class="btn btn-success pull-right" style="padding-top: 5px;" >등록</button>
										</div>
									<div class="clearfix"></div>
									</form>
									</div>
										
								</div>
								
							<div class="widget-foot">
								
								<c:forEach var="replyList" items="${forumReplyView}">
								<ul class="recent">
											<li>
												<div class="recent-content">
													<input type="hidden" id="rpNo" name="rpNo" value="<c:out value='${replyList.rpNo}'/>"/>
													<div class="recent-meta">Posted on <c:out value="${replyList.rpDate}"/> by <c:out value="${replyList.rpWriter}"/></div>
													<div><c:out value="${replyList.rpContent}"/>
													</div>
													<div class="btn-group ">
									
														<button class="btn btn-xs btn-primary">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-xs btn-danger" >
															<i class="fa fa-times"></i>
														</button>
													</div>

													<div class="clearfix"></div>
												</div>
											</li>
										</ul>
										</c:forEach>
										
										<ul class="pagination">
											<li><a href="#">Prev</a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">Next</a></li>
										</ul>
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

