package com.webapp.common.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commonPollMapper")
public interface CommonPollMapper {
	
	
	/**
	 * 설문 리스트( 교육(PT0001) / 신용상담사(PT0002) / 사이트(PT0003) )
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getPollList(DataMap data) throws Exception;
	
	
	/**
	 * 신용상담사 > 합격여부 > 설문관리
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	EduMap getExamPollInfo(DataMap data) throws Exception;

	
	/**
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_문항
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getEdPollQuizList(DataMap data) throws Exception;

	
	/**
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_문항_보기
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getEdPollQitemList(DataMap data) throws Exception;
	
	
	/**
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_문항_보기
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	void insertEdPollApply(DataMap data) throws Exception;
	
	
	/**
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_응시답안 등록
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	void insertEdPollHist(DataMap data) throws Exception;
	

	/**
	 * 모듈명 리스트
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getModuleList(DataMap data) throws Exception;

    /**
     * 비회원 번호 조회
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception
     */
    int selectNoUserNo(DataMap data) throws Exception;

    /**
     * 신용상담사 > 합격여부 > 설문관리> 상시설문_문항_등록
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception
     */
    void insertEdPollSite(DataMap data) throws Exception;

    /**
     * 신용상담사 > 합격여부 > 설문관리> 상시설문_응시답안 등록
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception
     */
    void insertEdPollSiteHist(DataMap data) throws Exception;
	
	
	
}
