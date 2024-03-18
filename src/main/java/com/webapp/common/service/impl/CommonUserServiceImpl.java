package com.webapp.common.service.impl;

import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.SangsCryptUtil;
import com.webapp.common.mapper.CommonUserMapper;
import com.webapp.common.service.CommonUserService;


@Service("commonUserService")
public class CommonUserServiceImpl implements CommonUserService {

	private static Logger      log         = LogManager.getLogger(UserSessionManager.class);
	 
    @Resource(name = "commonUserMapper")
    private CommonUserMapper commonUserMapper;

    /**
     * 회원정보(통합회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    public EduMap getUserInfo(int userNo) throws Exception {
        return commonUserMapper.getUserInfo(userNo);
    }
    
    /**
     * 회원정보(통합회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    public EduMap searchMberEmail(DataMap data) throws Exception {
        return commonUserMapper.searchMberEmail(data);
    }

    /**
     * 회원정보(LMS회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    public EduMap getUserLmsInfo(DataMap data) throws Exception {
        return commonUserMapper.getUserLmsInfo(data);
    }

    /**
     * 로그인 사용자 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLoginUserInfo(DataMap data) throws Exception {
        return commonUserMapper.getLoginUserInfo(data);
    }
    /**
     * 로그인 사용자 정보 SNS
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUserInfoBySNSId(DataMap data) throws Exception {
        return commonUserMapper.getUserInfoBySNSId(data);
    }
    /**
     * 로그인 사용자 정보 중복체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUserInfoDuplByEmail(DataMap data) throws Exception {
        return commonUserMapper.getUserInfoDuplByEmail(data);
    }
    
    /**
     * 공통 > 개인정보조회이력관리 
     * @param req
     * @param sysGb
     * @param transGb
     * @param summary
     * @param progNm
     * @throws Exception
     */
    public void insertMbrTransLog(HttpServletRequest req,
    		String sysGb,
    		String transGb,
    		String summary,
    		String progNm
    		) throws Exception {
    	
    	DataMap data = new DataMap();
		UserSessionVO userVo = UserSessionManager.getUserSessionVO(req);

		try {
			
			data.setString("sysGb", sysGb);
			data.setInt("transUserNo", userVo.getUserNo());
			data.setString("transUserId", userVo.getUserId());
			data.setString("transUserName", userVo.getUserName());
			data.setString("transIp", req.getRemoteAddr());
			data.setString("transGb", transGb);
			data.setString("summary", summary + "\n>세부정보 :  "+getRequesParameters(req)); 
			data.setString("progId", req.getRequestURI());
			data.setString("progNm", progNm);
			
			commonUserMapper.insertMbrTransLog(data);
			
		} catch (RuntimeException e) {
        	 
        } catch (Exception ex){
			 
		} 
    }
    
    /**
     * 공통 > 로그인이력관리
     * @param req
     * @param sysGb
     * @param transGb
     * @param summary
     * @throws Exception
     */
    public void insertMbrLoginLog(
    		HttpServletRequest req,
    		String sysGb,
    		String transGb,
    		String summary
    		) throws Exception {
    	
    	DataMap data = new DataMap();
		UserSessionVO userVo = UserSessionManager.getUserSessionVO(req);

		try {
			
			data.setString("sysGb", sysGb);
			data.setInt("transUserNo", userVo.getUserNo());
			data.setString("transUserId", userVo.getUserId());
			data.setString("transUserName", userVo.getUserName());
			data.setString("transIp", req.getRemoteAddr());
			data.setString("transGb", transGb);
			data.setString("summary", summary + "\n>세부정보 :  "+getRequesParameters(req)); 
			
			commonUserMapper.insertMbrLoginLog(data);
			
		} catch (RuntimeException e) {
        	 
        } catch (Exception ex){
			 
		}
    	
    }
    
    
    /**
     * 공통 > 로그인 5회 실패 > 로그인 제한
     * @param req
     * @param data
     * @throws Exception
     */
    public void updateLoginFailCntInfo(DataMap data) throws Exception {

		try {
			// 사용자테이블 로그인 실패 횟수 업데이트
			commonUserMapper.updateLoginFailCntInfo(data);
			// 회원 승인 대기로 변경
			commonUserMapper.updateRegAtInfo(data);
			
		} catch (Exception ex){
			 
		}
    	
    }
    
