package com.webapp.academy.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("tutorMapper")
public interface TutorMapper {

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
     * 강사 과정 업데이트
     * 
     * @param data
     * @throws Exception
     */
    void updateEdCourseSeq(DataMap data) throws Exception;

    /**
     * 강사정보 업데이트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUpdateTutorInfo(DataMap data) throws Exception;
    
    /**
     * 커뮤니티관리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getCmmntyList(DataMap data) throws Exception;
	
	
	/**
     * 커뮤니티코드관리 서브리스트 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCmmntySubListCount(DataMap data) throws Exception;
    
    /**
     * 커뮤니티관리 서브리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getCmmntySubTopList(DataMap data) throws Exception;
	
	/**
     * 커뮤니티관리 서브리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getCmmntySubList(DataMap data) throws Exception;
	
	/**
     * 커뮤니티관리 상세 서브리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	EduMap getCmmntyDetailSubInfo(DataMap data) throws Exception;
	
	/**
    * 커뮤니티관리 조회수
    *
    * @param data
    * @return
    * @throws Exception
    */
    void updateCmmntyRcnt(DataMap data) throws Exception;
	
    /**
     * 커뮤니티코드관리 삭제 비활성화
     *
     * @param data
     * @return
     * @throws Exception
     */
    int selectReplyInfo(DataMap data) throws Exception;
 	
    /**
     * 커뮤니티관리 서브 폼 파일리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getFileList(DataMap data) throws Exception;
	
	/**
     * 커뮤니티관리 서브 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	void deleteCmmntySubInfo(DataMap data) throws Exception;

	/**
     * 커뮤니티관리 서브 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	void insertCmmntySubInfo(DataMap data) throws Exception;
	
	/**
     * 커뮤니티관리 서브파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	void insertCmmntySubFileInfo(DataMap data) throws Exception;
	
	/**
     * 커뮤니티관리 서브 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	public String getNewNttNo() throws Exception;

	/**
     * 커뮤니티관리 서브 등록 파일정보수정
     *
     * @param data
     * @return
     * @throws Exception
     */
	void updateCmmntySubFileInfo(DataMap data) throws Exception;

	/**
     * 커뮤니티관리 서브 답글 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	void insertCmmntySubReplyInfo(DataMap data) throws Exception;

	/**
     * 커뮤니티관리 소분류 업데이트
     *
     * @param data
     * @return
     * @throws Exception
     */
	void updateCmmnthSubInfo(DataMap data) throws Exception;

	/**
	 * 커뮤니티관리 소분류 리플정보 업데이트
     *
     * @param data
     * @return
     * @throws Exception
     */
	void updateCmmnthSubReplyInfo(DataMap data) throws Exception;
	
	/**
	 * 커뮤니티관리 소분류 파일카운트 증가
     *
     * @param data
     * @return
     * @throws Exception
     */
	void updateCmmntySubFileCount(DataMap data) throws Exception;
	
	/**
     * 권한코드 리스트
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
    void updateTutorInfo(DataMap data)throws Exception;
    
    /**
     * 강사정보 수정(전직장)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateTutorInfo2(DataMap data)throws Exception;
    
    
    /**
     * 강사정보 삭제(전직장)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteTutorInfo(DataMap data)throws Exception;
  

    /**
     * 강사 전직장 MAX KEY 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMaxBoardNo(DataMap data) throws Exception;
    
    /**
     * 강사이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTutorHisList(DataMap dMap);
    
    /**
     * 강사이력 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateTutorHis(DataMap dMap);
    
    /**
     * 강사이력 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertTutorHis(DataMap dMap);
    
    /**
     * 강사이력 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteTutorHis(DataMap dMap);
    
    /**
     * 커뮤니티 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteCmmntyFile(DataMap dMap);
    
    /**
     * 특강 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLectureList(DataMap data) throws Exception;
    
    /**
     * 특강 리스트 (데이터 총 갯수)
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
     * 강사 정보 첨부파일
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
     * 강사 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */

    public EduMap getFileInfo(DataMap data) throws Exception;
    
