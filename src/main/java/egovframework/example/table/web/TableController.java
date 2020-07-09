package egovframework.example.table.web;

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
import egovframework.example.table.service.TableService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class TableController {
	
	@Resource 
	private TableService tableService;
	
	@RequestMapping(value = "/table/{subMenu}.do")
	public String initTable(@PathVariable Map<String, Object> map, @RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {

		System.out.println(paramMap);
		try {
			
			List<EgovMap> tableList 		= tableService.selectTableServiceList(paramMap);
			List<EgovMap> pieChartList 		= tableService.selectPieChartServiceList();
			List<EgovMap> barChartList 		= tableService.selectBarChartServiceList();
			
			model.addAttribute("tableList", 	tableList);
			model.addAttribute("pieChart", 		pieChartList);
			model.addAttribute("barChart", 		barChartList);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return "table/"+ map.get("subMenu") +".tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchTableList.do", produces = "application/json; charset=utf8")
	public String searchTableListInit(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		List<EgovMap> tableList = new ArrayList<>();
		System.out.println(paramMap);
		try {
			
			tableList = tableService.selectTableServiceList(paramMap);
			//
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return JsonUtil.ListToJson(tableList);
	}
}