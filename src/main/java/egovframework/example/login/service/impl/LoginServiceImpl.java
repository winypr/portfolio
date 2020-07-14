package egovframework.example.login.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

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
	public String ajaxLoginServiceList(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> idCheck = loginMapper.selectUserLoginServiceList(paramMap);
		
		if (Integer.parseInt(idCheck.get("count").toString()) > 0) {
			resultMap.put("result", "SUCCESS");
			resultMap.put("urName", idCheck.get("UR_NAME"));
		} else resultMap.put("result", "FAIL");
		
		return JsonUtil.MapToJson(resultMap);
	}


	

}