    /**
     * 강사 결과보고 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap lecturePersonalFiledown(DataMap data) throws Exception;
    /**
     * 특강 max key
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxSlnoInfo(DataMap data) throws Exception;
    
    /**
     * 특강 시간 max key
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxSltnoInfo(DataMap data) throws Exception;
    
    
    
    /**
     * 특강관리 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertLecture(DataMap data) throws Exception;
    
    /**
     * 등록정보조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getLectureInsertInfo(DataMap data) throws Exception;
    
    /**
     * 특강관리 교육일시 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertLectureTime(DataMap data) throws Exception;
    
    /**
     * 파일등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertFileInfo(DataMap data) throws Exception;
    
    /**
     * 파일등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertFileInfo2(DataMap data) throws Exception;
    
    
    /**
     * 파일수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateFileInfo(DataMap data) throws Exception;
    
    
    /**
     * 강의이력 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateLectureInfo(DataMap data) throws Exception;
    
    /**
     * 강의이력시간 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateLectureTimeInfo(DataMap data) throws Exception;
    
    /**
     * 평가이력 보고서제출 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteReportFileInfo(DataMap data) throws Exception;
    
    /**
     * 강의이력 시간 수정(기타내용)
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateLectureTime(DataMap data) throws Exception;
    
    
    /**
     * 평가 강의이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getEvaluationList(DataMap data) throws Exception;
    
    /**
     * 평가 강의이력 리스트
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
     * 보고서 제출 파일등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertReportFileInfo(DataMap data) throws Exception;
    
    /**
     * 보고서 제출 수정 폼
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getReportData(DataMap data) throws Exception;
    
    /**
     * 보고서 제출 파일수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateReportFileInfo(DataMap data) throws Exception;
    
    /**
     * 평가이력관리 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteEvaluationInfo(DataMap data) throws Exception;
    
    /**
     * 위원회관리 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLectureCommitteeInfo(DataMap data) throws Exception;
    
    /**
     * 강사소통 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteTutorBoardFile(DataMap data) throws Exception ;
    
    
    /**
     * 강사소통 게시글 삭제시  파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void tutorBoardFileDelete(DataMap data) throws Exception ;
    /**
     * 강사정보 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteLecture(DataMap data) throws Exception;
    
    
    /**
     * 보고서 제출 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteReportFile(DataMap data) throws Exception;
    
    
    /**
     * 평가 이력관리 파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    void insertEvalFileInfo(DataMap data) throws Exception;
    
    /**
     * 평가 이력관리 파일 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateEvalFileInfo(DataMap data) throws Exception;
    
    /**
     * 지역명 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMtSubName(DataMap data) throws Exception;
    
    /**
     * 수정 / 삭제시 사용자가 등록한글인지 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCheckInfo(DataMap data) throws Exception;
    
    /**
     * 수정 전 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    void deleteFileInfo(DataMap data) throws Exception;
    
    /**
     * 강사여부확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getTutorGradeCnt(DataMap data) throws Exception;
    

    

    
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
     * 강사공지사항 파일 리스트
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
     * 특강 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSpecialLectureList(DataMap data) throws Exception;
    
    /**
     * 특강 리스트 (데이터 총 갯수)
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
     * 희망주제 코드 로드
     *
     * @param data
     * @return
     * @throws Exception
     */
	String getMtLctreName(String mtLctreName);
	
	  /**
     * 시설정보 코드 로드
     *
     * @param data
     * @return
     * @throws Exception
     */
	String getMtFcltsName(String mtLctreName);
	/**
     * 진행중인특강 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getSpecialLectureAllView(DataMap data) throws Exception;
	
	/**
     * 진행중인특강 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getSpecialLectureInfo(DataMap data) throws Exception;
	
	/**
     * 진행중인특강 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
	List<EduMap> getSpecialLectureInfoView(DataMap data) throws Exception;
	
	/**
     * 강사공간 특강신청 배정취소
     * 
     * @param data
     * @throws Exception
     */
    void CancelExec(Map<String, Object> data) throws Exception;
    
    /**
     * 강사공간 특강강의 이력 결과보고
     * 
     * @param data
     * @throws Exception
     */
    void updateTutorLectureResult(DataMap data) throws Exception;
    
    /**
     * 강사공간 강사배정 특강 상태 변경
     * 
     * @param data
     * @throws Exception
     */
    void specialLectureCancelChange(Map<String, Object> data) throws Exception;
    
    /**
     * 댓글 코드 로드
     *
     * @param data
     * @return
     * @throws Exception
     */
    int selectBoardReplyCmtno(DataMap data) throws Exception;
    
    /**
     * 답글 코드 로드
     *
     * @param data
     * @return
     * @throws Exception
     */
    int selectBoardReplyRpyno(DataMap data) throws Exception;
    
    /**
     * 강사공간 강사배정 특강 상태 변경
     * 
     * @param data
     * @throws Exception
     */
    void insertBoardReplySubmit(DataMap data) throws Exception;
    
    /**
     * 강사소통마당 댓글 리스트
     * 
     * @param data
     * @throws Exception
     */
    List<EduMap> getTutorBoardReplyList(DataMap data) throws Exception;
    
    /**
     * 강사사통마당 댓글 상태 변경
     * 
     * @param data
     * @throws Exception
     */
    void tutorBoardReplyDelete(DataMap data) throws Exception;
    
    /**
     * 강사사통마당 댓글 수정
     * 
     * @param data
     * @throws Exception
     */
    void tutorBoardReplyModify(DataMap data) throws Exception;
    
    /**
     * 강사사통마당 ajax 댓글 리스트
     * 
     * @param data
     * @throws Exception
     */
    List<Map<String,Object>> getTutorBoardReplyAjaxList(DataMap data) throws Exception;
    
    /**
     * 강사사통마당 댓글 답글달기
     * 
     * @param data
     * @throws Exception
     */
    void tutorBoardCmtReplySubmit(DataMap data) throws Exception;


    /**
     * ajax  진도 체크
     * 
     * @param DataMap
     * @throws Exception
     */
    void insertProgressCheck(DataMap data) throws Exception;
    
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
    
}