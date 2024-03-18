package com.webapp.academy.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("commonMapper")
public interface CommonMapper {

    /**
     * 메뉴 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectRootMenuList(DataMap data) throws Exception;

    /**
     * 서브메뉴 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectSubMenuList(Map data) throws Exception;

    /**
     * 현재 메뉴 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCurrentMenuInfo(DataMap data) throws Exception;

    /**
     * 현재 메뉴 정보 url로 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSearchMenuInfo(DataMap data) throws Exception;

    /**
     * 우편번호 검색 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPostcodeList(DataMap data) throws Exception;
    
    /**
     * 관할기관 찾기 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCompanyCodeList(DataMap data) throws Exception;
    
    /**
     * 관할기관 찾기 리스트 수
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getCompanyCodeCount(DataMap data) throws Exception;
    
    /**
     * 사용자 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUserInfo(DataMap data) throws Exception;

    /**
     * 사용자 정보 (테스트)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getTestUserInfo(DataMap data) throws Exception;

    /**
     * 공통코드 리스트
     *
     * @param mtCode
     * @return
     * @throws Exception
     */
    List<EduMap> getToSangsCodes(String mtCode) throws Exception;

    /**
     * 사용자 리스트
     *
     * @param mtCode
     * @return
     * @throws Exception
     */
    List<EduMap> getTestUserList(DataMap data) throws Exception;

    /**
     * 이니시스 결제 데이타 등록
     *
     * @param data
     * @throws Exception
     */
    void insertPmCardData(DataMap data) throws Exception;

    /**
     * 메일 템플릿 사용여부 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEmailTempUseYn(DataMap data) throws Exception;


    /**
     * 메일 템플릿
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEmailSetInfo(DataMap data) throws Exception;

    /**
     * 공통코드 리스트 출력
     *
     * @param mtCode
     * @return
     * @throws Exception
     */
    List<EduMap> selectMtCodeSub(DataMap data) throws Exception;

    /**
	 * 대출과목 리스트
	 */
   public List<Map<String, Object>> getEduLoanList(DataMap data)throws Exception ;
    
    /**
     * 공통코드 단일 조회
     *
     * @param mtCode
     * @return
     * @throws Exception
     */
    EduMap selectMtCodeSubInfo(DataMap data) throws Exception;
    
    /**
     * 관할기관 찾기 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> getOfficeCodeList(DataMap data) throws Exception;

    /**
     * 관할기관 찾기 리스트 수
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getOfficeCodeCount(DataMap data) throws Exception;
    
    EduMap selectDepthName(DataMap data) throws Exception;
	
    List<EduMap> selectTabMenu(DataMap data) throws Exception;
    
    /**
     * 온라인 오프라인 수강카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getOnEduLoanCnt(DataMap data) throws Exception;
    int getOffEduLoanCnt(DataMap data) throws Exception;
    
    /** 대출상품 별 교육수료정보*/
    void getSpLmsUserLoanEduinfo(Map<String, Object> data)throws Exception;

    
    
	/**
     * 권한코드 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMtSubCodeList(DataMap data) throws Exception;
    
	/**
     * 기존회원 정보 재설정
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateOldMemberInfo(DataMap data) throws Exception;
    
    
	/**
     * 회원정보 테이블에서 생년월일 / 이름 / 휴대폰으로 개인정보 찾기 
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap checkMberInfo(DataMap data) throws Exception;
    EduMap check(DataMap data) throws Exception;
    int checkPw(DataMap data) throws Exception;
    void changePw(DataMap data) throws Exception;

    void insertCdExSmslog(EduMap data) throws Exception;

    void insertEmTran(EduMap data) throws Exception;

    EduMap selectMaxNextval(EduMap data) throws Exception;
    
    
	/**
	 * 실명인증로그 - KCB_SEQ 최대값 조회
	 * @param data
     * @return
     * @throws Exception
	 */
	int getMaxKcbSeq(DataMap data) throws Exception;
	
	
	/**
	 * 실명인증로그 - insert
	 * @param data
     * @return
     * @throws Exception
	 */
	void insertRealNameAuth(EduMap data) throws Exception;

	/**
	 * 결제 exception hist insert
	 * @param data
     * @return
     * @throws Exception
	 */
	void insertPayExceptionHist(DataMap data) throws Exception;

	/**
	 * 결제 취소 완료 후 exception hist delete
	 * @param data
     * @return
     * @throws Exception
	 */
	void deletePayExceptionHist(DataMap data) throws Exception;

	String getMbrLoginLog(DataMap rMap) throws Exception;
    
}
