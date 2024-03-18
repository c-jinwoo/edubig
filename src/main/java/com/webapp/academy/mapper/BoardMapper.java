package com.webapp.academy.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {

    /**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardList(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getBoardListCnt(DataMap data) throws Exception;

    /**
     * TOP 게시글 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTopBoardList(DataMap data) throws Exception;

    /**
     * 게시판 최근 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLateBoardList(DataMap data) throws Exception;

    /**
     * 게시판 최근 글번호(이벤트)
     *
     * @param data
     * @return
     * @throws Exception
     */
    Integer getLateBoardNoEvent(Integer bcateno) throws Exception;
    
    /**
     * 게시판 등록
     *
     * @param data
     * @throws Exception
     */
    void insertBoardInfo(DataMap data) throws Exception;

    /**
     * 게시판 MAX KEY 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxBoardNo(DataMap data) throws Exception;

    /**
     * 게시판 내용보기 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMainPopBoardView(DataMap data) throws Exception;

    /**
     * 게시판 내용보기 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMainPopBoardViewNew(DataMap data) throws Exception;

    /**
     * 게시판 카운트 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMainPopBoardCount(DataMap data) throws Exception;

    /**
     * 게시판 내용보기 (상시설문)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMainPollPopBoardView(DataMap data) throws Exception;

    /**
     * 할인이벤트확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBargainInfo() throws Exception;
    
    /**
     * 참여여부 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getPollInfoData(DataMap data) throws Exception;

    /**
     * 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardView(DataMap data) throws Exception;

    /**
     * 게시판 이전글 보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBbsPrevData(DataMap data) throws Exception;

    /**
     * 게시판 다음글 보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBbsNextData(DataMap data) throws Exception;
    /**
     * 게시판 카테고리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardCategoryList(DataMap data) throws Exception;

    /**
     * 게시판 VIEW COUNT 갱신
     *
     * @param data
     * @throws Exception
     */
    void updateBoardViewCnt(DataMap data) throws Exception;

    /**
     * 게시판 정보 갱신
     *
     * @param data
     * @throws Exception
     */
    void updateBoardInfo(DataMap data) throws Exception;

    /**
     * 게시판 정보 삭제
     *
     * @param data
     * @throws Exception
     */
    void deleteBoardInfo(DataMap data) throws Exception;

    /**
     * 게시판 파일 정보
     *
     * @param fileNo
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(int fileNo) throws Exception;

    /**
     * 게시판 파일 삭제
     *
     * @param data
     * @throws Exception
     */
    void deleteFileInfo(DataMap data) throws Exception;

    /**
     * 게시판 파일 저장
     *
     * @param data
     * @throws Exception
     */
    void insertFileInfo(DataMap data) throws Exception;

    /**
     * 게시판 파일 저장
     *
     * @param data
     * @throws Exception
     */
    void insertEdDataFile(DataMap data) throws Exception;
    
    /**
     * 게시판 파일 리스트
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(int bbsNo) throws Exception;

    /**
     * 연간일정 코드 출력
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    int selectYearScheduleCode() throws Exception;

    /**
     * 배너 목록
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getBannerList(DataMap data) throws Exception;

    /**
     * 인권안내터 파일정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(DataMap data) throws Exception;
    
    /**
     * 자주묻는질문 조회수 업데이트
     *
     * @param data
     * @throws Exception
     */
    void getCountUpdate( DataMap data) throws Exception;
    
    /**
     * 증가된 카운트 조회
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    int getNewCount(DataMap data) throws Exception;

    /**
     * 상시설문 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollInfo(DataMap data) throws Exception;
    
    /**
     * 설문모듈 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getModuleList(DataMap data) throws Exception;
    
    /**
     * 설문문제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getQuestionList(DataMap data) throws Exception;
    
    /**
     * 설문내용 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSurveyModuleList(DataMap data) throws Exception;
   
    /**
     * 객관식 복수 응답 문항 validation
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getItemCnt(DataMap data) throws Exception;

    /**
     * 객관식 복수 응답 불가 문항 validation
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getItemCnt2(DataMap data) throws Exception;
    
    /**
     * 주관식 객관식 코드 출력 
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectMtCpollCode(DataMap data) throws Exception;
    
    /**
	 * 응답수 +1
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLePollCnt(DataMap data) throws Exception;

	/**
	 * 강의실 설문 응시내역
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertPollApply(DataMap data) throws Exception;
	
	/**
     * 강의실 설문 응시답안
     * 
     * @param data
     * @throws Exception
     */
    void insertPollApplyHist(DataMap data) throws Exception;

    /**
     * 설문 응시 번호 생성
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxApplyNo(DataMap data) throws Exception;
    
    /**
     * 연간일정 뷰
     * 
     * @param data
     * @return
     * @throws Exception
     */
	EduMap getAnnualScheduleView(DataMap data) throws Exception;
	
	/**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getFaqBoardList(DataMap data) throws Exception;
    
    /**
     * 댓글 등록
     * 
     * @param data
     * @throws Exception
     */
    void insertBoardReply(DataMap data) throws Exception;
    
    /**
     * 댓글 등록
     * 
     * @param data
     * @throws Exception
     */
    void changeBoardReplyStatus(DataMap data) throws Exception;
    
    /**
     * 댓글 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getListReply(DataMap data) throws Exception;
    
    
    /**
     * 댓글 등록
     * 
     * @param data
     * @throws Exception
     */
    void deleteBoardReply(DataMap data) throws Exception;
    
    
    /**
     * 댓글 수정
     * 
     * @param data
     * @throws Exception
     */
    void updateBoardReply(DataMap data) throws Exception;
    
    
    /**
     *  Q&A 해당 답변 가져오기
     * 
     * @param data
     * @throws Exception
     */
    EduMap getLmsEdBbsCmtInfo(DataMap data) throws Exception;
    
    
    /**
     *  Q&A 해당 게시물 작성자 여부 확인 
     * 
     * @param data
     * @throws Exception
     */
    EduMap bbsUserInfoChkAjax(DataMap data) throws Exception;


    /**
     * 파일 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getDownloadFile(DataMap data) throws Exception;
    
    int getEventCnt() throws Exception;
}
