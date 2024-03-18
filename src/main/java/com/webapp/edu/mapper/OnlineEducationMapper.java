package com.webapp.ccedu.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : 과정관련
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

@Mapper("onlineEducationMapper")
public interface OnlineEducationMapper {
    List<EduMap> selectOnlineDetailList(DataMap data) throws Exception;

    EduMap getEdCourse1stSeqInfo(DataMap data) throws Exception;

    EduMap getEdCourseSeqInfo(DataMap data) throws Exception;

    List<EduMap> getCurriculum(DataMap data) throws Exception;

    List<EduMap> getFileInfoByCourseNo(int data) throws Exception;
    
    List<EduMap> getFileInfoByCourseNo2(DataMap data) throws Exception;
    
    List<EduMap> getTxtFileInfoByCourseNo(DataMap data) throws Exception;
    
    EduMap getCourseAppUserInfo(DataMap data) throws Exception;

    EduMap getGuarPttnNoChk(DataMap data) throws Exception;

    String selectOnlineDetailTitle(Integer courseno) throws Exception;
    
    Integer getCoursePrice(String pNo) throws Exception;
    
    void insertCourseApplyExec(Map<String, Object> paramMap) throws Exception;
}