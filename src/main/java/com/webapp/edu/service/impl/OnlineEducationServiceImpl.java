package com.webapp.ccedu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.ParamUtil;
import com.webapp.ccedu.mapper.OnlineEducationMapper;
import com.webapp.ccedu.service.OnlineEducationService;
import com.webapp.classdesk.service.ConvertJavaToProcedureService;

/**
 * Description : 과정관련
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

@Service("onlineEducationService")
public class OnlineEducationServiceImpl implements OnlineEducationService{	
	@Resource(name = "onlineEducationMapper")
	private OnlineEducationMapper onlineEducationMapper;
	 	
	@Resource(name = "convertJavaToProcedureService")
    private ConvertJavaToProcedureService convertJavaToProcedureService;
	
    public List<EduMap> selectOnlineDetailList(DataMap data) throws Exception {
        data.setInt("rowCount", 6);
        ParamUtil.setPagingValue(data);
        return onlineEducationMapper.selectOnlineDetailList(data);
    }
    
    public Integer getCoursePrice(String pNo) throws Exception{
    	return onlineEducationMapper.getCoursePrice(pNo);
    }
    
    public EduMap getEdCourse1stSeqInfo(DataMap data) throws Exception {
        return onlineEducationMapper.getEdCourse1stSeqInfo(data);
    }
    
    public EduMap getEdCourseSeqInfo(DataMap data) throws Exception {
        return onlineEducationMapper.getEdCourseSeqInfo(data);
    }
  
    public String selectOnlineDetailTitle(Integer courseno) throws Exception{
    	return onlineEducationMapper.selectOnlineDetailTitle(courseno);
    }

    public List<EduMap> getCurriculum(DataMap data) throws Exception {
        return onlineEducationMapper.getCurriculum(data);
    }

    public List<EduMap> getFileInfoByCourseNo(int data) throws Exception {
        return onlineEducationMapper.getFileInfoByCourseNo(data);
    }

    public List<EduMap> getFileInfoByCourseNo2(DataMap data) throws Exception {
        return onlineEducationMapper.getFileInfoByCourseNo2(data);
    }

    public List<EduMap> getTxtFileInfoByCourseNo(DataMap data) throws Exception {
        return onlineEducationMapper.getTxtFileInfoByCourseNo(data);
    }

    public EduMap getCourseAppUserInfo(DataMap data) throws Exception {
        return onlineEducationMapper.getCourseAppUserInfo(data);
    }

    public void insertCourApplyExec(DataMap data) throws Exception {
        onlineEducationMapper.insertCourseApplyExec(data);
    }

    public EduMap getGuarPttnNoChk(DataMap data) throws Exception {
        return onlineEducationMapper.getGuarPttnNoChk(data);
    }
}