package com.webapp.common.service;

import java.util.List;

import org.antlr.grammar.v3.ANTLRv3Parser.exceptionHandler_return;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;


public interface CommonPollService {
	
	
	/**
	 * 설문 리스트 - 게시판형식( 교육(PT0001) / 신용상담사(PT0002) / 사이트(PT0003) )
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
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_응시내역 등록
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
	void insertEdPollHist(DataMap data, String[] ordrList) throws Exception;
	
	
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
     * 신용상담사 > 합격여부 > 설문관리> 상시설문_응시답안 등록 (비회원)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception
     */
    void insertEdPollSite(DataMap rMap, String[] ordrList) throws Exception;
	
	

}