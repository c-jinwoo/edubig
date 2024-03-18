package com.webapp.ccedu.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : 
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

@Mapper("onlineBookMapper")
public interface OnlineBookMapper {		
	List<EduMap> selectTotalBookList() throws Exception;	
	
	List<EduMap> selectCourseBookList() throws Exception;
	
	List<EduMap> selectClassList(String bookNo) throws Exception;
	
	EduMap selectBookInfo(DataMap data) throws Exception;

	List<EduMap> getCourseBookInfo(DataMap rMap) throws Exception;	

	Integer getBookPrice(String pNo) throws Exception;	
}