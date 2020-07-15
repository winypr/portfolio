<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	

<script>

$(function() {
	
	signUpClick.init();
	
})

var fieldC = {
	
	userInfo : ""		
}

var signUpClick = {
		
	init: function() {
		$(".sign-up input[name='inputId']").next().children("button").click(this, signUpFn.idChkFn)
		
		$(".sign-up-account button").click(signUpFn.createAccountFn)
			
		$("input[name='inputPWChk']").focusout(this, signUpFn.pwChkFn)
	}
}

var signUpFn = {
		
		idChkFn : function() {
			
			var $input	= $(this).parents('div').children("input[name='inputId']"),
				inputId = $input.val()
				
				console.log($(this));
				
			if (inputId === "" ) {
				alert ("아이디가 없습니다.")
				return;
			}
			
			$.ajax({
				
				url : "/ajaxIDCheck.do",
				type : "post",
				data : {"urId" : inputId},
				dataType : "json",
				success: function(d) {
					if (d.result === "FAIL") {
						
						alert("다른 사람이 사용중입니다. 다른 ID를 입력해주세요")
						$input.val("")
					
					} else {
						
						$("[for='inputId']").next().removeClass("hide");
						$("input[name='idChk']").val(inputId)	
					}
				}
			})
		},
		
		pwChkFn : function() {
			
			if ($("input[name='inputPW']").val() !== $(this).val()) {
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
				
				$("input[name='inputPW']").val("");
				$(this).val("");
			
			} else {
				$("[for='inputPWChk']").next().removeClass("hide");
			}	
		},
		
		createAccountFn : function() {

			if (!checkfn()) return
			
			 $.ajax({
				
				url : "/ajaxCreateAccout.do",
				type : "post",
				data : fieldC.userInfo,
				dataType : "json",
				success: function(d) {
					if (d.result === "SUCCESS") alert("계정을 생성했습니다.")
					location.href="/login.do"
				} 
			})
			
		}
}

function checkfn() {
	
	fieldC.userInfo = Cmmn.formToObj("signUp");
	
	var objData = fieldC.userInfo
	
	i = 0;
	
	for (i in objData)
	{
		if (typeof objData.idChk === "undefined" || objData.idChk != objData.inputId ) {
			alert ("아이디 중복 확인을 하지 않았습니다.");
			$("[for='inputId']").next().addClass("hide");
			return false
			
		} else if (objData[i].length < 1) {
			alert ("빠진 부분이 있습니다. 값을 채워주세요");
			return false
			
		} else if (objData.inputPW != objData.inputPWChk ) {
			alert ("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.")
			return false
		}
	}
	return true;	
} 

</script>


		<div class="admin-form">
			<!-- Widget starts -->
			<div class="widget wred">
				<!-- Widget head -->
				<div class="widget-head">
					<i class="fa fa-lock"></i> signUp 
				</div>

				<div class="widget-content">
					<div class="padd">
						<!-- Login form -->
						<form id="signUp" class="form-horizontal sign-up">
							<!-- ID -->
					<div class="form-group">
						<input type="hidden" id="idChk" name="idChk" />
						<label class="control-label col-lg-3" for="inputId">아이디</label>
						<span class="hide">사용가능한 아이디 입니다. </span>
						<div class="input-group col-lg-9">
							<input type="text"  name="inputId" id="inputId" class="form-control" placeholder="ID"> 
							<span class="input-group-btn">
								<button type="button" class="btn btn-primary">중복확인</button>
							</span>
						</div>
					</div>
					<!-- Password -->
							<div class="form-group">
								  <label class="control-label col-lg-3" for="inputName">이름</label>
								  <div class="col-lg-9">
									<input type="text" class="form-control" id="inputName" name="inputName" placeholder="이름">
								  </div>
							</div>
					<!-- Password -->
							<div class="form-group">
								  <label class="control-label col-lg-3" for="inputPW">비밀번호</label>
								  <div class="col-lg-9">
									<input type="password" class="form-control" id="inputPW" name="inputPW" placeholder="Password">
								  </div>
							</div>
							
							<!-- Password check -->
							<div class="form-group">
								  <label class="control-label col-lg-3" for="inputPWChk">비밀번호 확인</label>
								  <span class="hide">사용 가능한 비밀번호 입니다.</span>
								  <div class="col-lg-9">
									<input type="password" class="form-control" id="inputPWChk" name="inputPWChk" placeholder="Confirm Password">
								  </div>
							</div>
							
							<!-- Email -->
							<div class="form-group">
								  <label class="control-label col-lg-3" for="inputEmail">이메일</label>
								  <div class="col-lg-9">
									<input type="text" class="form-control" id="inputEmail"  name="inputEmail" placeholder="Email">
								  </div>
							</div>
							
							<div class="form-group">
							
								<div class="col-lg-9 col-lg-offset-3 sign-up-account">
									<button type="button" class="btn btn-success">create account</button>
								</div>
							</div>
						</form>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="widget-foot">
					이미 계정이 있으신가요? <a href="login.do">Login</a>
				</div>
			</div>  
		</div>
	
			