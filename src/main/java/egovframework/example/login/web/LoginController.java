package egovframework.example.login.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.login.service.LoginService;



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
	
	@RequestMapping(value = "/logout.do")
	public String initLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Cookie[] cookie = request.getCookies();

		    for(int i=0; i < cookie.length; i++){

		    	cookie[i].setMaxAge(0);

		        response.addCookie(cookie[i]);
		    }
		return null;
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
	public String initAjaxLogin(@RequestParam Map<String, Object> paramMap, HttpServletResponse response ) throws Exception {
		
		
		return loginService.ajaxLoginServiceList(paramMap, response);
	}
}
