package egovframework.example.forum.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ForumService {

	List<EgovMap> selectForumServiceList(Map<String, Object> paramMap)  throws Exception;

	String ajaxForumServiceList(Map<String, Object> paramMap) throws Exception;

}
