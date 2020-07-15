package egovframework.example.login.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.login.service.LoginService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class LoginServiceImpl implements LoginService{

	@Resource
	private LoginMapper loginMapper;
	

	@Override
	public String ajaxIDCheckServiceList(Map<String, Object> paramMap) throws Exception {
		
		int idCheck = loginMapper.selectUserServiceList(paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if (idCheck == 0) resultMap.put("result", "SUCCESS");
		else resultMap.put("result", "FAIL");
		
		return JsonUtil.MapToJson(resultMap);
	}

	@Override
	public String ajaxCreateAccoutServiceList(Map<String, Object> paramMap) throws Exception {
		
		loginMapper.insertUserListServiceList(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "SUCCESS");
		
		return JsonUtil.MapToJson(resultMap);
	}

	@Override
	public String ajaxLoginServiceList(Map<String, Object> paramMap, HttpServletResponse response) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<EgovMap> idCheck = loginMapper.selectUserLoginServiceList(paramMap);
		
		System.out.println(idCheck);
		// idCheck를 map 형태로 변환
		String idCheckStr = JsonUtil.EgovMapToJson(idCheck.get(0));
		resultMap = JsonUtil.JsonToMap(idCheckStr);
		
		Double countStr = Double.parseDouble(resultMap.get("count").toString());
		
		// 로그인 성공 시 success 추가
		if (countStr > 0) {
			
			resultMap.put("result", "SUCCESS");
			
			Cookie loginIdCookie = new Cookie("userId", (String) resultMap.get("urId"));
			Cookie loginNmCookie = new Cookie("userNm", (String) resultMap.get("urName"));

			loginIdCookie.setPath("/");
			loginNmCookie.setPath("/");
			
			response.addCookie(loginIdCookie);
			response.addCookie(loginNmCookie);
			
		} else resultMap.put("result", "FAIL");
		
		
		return  JsonUtil.MapToJson(resultMap);
	}

}
