package egovframework.example.forum.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface ForumMapper {

	List<EgovMap> selectForumServiceList(Map<String, Object> paramMap) throws Exception;

	void insertForumServiceList(Map<String, Object> paramMap) throws Exception;

	void updateForumViewsServiceList(Map<String, Object> paramMap) throws Exception;

	void updateForumServiceList(Map<String, Object> paramMap) throws Exception;

	void deleteForumServiceList(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectForumReplyServiceList(Map<String, Object> paramMap) throws Exception;

	void insertForumReplyServiceList(Map<String, Object> paramMap) throws Exception;;

	void updateForumReplyServiceList(Map<String, Object> paramMap) throws Exception;;

	void deleteForumReplyServiceList(Map<String, Object> paramMap) throws Exception;;

}
