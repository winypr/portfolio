package egovframework.example.forum.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.forum.service.ForumService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class ForumServiceImpl implements ForumService {
	
	@Resource
	private ForumMapper forumMapper;
	
	
	
	
	@Override
	public List<EgovMap> selectForumServiceList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(paramMap.get("fmNo"));
		if (paramMap.containsKey("fmNo") == true && paramMap.get("fmNo")!="" ) {
			forumMapper.updateForumViewsServiceList(paramMap);
		}
		
		return forumMapper.selectForumServiceList(paramMap);
	}

	@Override
	public String ajaxForumServiceList(Map<String, Object> paramMap) throws Exception {

		/*List<EgovMap> ForumView = forumMapper.selectForumServiceList(paramMap)*/;
		Map<String, Object> resultMap = new HashMap<>();
		
		String editType = (String) paramMap.get("editType");

		if (editType.equals("insert")) {
			forumMapper.InsertForumServiceList(paramMap);
		} else if (editType.equals("update")) {
			forumMapper.UpdateForumServiceList(paramMap);
		}
		
		
		resultMap.put("result", "SUCCESS");
		
		return JsonUtil.MapToJson(resultMap);
	}

	
	
}
