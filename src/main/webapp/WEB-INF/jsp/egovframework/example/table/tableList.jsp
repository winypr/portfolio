<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
	$(function() {
		// /* Date picker 초기화 */
		
			$('#datetimepicker1').datetimepicker({
			  pickTime: false
			});
			
			$('#datetimepicker2').datetimepicker({
				  pickTime: false
			});
	
	})
	
	var eventC = {

			searchA : function() {
				
			 $.ajax({

				url : "<c:url value='/searchTableList.do'/>",
				type : "post",
				dataType : "JSON",
				data : Cmmn.formToObj("mainSrchForm"), 

				success : function(d) {
					$("#ajax-teble tbody").children().remove();  // 기존 검색 데이터 삭제
					d.forEach(createTable);						 // 검색 데이터 입력 
					alert("검색을 완료하였습니다.")
				},
				
				 error:function(request,status,error){
				    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				},

			}); 
		} 
	}
	
	function createTable(e, index) {
		
		var tagTr = document.createElement('tr');
		
		for (var key in e) {	
	
				var tagTd = document.createElement('td');
				tagTd.textContent = e[key]
				tagTr.appendChild(tagTd)		
		}
		$("#ajax-teble tbody").append(tagTr);
	}
</script>

<div class="matter">
	<div class="container-fluid">
		<form id="mainSrchForm">
			<!-- <input type="hidden" id="mainMngNo" name="mainMngNo" /> 
			<input type="hidden" id="srchPage" name="srchPage" /> -->

			<div class="row">
				<div class="col-md-12">
					<div class="widget wlightblue">
					
						<div class="widget-head">
							<div class="pull-left">검색</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>

						</div>

						<div class="widget-content">
							<!-- 	<div class="table-responsive"> -->
							<table class="table table-bordered ">
								<thead></thead>
								<tbody>
									<tr>
										<th scope="row">키워드검색</th>
										<td scope="row" colspan="3">
											<div class="pull-left">
												<select id="srchTp" name="srchTp"
													class="selectric form-control" title="제목 선택박스">
													<option value="A">
														전체</option>
													<option value="N">
														이름</option>
													<option value="T">
														타입</option>
													<option value="P">
														장소</option>
												</select>
											</div> <input type="text" id="title" name="title" class="form-control"
											style="width: calc(100% - 244px)" maxlength="50"
											/>

										</td>
									</tr>
									<tr>
										<td scope="row">일자검색</td>
										<td scope="row">
											<div id="datetimepicker1" class="input-append">
												<input data-format="yyyy-MM-dd" class="picker" type="text" id="dpStrtDt" name="dpStrtDt">
												<span class="add-on"> &nbsp;<i
													data-date-icon="fa fa-calendar" class="fa fa-calendar"></i>
												</span>
											</div>
										</td>
										<td scope="row">
											<div id="datetimepicker2" class="input-append">
												<input data-format="yyyy-MM-dd" class="picker" type="text" id="dpEndDt" name="dpEndDt">
												<span class="add-on"> &nbsp;<i
													data-date-icon="fa fa-calendar" class="fa fa-calendar"></i>
												</span>
											</div>
										</td>
									</tr>
								</tbody>
								
							</table>
						</div>
			</form>
		<div class="widget-foot">
		<div class="pull-right">
			<button type="button" class="btn btn-success" onclick="eventC.searchA()">검색</button>
		</div>
			<div class="clearfix"></div>
		</div>
	</div>
	</div>
</div>
	

<div class="row">
	<div class="col-md-12">

		<div class="widget worange">
			<div class="widget-head">
				<div id="testId" class="pull-left">Table</div>
				<div class="widget-icons pull-right">
					<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
					<a href="#" class="wclose"><i class="fa fa-times"></i></a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="widget-content">
				<div class="table-responsive">
					<table id="ajax-teble" class="table table-bordered">
						<thead>
							<tr>
								<th>NO</th>
								<th>타입</th>
								<th>이름</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>장소</th>
							</tr>
						</thead>
						<tbody>
							
							<%-- --%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
		