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
		
		if (paramMap.containsKey("fmNo") == true && paramMap.get("fmNo")!="" ) {
			forumMapper.updateForumViewsServiceList(paramMap);
		}
		
		return forumMapper.selectForumServiceList(paramMap);
	}

	@Override
	public String ajaxForumServiceList(Map<String, Object> paramMap) throws Exception {

		List<EgovMap> ForumView = forumMapper.selectForumServiceList(paramMap);
		Map<String, Object> resultMap = new HashMap<>();
		
		String editType = (String) paramMap.get("editType");

		if (editType.equals("insert")) {
			forumMapper.insertForumServiceList(paramMap);
		
		} else if (editType.equals("update")) {
			forumMapper.updateForumServiceList(paramMap);
		
		} else if (editType.equals("delete")) {
			forumMapper.deleteForumServiceList(paramMap);
		}
		
		System.out.println("테스트"+paramMap.get("fmNo"));
		
		resultMap.put("fmNo", paramMap.get("fmNo"));
		resultMap.put("result", "SUCCESS");
		
		return JsonUtil.MapToJson(resultMap);
	}
	
	@Override
	public List<EgovMap> selectForumReplyServiceList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return forumMapper.selectForumReplyServiceList(paramMap);
	}

	@Override
	public String ajaxForumReplyServiceList(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<>();
		System.out.println("Reply"+ paramMap);
	
		String editType = (String) paramMap.get("editType");

		if (editType.equals("insert")) {
			forumMapper.insertForumReplyServiceList(paramMap);
			
		
		} else if (editType.equals("update")) {
			forumMapper.updateForumReplyServiceList(paramMap);
		
		} else if (editType.equals("delete")) {
			forumMapper.deleteForumReplyServiceList(paramMap);
		}
		
		
		resultMap.put("result", "SUCCESS");
		
		return JsonUtil.MapToJson(resultMap);
		
	}

}
