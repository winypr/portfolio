package egovframework.example.table.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface TableMapper {

	List<EgovMap> selectPieChartServiceList() throws Exception;;

	List<EgovMap> selectBarChartServiceList() throws Exception;;

	List<EgovMap> selectTableServiceList(Map<String, Object> paramMap) throws Exception;;

}
