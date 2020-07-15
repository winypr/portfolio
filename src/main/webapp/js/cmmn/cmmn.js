/**
 * Cmmn 관련 공통 JS
 */
var Cmmn = (function() {
	
	/**
	 * form 의 input text, input radio, textarea, selectbox 의 값을 obj로 만들어준다.
	 * formToObj 사용 시 form 태그로 감싼 다음 이용하세요
	 * @parameter  obj로 만든 타겟 Id ( form, div, span.. 기능)
	 */
	var _formToObj = function(frmId) {
		var dataObj = {};
		
		$("#" + frmId).find("input:text, input:hidden, select, textarea, input:radio, input:password").each(function(i, v) {
			var $v 		= $(v),
				name 	= $v.attr("name");
			
			if (typeof name !== "undefined") {
				dataObj[name] = $v.val();
			}
		});
		
		return dataObj;
	}
	var _formatDate = function(format) {
	    var year = format.getFullYear();
	    var month = format.getMonth() + 1;
	    var date = format.getDate();
	    var hour = format.getHours();
	    var min = format.getMinutes();
	    var sec = format.getSeconds();
	    
	    if(month<10) month = '0' + month;

	    if(date<10) date = '0' + date;

	    return year + "-" + month + "-" + date ;
	}
	
	return {

		formToObj  	: _formToObj,
		formatDate : _formatDate
	}	
})();

/**
 * 로그인 공통 처리
 */


var loginField = {
		urIdCookie : $.cookie("userId"),
		urNmCookie : $.cookie("userNm")	
	}



/**
 * 초기화 공통 JS
 */

$(function() {
	// /* Date picker 초기화 */
	
		$('#datetimepicker1').datetimepicker({
		  pickTime: false
		});
		
		$('#datetimepicker2').datetimepicker({
			  pickTime: false
		});

})
