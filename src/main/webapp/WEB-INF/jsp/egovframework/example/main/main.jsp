<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>

/*--------------------------------------------------------
 * 쿠키 팝업창 공통 필드
 *--------------------------------------------------------*/
var fieldCookie = {
	todayModal : "#todayModal",
	chkStr	   : ":checked"
}

/*--------------------------------------------------------
 * 쿠키 세팅
 * this는 fieldCookie
 *--------------------------------------------------------*/

var todayCookieFn = {
	
	todayCookieSet : function() {
		$.cookie("todayChk", this.chkStr, { expires: 1 });
	},
	
	todayCookieGet : function() {
	
		return $.cookie("todayChk");
	}
}

var todayPopupFn = {
	
	todayPopupShow : function() {
		
		var todayCookie = todayCookieFn.todayCookieGet();
		
		if (todayCookie !== this.chkStr) {
			$(this.todayModal).modal("show");	
		
		}
	},
	
	todayPopupHide : function() {
		$(this.todayModal).removeClass("in");
		$(this.todayModal).modal("hide");	 
	}
}

/*--------------------------------------------------------
 * 쿠키 클릭 함수
 * that은 fieldCookie
 *--------------------------------------------------------*/

function cookieClickFn() {
	
	var that = this;
		
	$("input[name='todayCheckBox']").change(function() {
		if ($(this).is(that.chkStr)) {
			
			todayCookieFn.todayCookieSet.call(that);
			
			setTimeout(function() {
				
				todayPopupFn.todayPopupHide.call(that)
			}, 500);

		}	
	}) 
}

$(function(){ 
	
	todayPopupFn.todayPopupShow.call(fieldCookie);
	
	cookieClickFn.call(fieldCookie) ;
	
})



</script>


