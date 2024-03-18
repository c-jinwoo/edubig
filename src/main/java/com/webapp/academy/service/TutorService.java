package com.webapp.academy.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Tutor Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2021.04.09   SANGS           최초작성
 *
 */
public interface TutorService {

    /**
     * 강사료관리 목록 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSyTutorFeeList(DataMap data) throws Exception;  

    /**
     * 강의 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorCourseList(DataMap data) throws Exception;

    /**
     * 강사료 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getTutorPrice(DataMap data) throws Exception;

    /**
     * 강사료 신청
     * 
     * @param data
     * @throws Exception
     */
    void insertSyTutorFee(DataMap data) throws Exception;

    /**
     * 강의 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEdCourseSeqInfo(DataMap data) throws Exception;

    /**
     * 과정상태 변경
     * 
     * @param data
     * @throws Exception
     */
    void updateEdCourseSeq(DataMap data) throws Exception;

    /**
     * 강사료 신청양식 상세
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUpdateTutorInfo(DataMap data) throws Exception;
    
    /**
     * 커뮤니티코드관리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getCmmntyList(DataMap data)throws Exception;

	/**
     * 커뮤니티관리 서브리스트 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCmmntySubListCount(DataMap data) throws Exception;
    
    /**
     * 커뮤니티코드관리 서브TOP 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getCmmntySubTopList(DataMap data)throws Exception;
	
	/**
     * 커뮤니티코드관리 서브리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getCmmntySubList(DataMap data)throws Exception;
	
	/**
     * 강사커뮤니티관리 소분류 상세리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCmmntyDetailSubInfo(DataMap data) throws Exception;
    
    /**
     * 커뮤니티코드관리 조회수
     *
     * @param data
     * @return
     * @throws Exception
     */
	void updateCmmntyRcnt(DataMap data)throws Exception;

	/**
     * 커뮤니티코드관리 삭제 비활성화
     *
     * @param data
     * @return
     * @throws Exception
     */
	int selectReplyInfo(DataMap data)throws Exception;

	/**
     * 커뮤니티코드관리 서브 폼 파일리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(DataMap data) throws Exception;
    
    /**
     * 커뮤니티코드관리 서브 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void deleteCmmntySubInfo(DataMap data)throws Exception;
	
	/**
     * 커뮤니티관리 서브 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void insertCmmntySubInfo(DataMap data)throws Exception;

	/**
     * 커뮤니티관리 서브파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void insertCmmntySubFileInfo(HttpServletRequest request , DataMap data)throws Exception;

	/**
     * 커뮤니티관리 등록글의 nttNo값
     *
     * @param data
     * @return
     * @throws Exception
     */
	public String getNewNttNo()throws Exception;

	/**
     * 커뮤니티관리 서브 등록 파일정보수정
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void updateCmmntySubFileInfo(DataMap data)throws Exception;
	
	/**
     * 커뮤니티관리 서브 답글 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void insertCmmntySubReplyInfo(DataMap data)throws Exception;
	
	/**
     * 커뮤니티관리 소분류 업데이트
     *
     * @param data
     * @return
     * @throws Exception
     */
	void updateCmmnthSubInfo(DataMap data)throws Exception;
	
	/**
     * 커뮤니티관리 소분류 리플정보 업데이트
     *
     * @param data
     * @return
     * @throws Exception
     */
	void updateCmmnthSubReplyInfo(DataMap data)throws Exception;
	
	/**
     * 커뮤니티관리 소분류 파일카운트 증가
     *
     * @param data
     * @return
     * @throws Exception
     */
	void updateCmmntySubFileCount(DataMap data)throws Exception;
	
