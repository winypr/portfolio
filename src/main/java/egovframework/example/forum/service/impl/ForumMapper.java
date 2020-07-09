package egovframework.example.forum.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface ForumMapper {

	List<EgovMap> selectForumServiceList(Map<String, Object> paramMap) throws Exception;

	void InsertForumServiceList(Map<String, Object> paramMap) throws Exception;

	void updateForumViewsServiceList(Map<String, Object> paramMap) throws Exception;

	void UpdateForumServiceList(Map<String, Object> paramMap) throws Exception;

}