<div class="matter">
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<div class="widget wred">

					<div class="widget-head">
						<div class="pull-left">이력서</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="widget-content">
						<div class="padd statement">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>이름(한글)</label> <input type="text" class="form-control"
											placeholder="name(Korean)" value="김주현">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>이름(영문)</label> <input type="text" class="form-control"
											placeholder="name(English)" value="Kim Juhyeon">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>이름(한자)</label> <input type="text" class="form-control"
											placeholder="name(Chinese)" value="金珠賢">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>생년월일</label> <input type="text" class="form-control"
											placeholder="Birth" value="84.08.06 (만 35세)">
									</div>
								</div>
								<div class="col-md-8">
									<div class="form-group">
										<label>주소</label> <input type="text" class="form-control"
											placeholder="Home Address"
											value="경기도 부천시 오정구 고강본동 고강아파트 13동 108호">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>이메일</label> <input type="text" class="form-control"
											placeholder="e-mail" value="prwiny@naver.com">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>휴대폰 번호</label> <input type="text" class="form-control"
											placeholder="Phone Number" value="010-3349-1520">
									</div>
								</div>
							</div>
								<div class="row">
									<div class="col-md-12">
									<label>보유기술</label>
									<div class="well">
									<h6><b>Front-End</b></h6>
										<p>JavaScript(jQuery, VanillaJS, ajax) HTML5, CSS, Tiles</p>	
										<hr>
										<h6><b>Back-End</b></h6>
										<p>Java, Spring Framework, Mybatis, Tomcat</p>
										<hr>
										<h6><b>Database</b></h6>
										<p>mariaDB</p>
										<hr>
										<h6><b>기타</b></h6>
										<p>Unity, vba</p>
									
									</div>	
									</div>
								</div>
								<div class="row">
								<div class="col-md-12">
								<label>개인 프로젝트</label>
									<div class="well download">
									<h6><b>포트폴리오</b></h6>
										<p>프로젝트 : <a href="https://github.com/winypr/portfolio" target="_blank">깃허브 다운로드</a></p>	
										<hr>
										<h6><b>자바스크립트 클론 코딩</b></h6>
										<p>계산기 :  <a href="https://winypr.github.io/miniCalculator/" target="_blank">https://winypr.github.io/miniCalculator/</a><br>
										랜덤숫자게임  : <a href="https://winypr.github.io/miniRandomgame/" target="_blank">https://winypr.github.io/miniRandomgame/</a><br>
										Momentum : <a href="https://winypr.github.io/nomadProjectTodo" target="_blank">https://winypr.github.io/nomadProjectTodo</a>
										</p>
										<hr>
										<h6><b>Unity + C#</b></h6>
										<p>모바일 게임 Tap machine 코딩 (구글 서비스 중단)<br> 
										모바일 앱 자취독립만세 코딩 (구글서비스 중단)</p>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>자격증</label>

										<table class="table table-bordered">
											<thead>
												<tr>
													<th>#</th>
													<th>이름</th>
													<th>취득처</th>
													<th>취득일</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>정보처리기사</td>
													<td>한국산업인력공단</td>
													<td>2019.11</td>
												</tr>
												<tr>
													<td>2</td>
													<td>컴퓨터 그래픽스 운용기능사</td>
													<td>한국산업인력공단</td>
													<td>2010.05</td>
												</tr>
												<tr>
													<td>3</td>
													<td>MOUS</td>
													<td>Microsoft Office 사무국</td>
													<td>2007.04</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label>학력</label>

										<table class="table table-bordered">
											<thead>
												<tr>
													<th>기간</th>
													<th>학교명</th>
													<th>전공</th>
													<th>졸업여부</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>2000.03 ~ 2003.02</td>
													<td>광영여자고등학교</td>
													<td></td>
													<td>졸업</td>
												</tr>
												<tr>
													<td>2003.03 ~ 2008.03</td>
													<td>서울여자대학교</td>
													<td>사학/경영학과</td>
													<td>졸업</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>


			 <div class="col-md-5">
				<div class="widget wviolet">
					<div class="widget-head">
						<div class="pull-left">자기소개서</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="widget-content">
						<div class="padd">
							<div class="alert alert-warning">
								<a href="#">
									<h4 class="title">
										배경<br>
										<hr>
										<small>“코딩, 그건 중독 이였습니다.”</small>
									</h4>
								</a>

								<p class="description">20대까지만 해도 코딩은 저한테 너무나 먼 나라, 다른 세상의
									이야기였습니다. 그런 제가 코딩을 배우게 된 것도 기획 업무 진행을 위한 최소한의 지식 획득이 목적 이였습니다.
									그렇게 배우기 시작했던 코딩은 …… 너무나 재미있었습니다. 원하는 대로 움직이고 결과를 보여주는 코딩의 매력에서
									헤어나올 수 없었습니다. 그 후부터 하루의 대부분을 코딩만 하며 살고 싶다는 꿈을 꾸었고, 살겠다는 결심을 굳히게
									되었습니다. 그 후부터 기획 업무와 연관이 있었던 VBA를 시작으로 현재 웹 개발에 필요한 스킬을 익히며 웹
									개발자의 꿈을 이루기 위해 준비하고 있습니다.</p>
							</div>

							<div class="alert alert-success">
								<a href="#">
									<h4 class="title">
										장점과 단점<br>
										<hr>
										<small>“소통하는 웹 개발자 입니다.”</small>
									</h4>
								</a>

								<p class="description">기획자로 일하면서 다른 분야의 전문가들과의 소통방식을 체득할 수
									있었습니다. 상대의 전문분야를 인정하고 경청하는 것, 각 분야의 전문가들 사이에 다리가 되어 쉽게 설명하거나
									조정하는 것, 그리고 클라이언트의 요구사항으로 인한 불만을 공감하고 함께하는 태도를 보여주었습니다. 이 소통방식은
									웹 개발자로서 일할 때 저의 가장 큰 무기가 되어줄 것이라 생각됩니다.<br> 다만 저는 고집이 세고 성격이 급한
									편입니다. 그래서 옳다고 생각하는 부분에 고집을 피우고 집착해 주위 사람들을 난처하게 하거나 업무 진행이 느려지는
									경우가 종종 있습니다. 실제 업무에서는 단점에 주의하고 있습니다.</p>
							</div>
							<div class="alert alert-info">
								<a href="#">
									<h4 class="title">
										지원동기<br>
										<hr>
										<small>“열정 보다 더 강한 필사의 마음으로”</small>
									</h4>
								</a>

								<p class="description">늦은 나이, 기존의 커리어 포기, 쉬운 결정은 아니였습니다.
									그렇기에 웹 개발자가 되겠다는 의지와 자세는 누구 못지 않습니다.. 오히려 늦게 시작한 만큼 열정보다 더 강한
									필사의 마음으로 웹 개발자로 임하려 합니다. <br>웹은 전세계 모든 사람들이 이용하는 만큼 다양한 기술들로 빠르게
									변화하고 있습니다. 저는 그 변화에 맞춰 향상된 기술을 계속 습득하여 앞서가는 웹 개발자가 되고자 합니다.</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<div id="todayModal" class="modal fade in" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display:none;" padding-right: 17px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">쿠키용 팝업</h4>
				</div>
				<div class="modal-body">
					<p>안녕하세요. 이 팝업은 오늘 하루동안 팝업 안 뜨도록 쿠키로 제어하고자 만들어졌습니다. </p>
				</div>
				<div class="modal-footer">
					
					<label class="checkbox-inline">
				  <input type="checkbox" name="todayCheckBox" value="option">
				   오늘 하루동안 보지 않기
				</label>
				</div>
			</div>
		</div>
	</div>