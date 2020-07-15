package egovframework.example.table.service.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.table.service.TableService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service
public class TableServiceImpl implements TableService {
	
	@Resource
	private TableMapper tableMapper;

	@Override
	public List<EgovMap> selectTableServiceList(Map<String, Object> paramMap) throws Exception {
		
		paramMap.put("rows", 5);
		paramMap.put("page", 1);
		
		System.out.println(tableMapper.selectTableServiceList(paramMap));
		
		return tableMapper.selectTableServiceList(paramMap);
	}

	@Override
	public List<EgovMap> selectPieChartServiceList() throws Exception {
	
		
		return tableMapper.selectPieChartServiceList();
	}

	@Override
	public List<EgovMap> selectBarChartServiceList() throws Exception {
		
		// TODO Auto-generated method stub
		return tableMapper.selectBarChartServiceList();
	}

}
