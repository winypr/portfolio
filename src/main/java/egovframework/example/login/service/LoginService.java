package egovframework.example.login.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface LoginService {

	String ajaxIDCheckServiceList(Map<String, Object> paramMap) throws Exception;

	String ajaxCreateAccoutServiceList(Map<String, Object> paramMap) throws Exception;

	String ajaxLoginServiceList(Map<String, Object> paramMap, HttpServletResponse response) throws Exception;

}
