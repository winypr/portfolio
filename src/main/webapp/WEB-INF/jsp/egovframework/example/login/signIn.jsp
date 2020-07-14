<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<script>
var loginData = {
		urId : "",
		urPw : ""		
}

$(function(){
	$(".login button").click(function() {
		
		loginData.urId = $("input[name='inputId']").val()
		loginData.urPw = $("input[name='inputPassword']").val()
		console.log(loginData);
		
		for (i in loginData) {
			if (loginData[i] === "") {
				alert("빈 값이 있습니다. 값을 채워주세요")
				return
			}
 		}
		
		$.ajax({
			url : "/ajaxLogin.do",
			data : loginData,
			dataType : "json",
			type : "post",
			success : function(d) {
				if (d.result==="FAIL") alert("아이디 혹은 비밀번호가 틀렸습니다.")
				else {
					alert("로그인 되었습니다.")
					location.href = "/main.do"
				}
				
			}
			
		}) 
		
		
	})
	
	
})


</script>



		<div class="admin-form">
			<!-- Widget starts -->
			<div class="widget worange">
				<!-- Widget head -->
				<div class="widget-head">
					<i class="fa fa-lock"></i> Login 
				</div>

				<div class="widget-content">
					<div class="padd">
						<!-- Login form -->
						<form class="form-horizontal login">
							<!-- Email -->
							<div class="form-group">
								  <label class="control-label col-lg-3" for="inputId">아이디</label> 
								  <div class="col-lg-9">
									<input type="text" class="form-control" name="inputId" placeholder="ID">
								  </div>
							</div>
							<!-- Password -->
							<div class="form-group">
								  <label class="control-label col-lg-3" for="inputPassword">비밀번호</label>
								  <div class="col-lg-9">
									<input type="password" class="form-control" name="inputPassword" placeholder="Password">
								  </div>
							</div>
							
							<!-- Remember me checkbox and sign in button -->
							<div class="form-group">
								<div class="col-lg-9 col-lg-offset-3">
									<div class="checkbox">
										<label>
											<input type="checkbox"> Remember me
										</label>
									</div>
								</div>
								<div class="col-lg-9 col-lg-offset-3">
									<button type="button" class="btn btn-danger">Sign in</button>
									
								</div>
							
							</div>
						</form>
						
						<div class="clearfix"></div>
						</div>
				</div>
					<div class="widget-foot">
				  게정이 없으신가요?   <a href="/signup.do">회원가입</a>
				</div>
				
			</div>  
		</div>
	
			