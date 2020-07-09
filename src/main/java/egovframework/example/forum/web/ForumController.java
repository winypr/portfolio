package egovframework.example.forum.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.forum.service.ForumService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ForumController {
	
	@Resource
	private ForumService forumService;
	
	@RequestMapping(value = "/forum.do")
	public String initForum(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {

		System.out.println("게시판" + paramMap);
		try {
			List<EgovMap> forumList =  forumService.selectForumServiceList(paramMap);
			
			model.addAttribute("forumList", forumList);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "forum/forum.tiles";
	}
	
	@RequestMapping(value = "/forum/{forumMenu}.do")
	public String initForumMenu(@PathVariable Map<String, Object> map, @RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		
		try {
			if (paramMap.containsKey("fmNo") == true && paramMap.get("fmNo")!="") {  // 글 보기 일 떄
				
				List<EgovMap> forumView =  forumService.selectForumServiceList(paramMap);
				model.addAttribute("forumView", forumView);
				
				System.out.println(forumView);
			} 
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "forum/" + map.get("forumMenu")+".tiles";
		
	}
	
	@RequestMapping(value = "/forum/edit.do")
	public String initForumWrite() throws Exception {
	
	return "forum/write";
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/ajaxForum.do")
	public String initajaxForum(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		
		System.out.println(paramMap);
		return forumService.ajaxForumServiceList(paramMap);
	}
	
	
	

}