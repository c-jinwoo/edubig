package com.webapp.academy.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("myClassMapper")
public interface MyClassMapper {

    /**
     * 정규과정 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseUserList(DataMap data) throws Exception;
    
    /**
     * 정규과정 대출상품 목록 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseUserList2(DataMap data) throws Exception;

    /**
     * 정규교육 목록 조회
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
     * 강사 첨부파일
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
     * 특강정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLectureInfo(DataMap data) throws Exception;

    /**
     * 특강 시간 정보
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
    void updateLectureExec(DataMap data) throws Exception;

    /**
     * 특강시간 정보 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateLectureTime(DataMap data) throws Exception;
    
    /**
     * 특강 기타정보 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLectureExec(DataMap data) throws Exception;
    
    /**
     * 특강시간 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLectureTimeExec(DataMap data) throws Exception;

    
    /**
     * 특강 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(DataMap data) throws Exception;
    
    /**
     * 수강중인 과정 수
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getCourseUserCntInfo(DataMap data) throws Exception;

    /**
     * 수강중인 과정 목록 (2021.10.19 이전)
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseUserInfoList(DataMap data) throws Exception;

    /**
     * 수강정보 삭제 (진도, 결제, 수강)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteCourseTreeHist(DataMap data) throws Exception;
    void deletePmPayment(DataMap data) throws Exception;
    void deleteCourseUser(DataMap data) throws Exception;
    void deleteCourseUserAll(DataMap data) throws Exception;
    
    /**
     * 사용자 특강신청
     * 
     * @param data
     * @return
     * @throws Exception
     */
    void insertAprsltExec(DataMap data) throws Exception;

    /**
     * 방문교육 MAX KEY 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMaxBoardNo(DataMap data) throws Exception;
    
    
    /**
     * 사용자 방문 교육시간
     * 
     * @param data
     * @return
     * @throws Exception
     */
    void insertAprsltDate(DataMap data) throws Exception;
    
	List<Map<String, Object>> getAreaSidoList(DataMap data) throws Exception;

	List<Map<String, Object>> getAreaGuList(DataMap data) throws Exception;

	List<Map<String, Object>> getAreaDongList(DataMap data) throws Exception;

	/** 대출상품 - 자금용도 코드 목록조회 */
	List<Map<String, Object>> getEduLoanGoods(DataMap data) throws Exception;
	/** 대출상품 목록조회 */
	List<Map<String, Object>> getEduLoanPrdList(DataMap data) throws Exception;

    /**
     * 강사 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectLearningStatusList(DataMap data) throws Exception;
        
    /**
     * ajax  진도 체크
     * 
     * @param DataMap
     * @throws Exception
     */
    void insertProgressCheck(DataMap data) throws Exception;
    
    /**
     * 데이터 확인
     * 
     * @param data
     * @throws Exception
     */
    EduMap selectProgressChk(DataMap data) throws Exception;
    
    /**
     * 수료코드번호생성
     * 
     * @param data
     * @throws Exception
     */
    String getMaxCompCode(DataMap rMap) throws Exception;

    /**
     * updateLeCourseUserInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateLeCourseUserInfo(DataMap data) throws Exception;

    /**
     * 수료코드번호업데이트
     * 
     * @param data
     * @throws Exception
     */
    void updateMaxCompCode(DataMap rMap) throws Exception;

    void updateCceduLeCourseUserInfo(DataMap data) throws Exception; 
    
    List<EduMap> selectClassBoardList(DataMap data) throws Exception;

    int selectLearningStatusListCnt(DataMap data) throws Exception;

    EduMap selectCourseInfo(DataMap rMap) throws Exception;

    List<EduMap> selectMtScCodeList(DataMap rMap) throws Exception;

    List<EduMap> selectCourseSeqList(DataMap rMap) throws Exception;

    List<EduMap> getClassCourseBbsList(DataMap rMap) throws Exception;

    EduMap getUserCertPrintInfo(DataMap data) throws Exception;

    int getPrintMaxIdx(DataMap data) throws Exception;

    void insertPrintLog(DataMap data) throws Exception;

    void updateCourseUserProgress(DataMap data) throws Exception;

    void updateCourseUserTestVal(DataMap data) throws Exception;
    
    Integer selectLastVal(DataMap data) throws Exception;
    
    Integer selectRunTime(DataMap data) throws Exception;
}
