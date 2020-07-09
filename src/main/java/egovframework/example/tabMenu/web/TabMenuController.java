package egovframework.example.tabMenu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TabMenuController {

	@RequestMapping(value = "/tabMenu.do")
	public String initMain() throws Exception {

		return "tab/tabMenu.tiles";
	}
	
	
}