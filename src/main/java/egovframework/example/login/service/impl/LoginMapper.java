package egovframework.example.login.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface LoginMapper {

	String ajaxCreateAccoutServiceList(Map<String, Object> paramMap) throws Exception;

	String ajaxIDCheckServiceList(Map<String, Object> paramMap) throws Exception;
	
	String ajaxLoginServiceList(Map<String, Object> paramMap) throws Exception;

	void insertUserListServiceList(Map<String, Object> paramMap) throws Exception;

	int selectUserServiceList(Map<String, Object> paramMap) throws Exception;

	Map<String, Object> selectUserLoginServiceList(Map<String, Object> paramMap) throws Exception;
	


}
