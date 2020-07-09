package egovframework.example.cmmn;


import java.util.List;
import java.util.Map;

public class StringUtil {

	
	/**
	 * object type 변수가 비어 있는 지 체크 
	 * 
	 * @param obj
	 * @return Boolean : true / false
	 */
	public static boolean empty(Object obj) {
		
		if (obj instanceof String)  return obj == null || "".equals(obj.toString().trim()) ;
		else if (obj instanceof Map)  return obj == null || ((Map<?, ?>) obj).isEmpty(); 
		else if (obj instanceof List)  return obj == null || ((List<?>) obj).isEmpty(); 
		else return obj == null;
		
	}
	
	public static boolean notEmpty(Object obj) {
		
		return !empty(obj);

	}
	
}
