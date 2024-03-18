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
 * 2021.03.26	CSLAB		최초작성
 *
 */

public interface OnlineReviewService {
	List<EduMap> selectReviewList(DataMap rMap) throws Exception;
	
	EduMap selectReviewMap(DataMap rMap) throws Exception;	

	void insertReview(DataMap rMap) throws Exception;
	
	void updateReview(DataMap rMap) throws Exception;

	void deleteReview(DataMap rMap) throws Exception;	
}