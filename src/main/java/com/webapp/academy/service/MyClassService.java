package com.webapp.academy.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : My Class Service
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2021.04.09   SANGS           최초작성
 *
 */
public interface MyClassService {

    /**
     * 일반과정 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseUserList(DataMap data) throws Exception;

    /**
     * 강의 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLectureList(DataMap data) throws Exception;

    /**
     * 특강신청일시
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureFile(DataMap data) throws Exception;

    /**
     * 특강승인완료 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getSPecialStatCode(DataMap data) throws Exception;
    
    /**
     * 강사 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureTime(DataMap data) throws Exception;

    /**
     * 특강시간테이블 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLectureTimeList(DataMap data) throws Exception;

    /**
     * 수정, 삭제시 자신이 작성한글인지 체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCheckInfo(DataMap data) throws Exception;
    
    /**
     * 특강정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLectureInfo(DataMap data) throws Exception;

    
    /**
     * 특강시간
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLectureDate(DataMap data) throws Exception;
    
    /**
     * 특강 기타정보 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateLectureExec(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * 특강시간 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLectureTimeExec(DataMap data) throws Exception;

    /**
     * 특강관리 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLectureExec(DataMap data) throws Exception;

    
    /**
     * 수강중인 과정 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getCourseUserCntInfo(DataMap data) throws Exception;

    /**
     * 수강 진도 삭제
     *
     * @param data
     * @throws Exception
     */
    void deleteCourseInfo(DataMap data) throws Exception;

    /**
     * 수강정보 전체 삭제
     *
     * @param data
     * @throws Exception
     */
    void deleteCourseAll(DataMap data) throws Exception;
    
    /**
     * 사용자 특강 신청  
     *
     * @param data
     * @throws Exception
     */
	void insertAprsltExec(DataMap rMap, List<Map<String,Object>> dataList) throws Exception;

	List<Map<String,Object>> getAreaSidoList(DataMap rMap) throws Exception;
	
	List<Map<String,Object>> getAreaGuList(DataMap rMap) throws Exception;
	
	List<Map<String,Object>> getAreaDongList(DataMap rMap) throws Exception;
	/** 대출상품 - 자금용도 코드 목록조회*/
	List<Map<String,Object>> getEduLoanGoods(DataMap rMap) throws Exception;
	/** 대출상품  목록조회*/
	List<Map<String,Object>> getEduLoanPrdList(DataMap rMap) throws Exception;

	
	/**
     * 강사게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectLearningStatusList(DataMap data) throws Exception;
    
    int selectLearningStatusListCnt(DataMap rMap) throws Exception;
    
    /**
     * 진도체크
     * @param req
     * @param rMap
     * @throws Exception
     */
    void insertProgressCheck(DataMap rMap) throws Exception;

    List<EduMap> selectClassBoardList(DataMap rMap) throws Exception;

    /**
     * search 기본 값 조회 
     * @param req
     * @param rMap
     * @throws Exception
     */
    EduMap selectCourseInfo(DataMap rMap) throws Exception;

    /**
     * 과정구분 콤보박스 조회
     * @param req
     * @param rMap
     * @throws Exception
     */
    List<EduMap> selectMtScCodeList(DataMap rMap) throws Exception;

    /**
     * 과정명 콤보박스 조회
     * @param req
     * @param rMap
     * @throws Exception
     */
    List<EduMap> selectCourseSeqList(DataMap rMap) throws Exception;

    /**
     * 강의실 공지사항 조회
     * @param req
     * @param rMap
     * @throws Exception
     */
    List<EduMap>  getClassCourseBbsList(DataMap rMap) throws Exception;

    EduMap getUserCertPrintInfo(DataMap rMap) throws Exception;

    int getPrintMaxIdx(DataMap rMap) throws Exception;

    void insertPrintLog(DataMap rMap) throws Exception;
}