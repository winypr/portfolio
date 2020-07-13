package egovframework.example.tabMenu.web;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TabMenuController {
	
	@RequestMapping(value = "/tab.do")
	public String initTabMain() throws Exception {

		return "tab/tabMenu.tiles";
	}

	@RequestMapping(value = "/tab/{tabSubMenu}.do")
	public String initMain(@PathVariable("tabSubMenu") String pathName) throws Exception {
		System.out.println(pathName);
		
		return "tab/" + pathName;
	}
	
	
}