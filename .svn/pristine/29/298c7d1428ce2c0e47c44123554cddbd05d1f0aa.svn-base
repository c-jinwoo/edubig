package com.webapp.ccedu.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;

/**
 * Description : 
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

public interface OnlineBookService {
	List<EduMap> selectTotalBookList() throws Exception;
	
	List<EduMap> selectCourseBookList() throws Exception;
	
	List<EduMap> selectClassList(String bookNo) throws Exception;

	EduMap selectBookInfo(DataMap data) throws Exception;
	
	List<EduMap> getCourseBookInfo(DataMap rMap) throws Exception;
	
	Integer getBookPrice(String pNo) throws Exception;		
}