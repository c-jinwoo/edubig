package com.webapp.ccedu.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;

/**
 * Description : 과정관련
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

public interface OnlineEducationService{
    List<EduMap> selectOnlineDetailList(DataMap data) throws Exception;
    
    EduMap getEdCourse1stSeqInfo(DataMap rMap) throws Exception;
    
    EduMap getEdCourseSeqInfo(DataMap rMap) throws Exception;

    String selectOnlineDetailTitle(Integer courseno) throws Exception;   
    
    Integer getCoursePrice(String pNo) throws Exception;
    
    Object getCurriculum(DataMap rMap) throws Exception;

    List<EduMap> getFileInfoByCourseNo(int data) throws Exception; 

    List<EduMap> getFileInfoByCourseNo2(DataMap data) throws Exception; 

    List<EduMap> getTxtFileInfoByCourseNo(DataMap data) throws Exception;

    EduMap getCourseAppUserInfo(DataMap data) throws Exception;

	EduMap getGuarPttnNoChk(DataMap rMap) throws Exception;
	
    void insertCourApplyExec(DataMap data) throws Exception;
}