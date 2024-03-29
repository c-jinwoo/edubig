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

public interface OnlinePaymentService{	
	EduMap selectUserInfo(Integer userno) throws Exception;

	Integer selectPaymentLastOrder() throws Exception;
    
    List<EduMap> selectPaymentList(DataMap data) throws Exception;
    
    List<EduMap> selectPaymentHist(String orderNo) throws Exception;
	
	void insertPayment(DataMap rMap) throws Exception;	
}