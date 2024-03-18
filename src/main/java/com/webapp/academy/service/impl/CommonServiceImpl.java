package com.webapp.academy.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;
import com.webapp.academy.mapper.CommonMapper;
import com.webapp.academy.service.CommonService;
import com.webapp.common.component.EmsManager;
import com.webapp.common.vo.SendMailVO;

/**
 * Description : Common Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2021.04.09   SANGS           최초작성
 *
 */

@Service("commonService")
public class CommonServiceImpl implements CommonService {

    @Resource(name = "commonMapper")
    private CommonMapper commonMapper;
    
    @Resource(name = "emsManager")
    private EmsManager emsManager;

    /**
     * 메뉴 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> selectRootMenuList(DataMap data) throws Exception {
        return commonMapper.selectRootMenuList(data);
    }

    /**
     * 서브메뉴 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> selectSubMenuList(Map data) throws Exception {
        return commonMapper.selectSubMenuList(data);
    }

    /**
     * 현재 메뉴 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCurrentMenuInfo(DataMap data) throws Exception {
        return commonMapper.getCurrentMenuInfo(data);
    }
    
    /**
     * 현재 메뉴 정보 url로 검색
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSearchMenuInfo(DataMap data) throws Exception {
        return commonMapper.getSearchMenuInfo(data);
    }
    
    
    /**
     * 우편번호 검색 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPostcodeList(DataMap data) throws Exception {
        ParamUtil.setPagingValue(data);
        return commonMapper.getPostcodeList(data);
    }
    
    /**
     * 관할기관 찾기 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCompanyCodeList(DataMap data) throws Exception {
    	ParamUtil.setPagingValue(data);
        return commonMapper.getCompanyCodeList(data);
    }
    
    /**
     * 관할기관 찾기 리스트 수
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getCompanyCodeCount(DataMap data) throws Exception {
        return commonMapper.getCompanyCodeCount(data);
    }

    /**
     * 사용자 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUserInfo(DataMap data) throws Exception {
        return commonMapper.getUserInfo(data);
    }

    /**
     * 사용자 정보 (테스트)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getTestUserInfo(DataMap data) throws Exception {
        return commonMapper.getTestUserInfo(data);
    }

    /**
     * 공통코드 리스트
     * 
     * @param mtCode
     * @return
     * @throws Exception
     */
    public List<EduMap> getToSangsCodes(String mtCode) throws Exception {
        return commonMapper.getToSangsCodes(mtCode);
    }

    /**
     * 사용자 리스트
     * 
     * @param mtCode
     * @return
     * @throws Exception
     */
    public List<EduMap> getTestUserList(DataMap data) throws Exception {
        return commonMapper.getTestUserList(data);
    }

    /**
     * 이니시스 결제 데이타 등록
     * 
     * @param data
     * @throws Exception
     */
    public void insertPmCardData(DataMap data) throws Exception {
        commonMapper.insertPmCardData(data);
    }

    /**
     * 메일 템플릿
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEmailSetInfo(DataMap data) throws Exception {
        return commonMapper.getEmailSetInfo(data);
    }
    
   public void testSendMail(DataMap data) throws Exception {
	   
	   	DataMap mailTplMap = new DataMap();
	   	mailTplMap.putString("TPL_UID", "1");
	   	mailTplMap.putString("$SEQ1", "PWD");//비밀번호
	   	mailTplMap.putString("$SEQ2", "NAME");//이름
	   	mailTplMap.putString("$SEQ3", "ID");//아이디
	
	   	//회사메일
	   	SendMailVO mailVo = new SendMailVO();
	   	mailVo.setRecEmail("yooho30@sangs.co.kr");
	   	mailVo.setReceiver_alias("NAME");
	   	emsManager.sendMailProc(mailTplMap, mailVo);

   }
   
   /**
    * 공통코드 리스트 출력
    * 
    * @param mtCode
    * @return
    * @throws Exception
    */
   public List<EduMap> selectMtCodeSub(DataMap data) throws Exception{
	   return commonMapper.selectMtCodeSub(data);
   }
   
   /**
	 * 대출과목 리스트
	 */
   public List<Map<String, Object>> getEduLoanList(DataMap data)throws Exception {
		return commonMapper.getEduLoanList(data);
	}
   
   /**
    * 공통코드 단일조회
    * 
    * @param mtCode
    * @return
    * @throws Exception
    */
   public EduMap selectMtCodeSubInfo(DataMap data) throws Exception {
	   return commonMapper.selectMtCodeSubInfo(data);
   }
   
   /**
    * 관할기관 찾기 리스트
    *
    * @param data
    * @return
    * @throws Exception
    */
   public List<Map<String,Object>> getOfficeCodeList(DataMap data) throws Exception {
       /*data.set("rowCount", "10");
       ParamUtil.setPagingValue(data);*/
       return commonMapper.getOfficeCodeList(data);
   }

