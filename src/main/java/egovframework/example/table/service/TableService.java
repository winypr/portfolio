package egovframework.example.table.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface TableService {

	List<EgovMap> selectTableServiceList(Map<String, Object> paramMap) throws Exception;;

	List<EgovMap> selectPieChartServiceList() throws Exception;;

	List<EgovMap> selectBarChartServiceList() throws Exception;;

}