	/**
     * 권한 코드
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMtSubCodeList(DataMap data) throws Exception;
    
    /**
     * 강사정보 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getTutorDetail(DataMap data);
    
    
    /**
     * 강사정보 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorDetail2(DataMap data);
    /**
     * 강사 위촉이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorEntRstList(DataMap data);
    
    /**
     * 강사 위촉이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorEntRstYearList(DataMap data);
    
    /**
     * 강사 위촉이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMtFieldNameList(DataMap data);
    
    /**
     * 강사정보 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateTutorInfo(HttpServletRequest request,DataMap data)throws Exception;
    
    /**
     * 강사이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorHisList(DataMap data);
    
    /**
     * 강사이력 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateTutorHis(HttpServletRequest request , DataMap data);

    /**
     * 강사이력 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteTutorHis(DataMap data);
    
    /**
     * 커뮤니티 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteCmmntyFile(DataMap data) throws Exception;
    
    /**
     * 정규교육 강의 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLectureList(DataMap data) throws Exception;
    
    /**
     * 정규교육 리스트 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getLectureListCount(DataMap data) throws Exception;
    
    /**
     * 특강정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLectureInfo(DataMap data) throws Exception;
    
    /**
     * 특강 신청일시
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureTime(DataMap data) throws Exception;
    
    /**
     * 특강 신청일시(개인)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getSpecialLectureTimeInfo(DataMap data) throws Exception;
    
    /**
     * 강사풀 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLecTutorList(DataMap data) throws Exception;
    
    /**
     * 강사풀 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
     int getLecTutorCount(DataMap data) throws Exception;
    
    /**
     * 특강 강사첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureFile(DataMap data) throws Exception;
    
    /**
     * 강사정보 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureFile2(DataMap data) throws Exception;
    
    /**
     * 강사 전직장 정보 
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLectureJobInfo(DataMap data) throws Exception;
    
    
    /**
     * 강사안내터 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(DataMap data) throws Exception;
    
    /**
     * 강사 결과보고 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap lecturePersonalFiledown(DataMap data) throws Exception;
    /**
     * 특강관리 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertLecture(HttpServletRequest request, DataMap data) throws Exception;
    
    /**
     * 평가 강의이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getEvaluationList(DataMap data) throws Exception;
    
    /**
     * 평가 강의이력 강의교안
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEvaluationFirst(DataMap data) throws Exception;
    
    /**
     * 평가 강의이력 강의계획
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEvaluationSecond(DataMap data) throws Exception;
    
    /**
     * 평가 강의이력 설문
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEvaluationThird(DataMap data) throws Exception;
    
    /**
     * 평가 강의이력 에세이
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEvaluationFourth(DataMap data) throws Exception;
    
    
    /**
     * 보고서 제출 등록 / 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void reportInfoExec(HttpServletRequest request, DataMap data) throws Exception;
    
    /**
     * 평가이력관리 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteEvaluationInfo(DataMap data) throws Exception;
    
    /**
     * 위원회관리 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLectureCommitteeInfo(DataMap data) throws Exception;

    /**
     * 소통게시판 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteTutorBoardFile(DataMap data) throws Exception;
    
    /**
     * 강사소통 게시글 삭제시 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void tutorBoardFileDelete(DataMap data) throws Exception;
    
    /**
     * 강서정보 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLecture(DataMap data) throws Exception;
    
    
    /**
     * 보고서 제출 수정폼
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getReportData(DataMap data) throws Exception;
    
    /**
     * 지역명 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMtSubName(DataMap data) throws Exception;
    
    /**
     * 강사여부 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
	public int getTutorGradeCnt(DataMap data)throws Exception;


    

	
    /**
     * 강사  VIEW COUNT 갱신
     *
     * @param data
     * @throws Exception
     */
    void updateTutorBoardViewCnt(DataMap data) throws Exception;
    
    /**
     * 강사 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectTutorBoardView(DataMap data) throws Exception;

    /**
     * 강사 파일 리스트
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorBoardFileList(int bbsNo) throws Exception;

    /**
     * 강사공지사항 파일
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    EduMap getLectureNoticeFileInfo(DataMap data)throws Exception;
    
    /**
     * 정규교육 강의 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureList(DataMap data) throws Exception;
    
    /**
     * 정규교육 리스트 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getSpecialLectureListCount(DataMap data) throws Exception;
    
    /**
     * 진행중인 특강 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureAll(DataMap data) throws Exception;
    
    /**
     * 진행중인 특강 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureAllView(DataMap data) throws Exception;
    
    /**
     * 특강신청정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureInfo(DataMap data) throws Exception;
    
    /**
     * 진행중인 특강 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureInfoView(DataMap data) throws Exception;
    
    /**
     * 특강 강사배정취소
     * 
     * @param paramMap
     * @throws Exception
     */
    void specialLectureCancelExec(Map<String, Object> paramMap) throws Exception;
    
    /**
     * 강사공간 댓글 입력
     * 
     * @param paramMap
     * @throws Exception
     */
    void tutorBoardReplySubmit(DataMap data) throws Exception;
    
    /**
     * 강사공간 댓글 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorBoardReplyList(DataMap data) throws Exception;
    
    /**
     * 강사공간 댓글 삭제
     * 
     * @param paramMap
     * @throws Exception
     */
    void tutorBoardReplyDelete(DataMap data) throws Exception;
    
    /**
     * 강사공간 댓글 삭제
     * 
     * @param paramMap
     * @throws Exception
     */
    void tutorBoardReplyModify(DataMap data) throws Exception;
    
    /**
     * 강사공간 댓글 ajax 리스트 
     * 
     * @param paramMap
     * @throws Exception
     */
    List<Map<String,Object>> getTutorBoardReplyAjaxList(DataMap data) throws Exception;
    
    /**
     * 강사공간 댓글 삭제
     * 
     * @param paramMap
     * @throws Exception
     */
    void tutorBoardCmtReplySubmit(DataMap data) throws Exception;

    
}