   /**
    * 관할기관 찾기 리스트 수
    *
    * @param data
    * @return
    * @throws Exception
    */
   public int getOfficeCodeCount(DataMap data) throws Exception {
       return commonMapper.getOfficeCodeCount(data);
   }
   
   /**
    * 온라인 오프라인 메뉴이름 
    *
    * @param data
    * @return
    * @throws Exception
    */
   public EduMap selectDepthName(DataMap data) throws Exception {
	   return commonMapper.selectDepthName(data);
   }
   
   public List<EduMap> selectTabMenu(DataMap data) throws Exception{
	   return commonMapper.selectTabMenu(data);
   }
   
   /**
    * 온라인 오프라인 수강카운트
    *
    * @param data
    * @return
    * @throws Exception
    */
   public int getOnEduLoanCnt(DataMap data) throws Exception{
	   return commonMapper.getOnEduLoanCnt(data);
   }
   public int getOffEduLoanCnt(DataMap data) throws Exception{
	   return commonMapper.getOffEduLoanCnt(data);
   }
   
   /** 대출상품 별 교육수료정보*/
   public void getSpLmsUserLoanEduinfo(Map<String, Object> data) throws Exception {
   	  commonMapper.getSpLmsUserLoanEduinfo(data);
   }
   
	/**
    * 권한코드 리스트
    *
    * @param data
    * @return
    * @throws Exception
    */
   public List<EduMap> getMtSubCodeList(DataMap data) throws Exception {
	   return commonMapper.getMtSubCodeList(data);
   }
   
   
	/**
    * 회원정보 테이블에서 생년월일 / 이름 / 휴대폰으로 개인정보 찾기 
    *
    * @param data
    * @return
    * @throws Exception
    */
   public EduMap checkMberInfo(DataMap data) throws Exception {
	   return commonMapper.checkMberInfo(data);
   }
   
   public EduMap check(DataMap data) throws Exception {
	   return commonMapper.check(data);
   }
   
   public int checkPw(DataMap data) throws Exception {
	   return commonMapper.checkPw(data);
   }
   
   public void changePw(DataMap data) throws Exception {
	   commonMapper.changePw(data);
   }

    public void insertSmsSend(EduMap data) throws Exception {
        
            EduMap smsInfo = commonMapper.selectMaxNextval(data);
            
            data.put("TMP_TRAN_NEXTVAL", smsInfo.get("TMP_TRAN_NEXTVAL"));
            data.put("V_TRAN_DAY", smsInfo.get("V_TRAN_DAY"));
            data.put("TMP_TRAN_DTM", smsInfo.get("TMP_TRAN_DTM"));
            data.put("V_TRAN_TIME", smsInfo.get("V_TRAN_TIME"));
            
            commonMapper.insertCdExSmslog(data);
            commonMapper.insertEmTran(data);
            
    }
    
    
	/**
	 * 실명인증로그 - KCB_SEQ 최대값 조회
	 * @param data
     * @return
     * @throws Exception
	 */
	public int getMaxKcbSeq(DataMap data) throws Exception {
		return commonMapper.getMaxKcbSeq(data);
	}
	
	
	/**
	 * 실명인증로그 - insert
	 * @param data
     * @return
     * @throws Exception
	 */
	public void insertRealNameAuth(ArrayList data, DataMap rMap) throws Exception {
		
		EduMap authInfo = new EduMap();
		
		
		String authGubun = rMap.getString("authGubun");
		
		// 핸드폰 인증일 경우,
		if("PHONE".equals(authGubun)) {
			
			authInfo.put("authGubun", authGubun);
			authInfo.put("DI", data.get(4));
			authInfo.put("rstCd", data.get(0));
			
		// 아이핀 인증일 경우,
		} else if("IPIN".equals(authGubun)) {
			
			authInfo.put("authGubun", authGubun);
			authInfo.put("CI", data.get(4));
			authInfo.put("rstCd", rMap.getString("retcode"));

		// 공인인증서일경우.
		} else {
			authInfo.put("authGubun", "CERT");
			authInfo.put("DI", rMap.getString("di"));
			authInfo.put("rstCd", rMap.getString("rst_cd"));
		}
		
		commonMapper.insertRealNameAuth(authInfo);
		
	}
	
	/**
	 * 결제 exception hist insert
	 * @param data
     * @return
     * @throws Exception
	 */
	public void insertPayExceptionHist(DataMap data) throws Exception {
		commonMapper.insertPayExceptionHist(data);
	}
	
	/**
	 * 결제 취소 완료 후 exception hist delete
	 * @param data
     * @return
     * @throws Exception
	 */
	public void deletePayExceptionHist(DataMap data) throws Exception {
		commonMapper.deletePayExceptionHist(data);
	}

	@Override
	public String getMbrLoginLog(DataMap rMap) throws Exception {
		// TODO Auto-generated method stub
		return commonMapper.getMbrLoginLog(rMap);
	}
	
	
    
}