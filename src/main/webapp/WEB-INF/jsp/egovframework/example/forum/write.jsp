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

var objData = {};

function saveForum() {

	objData = Cmmn.formToObj("frmForum");
	if (!checkfn()) return ;
	console.log(objData.fmNo)
	objData.editType = (objData.fmNo ==="") ? "insert": "update";
	 
	 $.ajax({
	
		url : "<c:url value='/ajaxForum.do'/>",
		type : "post",
		dataType : "JSON",
		data : objData, 
	
		success : function(d) {
			
			if(d.result === "SUCCESS") alert("저장되었습니다.");
			
		}
	});  	 
}
	
function checkfn() {
	
	var i = "";
	
	for (i in objData)
	{
		if (objData[i].length < 1 && i != "editType") {
			alert ("빠진 부분이 있습니다. 값을 채워주세요");
			return
		}
	}
	return true;	
} 

	
</script>	
			<div class="matter">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="widget worange">
              						<div class="widget-head">
									  <div class="pull-left">글쓰기</div>
									  <div class="widget-icons pull-right">
										<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
										<a href="#" class="wclose"><i class="fa fa-times"></i></a>
									  </div>
									  <div class="clearfix"></div>
									</div>
									<div class="widget-content">
									  <div class="padd">
										
										<!-- Form starts.  -->
											<form class="form-horizontal" id="frmForum" role="form">
											<input type="hidden" id="editType" name="editType"/>
											<input type="hidden" id="fmNo" name="fmNo"/>
											
												<div class="form-group">
												  <label class="col-md-2 control-label">작성자</label>
												  <div class="col-md-8">
													<input type="text" class="form-control" id="forumName" name="forumName" placeholder="이름을 입력해주세요">
												  </div>
												</div>
												<div class="form-group">
												  <label class="col-md-2 control-label">제목</label>
												  <div class="col-md-8">
													<input type="text" class="form-control" id="forumTitle" name="forumTitle" placeholder="제목을 입력해주세요">
												  </div>
												</div>
												
												
												<div class="form-group">
												  <label class="col-md-2 control-label">내용</label>
												  <div class="col-md-8">
													<textarea class="form-control" rows="10" id="forumContent" name="forumContent" placeholder="내용을 입력해주세요"></textarea>
												  </div>
												</div>    
											   <div class="form-group">
												  <label class="col-md-2 control-label">비밀번호</label>
												  <div class="col-md-8">
													<input type="password" class="form-control" id="forumPassWord" name="forumPassWord" placeholder="비밀번호를 입력해주세요">
												  </div>
												</div>
												<div class="form-group">
												  <div class="col-md-offset-2 col-md-8" id="forumSave">
													<button type="button" class="btn btn-success pull-right" onclick="saveForum()">저장</button>
												  </div>
												</div>
											</form>
									  </div>
									</div>
								</div>  
							</div>
						</div>
					
				</div><!--/ Matter ends -->
</div>