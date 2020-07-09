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
	
	return {

		formToObj  	: _formToObj,
		
	}	
})();