    /**
     * 공통 > 로그인 성공 (실패횟수 0으로 초기화)
     * @param req
     * @param data
     * @throws Exception
     */
    public void updateLoginSuccessInfo(DataMap data) throws Exception {

		try {
			commonUserMapper.updateLoginSuccessInfo(data);
			
		} catch (RuntimeException e) {
        	 
        } catch (Exception ex){
			 
		}
    	
    }
    /**
     * 공통 > 로그인 실패횟수
     * @param req
     * @param data
     * @throws Exception
     */
    public EduMap selectLoginFailCntInfo(DataMap data) throws Exception {
        return commonUserMapper.selectLoginFailCntInfo(data);
    }
    
    /**
	 *  request 파라메터 스트링변환
	 * @param dataMap
	 * @return
	 */
	private String getRequesParameters(HttpServletRequest req) {
		
		String result = "";
		try {
			
			@SuppressWarnings("rawtypes")
			Enumeration enums = req.getParameterNames();
			String key = "";
			String value[] = null;
			
			while (enums.hasMoreElements()){
				key = (String)enums.nextElement();
				value = req.getParameterValues(key);

				for(int i=0; i<value.length; i++){
					
					if (result.getBytes().length < 4000) {
						if (result.getBytes().length > 500) {
							result += key +"=<LONG DATA>&";
						} else {
							result += key +"="+value[i]+"&";
						}
					}
					
				}
			}

		} catch(Exception ex){ log.debug(ex.getMessage());
			 
		}
		return result;
	}
	
	/**
     * 로그인 세션아이디 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLoginSessionInfo(DataMap data) throws Exception {
        return commonUserMapper.getLoginSessionInfo(data);
    }
    
    /**
     * 회원전체
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLoginUserList(DataMap data) throws Exception {
        return commonUserMapper.getLoginUserList(data);
    }
    /**
     * 회원전체
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCuserNo(DataMap data) throws Exception {
        return commonUserMapper.getCuserNo(data);
    }
    
    /**
     * 설문 참여 이력 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPollHist(DataMap data) throws Exception {
        return commonUserMapper.getPollHist(data);
    }
    
    /**
     * 세션아이디저장
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public void updateJsessionId(DataMap data) throws Exception{
    	commonUserMapper.updateJsessionId(data);
    }
    
    /**
     * 세션아이디초기화
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteJsessionId(DataMap data) throws Exception{
    	commonUserMapper.deleteJsessionId(data);
    }
    
    /**
     * 세션아이디초기화
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public String getSessionId2(String loginId) throws Exception{
    	return commonUserMapper.getSessionId(loginId);
    }
    
    /**
     * 기존회원 정보 재설정
     * 
     * @param data
     * @throws Exception
     */
    public void updateOldMemberInfo(DataMap data) throws Exception {
    	data.setString("pwd", SangsCryptUtil.crypt(data.getString("pwd")));
    	commonUserMapper.updateOldMemberInfo(data);
    }
    
    /**
     * 회원정보 수정
     * 
     * @param data
     * @throws Exception
     */
    public void updateMemberInfo(DataMap data) throws Exception {
    	commonUserMapper.updateMemberInfo(data);
    }
    
    /**
     * 비밀번호 변경일자 업데이트
     * 
     * @param data
     * @throws Exception
     */
    public void updatePwdUpdDt(DataMap data) throws Exception {
    	commonUserMapper.updatePwdUpdDt(data);
    }
    
    /**
     * 회원정보 탈퇴 처리
     * 
     * @param data
     * @throws Exception
     */
    public void updateMemberSecsn(DataMap data) throws Exception {
    	commonUserMapper.updateMemberSecsn(data);
    }
    
    /**
     * 회원정보 탈퇴 처리
     * 
     * @param data
     * @throws Exception
     */
    public void deleteMemberSecsnSNS(Integer userNo) throws Exception {
    	commonUserMapper.deleteMemberSecsnSNS(userNo);
    }
    
    /**
     * 회원 로그인 타입 정보
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    public String getUserLoginType(DataMap data) throws Exception{
    	return commonUserMapper.getUserLoginType(data);
    }
}
