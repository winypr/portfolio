package egovframework.example.login.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.login.service.LoginService;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Controller
public class LoginController {
	@Resource
	private LoginService loginService;
	
	
	@RequestMapping(value = "/signup.do")
	public String initSignUp() throws Exception {

		return "login/signUp.login";
	}
	
	@RequestMapping(value = "/login.do")
	public String initLogin() throws Exception {

		return "login/signIn.login";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/ajaxIDCheck.do")
	public String initAjaxIDCheck(@RequestParam Map<String, Object> paramMap) throws Exception {
		System.out.println(paramMap);
		
		return loginService.ajaxIDCheckServiceList(paramMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxCreateAccout.do")
	public String initAjaxCreateAccout(@RequestParam Map<String, Object> paramMap) throws Exception {
		System.out.println(paramMap);
		
		return loginService.ajaxCreateAccoutServiceList(paramMap);
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajaxLogin.do")
	public String initAjaxLogin(@RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpSession session) throws Exception {
		
		Map<String, Object> resultMap = JsonUtil.JsonToMap(loginService.ajaxLoginServiceList(paramMap));
		
		if (resultMap.get("result").equals("SUCCESS")) {
			session = request.getSession(true);
			
			session.setAttribute("sessionUN", resultMap.get("urName"));
			
			String urNameStr = (String) session.getAttribute("sessionId");
			System.out.println(urNameStr);
		}
		
		
		return loginService.ajaxLoginServiceList(paramMap);
	}
}
