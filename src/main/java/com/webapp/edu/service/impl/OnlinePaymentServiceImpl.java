package com.webapp.ccedu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.ParamUtil;
import com.webapp.ccedu.mapper.OnlineBookMapper;
import com.webapp.ccedu.mapper.OnlinePaymentMapper;
import com.webapp.ccedu.service.OnlinePaymentService;
import com.webapp.classdesk.service.ConvertJavaToProcedureService;
/**
 * Description : 
 * 
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

@Service("onlinePaymentService")
public class OnlinePaymentServiceImpl implements OnlinePaymentService{
	@Resource(name = "onlinePaymentMapper")
	private OnlinePaymentMapper onlinePaymentMapper;	 
		
	public EduMap selectUserInfo(Integer userno) throws Exception{
		return onlinePaymentMapper.selectUserInfo(userno);
	}

    public Integer selectPaymentLastOrder() throws Exception{    	
        return onlinePaymentMapper.selectPaymentLastOrder();
    }

    public List<EduMap> selectPaymentList(DataMap data) throws Exception{
    	return onlinePaymentMapper.selectPaymentList(data);
    }
    
    public List<EduMap> selectPaymentHist(String orderNo) throws Exception{
    	return onlinePaymentMapper.selectPaymentHist(orderNo);
    }
    
    public void insertPayment(DataMap data) throws Exception{
    	onlinePaymentMapper.insertPayment(data);
    }    
}