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
@Mapper("onlinePaymentMapper")
public interface OnlinePaymentMapper{
	EduMap selectUserInfo(Integer userno) throws Exception;

    Integer selectPaymentLastOrder() throws Exception;
    
    List<EduMap> selectPaymentList(DataMap data) throws Exception;
    
    List<EduMap> selectPaymentHist(String orderNo) throws Exception;
    
    void insertPayment(DataMap data) throws Exception;
}