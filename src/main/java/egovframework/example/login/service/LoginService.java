package egovframework.example.login.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface LoginService {

	String ajaxIDCheckServiceList(Map<String, Object> paramMap) throws Exception;

	String ajaxCreateAccoutServiceList(Map<String, Object> paramMap) throws Exception;

	String ajaxLoginServiceList(Map<String, Object> paramMap) throws Exception;

}
