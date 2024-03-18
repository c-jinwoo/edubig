package com.webapp.ccedu.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.ibm.icu.util.Calendar;
import com.sangs.session.SessionManager;
import com.sangs.session.UserSessionManager;
import com.sangs.support.ControllerParamManager;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.NxKeyUtil;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsCryptUtil;
import com.sangs.util.SangsUtil;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.MyClassService;
import com.webapp.academy.service.UserService;
import com.webapp.ccedu.service.OnlinePaymentService;
import com.webapp.common.service.CommonEmsService;
import com.webapp.common.service.CommonUserService;

/**
 * Description : 회원 관련 컨트롤러
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2020.09.29	CSLAB		최초작성
 *
 */

@Controller
public class MemberController {
	
    private Logger  log = LogManager.getLogger(MemberController.class);

    @Resource(name = "userService")
    private UserService       userService;

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "commonEmsService")
    private CommonEmsService commonEmsService;

    @Resource(name = "myClassService")
    private MyClassService myClassService;

    @Resource(name = "onlinePaymentService")
    private OnlinePaymentService onlinePaymentService; 
    
    /**
     * 로그인 폼
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그인 폼
    @RequestMapping(value = "/user/login.do")
    private String login(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        try{
            if(!("").equals(rMap.getString("SES_USERID"))){
                req.setAttribute("msg", "이미 로그인 상태 입니다.");
                req.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
            }
            req.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/main/main.do") );            
            req.setAttribute("REQUEST_DATA", rMap);
        }
        catch(Exception e){
	       throw new FrontException(e);
	    }
        return "/login/member_login";
    }
    
    /**
     * 로그인 실행
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그인 실행
    @RequestMapping(value = "/user/loginExec.do")
    private String loginExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        try{
            String userId = "";     
            String password = "";   
            String isSNSlogin = rMap.getString("isSNS");
            
            if(isSNSlogin.equals("Y")){	
            	EduMap snsMap = commonUserService.getUserInfoBySNSId(rMap);
            	
    			if(snsMap == null){
    	            req.setAttribute("msg", "등록된 SNS계정이 없습니다.");
    	            req.setAttribute("url", "/user/login.do");
                    return "forward:/common/msgForward.do";
    			}        
    			userId = snsMap.getString("UNITY_ID");
            	rMap.setString("userId",userId);
            }
            else if(isSNSlogin.equals("N")){
                userId = rMap.getString("userId");   
                password = rMap.getString("pwd");             
                rMap.setString("pwd",  password);            	
            }
            else{
	            req.setAttribute("msg", "잘못된 접근입니다.");
	            req.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            }
            
            Boolean isVerified = false;
            EduMap map = commonUserService.getLoginUserInfo(rMap);
                        
            if(map != null){
                rMap.setString("regUserId", userId);
                rMap.setInt("comNo", map.getInt("COMNO"));
            }     
            
            if(isSNSlogin.equals("Y")){
            	isVerified  = (map != null) ? true : false;
            }
            else if(isSNSlogin.equals("N")){
            	isVerified  = (map != null && SangsCryptUtil.isMatch(password, map.getString("PWD"))) ? true : false;
            }
            
            if(isVerified){            	
            	int jsssionChk = 0;
                Cookie[] cookies = req.getCookies();
    			for (int i = 0; i < cookies.length; i++) {
    				cookies[i].getName(); 
    				cookies[i].getValue();
    				
    				if(cookies[i].getName().equals("JSESSIONID")){
    					jsssionChk=i;
    				}
    			
    			}
    			String JSESSIONID = cookies[jsssionChk].getValue();
    			rMap.putString("jessionId", JSESSIONID);
    			commonUserService.updateJsessionId(rMap);
    			    			
                //세션에 저장.
                UserSessionManager.getUserSessionInsert(req, commonUserService, map.getInt("USERNO"));
                // 로그인정보등록(중복로그인처리관련)
                SessionManager sessionManager = SessionManager.getInstance();
                sessionManager.setLoginSessionFront(req, userId);
                req.setAttribute("USERNAME", map.getString("USERNAME"));
                
                /** [공통] 로그인이력 등록 **/
                commonUserService.insertMbrLoginLog(
                        req,
                        SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"),
                        SangsProperties.getProperty("Globals.MBR_LOGIN_GB_SUCESS"),
                        "로그인실행"
                );                
                //로그인 성공 시 로그인 실패횟수는 0으로 초기화
                commonUserService.updateLoginSuccessInfo(rMap);
                
                req.setAttribute("url", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/main/main.do"));            
            }
            else{    	
		        rMap.setString("msg", "아이디 또는 비밀번호를 다시 확인하세요.");
				
		        /** [공통] 로그인이력 등록 **/
		        commonUserService.insertMbrLoginLog(
		                req,
		                SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"),
		                SangsProperties.getProperty("Globals.MBR_LOGIN_GB_FAIL"),
		                "로그인실패"
		        );
		        req.setAttribute("msg", rMap.getString("msg"));
		        req.setAttribute("url", "/user/login.do" );
		    }
        }
        catch(Exception e){
        	log.debug(e.getMessage());             
            throw new FrontException(e);
        }
        req.setAttribute("paramInputs", ControllerParamManager.getParamHtmlFormConvert(rMap));
        req.setAttribute("REQUEST_DATA", rMap);

        return "forward:/common/msgForward.do";
    }

    /**
     * 로그아웃
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그아웃
    @RequestMapping(value = "/user/logout.do")
    private String logout(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	commonUserService.deleteJsessionId(rMap);
            /** [공통] 로그인이력 등록 **/
            commonUserService.insertMbrLoginLog(
                    req,
                    SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"),
                    SangsProperties.getProperty("Globals.MBR_LOGIN_GB_LOGOUT"),
                    "로그아웃"
            );
        } catch (Exception e){ throw new FrontException(e);}

        /** 세션 정보를 삭제한다. */
        UserSessionManager.deleteUserSessionVO(req);

        return "redirect:/";
    }
    

    /**
     * 메시지를 alert 뿌리고 url에 해당하는 페이지로 이동한다.
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/common/msgForward.do")
    public String msgForward(HttpServletRequest req, DataMap rMap) throws FrontException {

    	req.setAttribute("paramInputs", (String)req.getAttribute("paramInputs"));
        req.setAttribute("msg", (String)req.getAttribute("msg"));
        req.setAttribute("url", (String)req.getAttribute("url"));
        return "/common/msg_forward";
    }
    
    /**
     * 회원정보 > 결제내역
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 회원정보 > 결제내역
    @RequestMapping(value = "/user/payList.do")
    public String payList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        try {
            if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {	// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            } 
            else{
                request.setAttribute("REQUEST_DATA", rMap);
                String code = rMap.getString("search_code");
                
                if(code == "" || code == null){
                	code = "TT0001";
                }
                
                rMap.putString("code", code);   
                request.setAttribute("code", code);                      
            	request.setAttribute("result", onlinePaymentService.selectPaymentList(rMap));
            }
        }
        catch(Exception e){
        	log.debug(e.getMessage());
            throw new Exception(e);
        }        
        return "/member/pay_list";
    }
    
    /**
     * 회원정보 > 본인확인
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 회원정보수정 > 본인확인
    @RequestMapping(value = "/user/modiCheck.do")
    private String modiCheck(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        try {
            if(("").equals(rMap.getString("SES_USERID"))){
                rMap.putString("$returnUrl", "/user/modiCheck.do");
                
                DataMap removeDataMap = new DataMap();
        	    removeDataMap = SangsUtil.dataMapRemoveScriptTag(rMap);
                req.setAttribute("paramInputs", ControllerParamManager.getParamHtmlFormConvert(removeDataMap));
                
                req.setAttribute("msg", "로그인 후 이용가능합니다.");
                req.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            }
            
        	// SNS 가입계정은 패스
            String snsJoinType = commonUserService.getLoginSessionInfo(rMap).getString("SNS_LOGIN_TYPE");
        	if(snsJoinType.equals("KAKAO") || snsJoinType.equals("NAVER")){
                return "redirect:/user/modiForm.do";        		
        	}
        	
            rMap.setString("userId", rMap.getString("SES_USERID"));
            req.setAttribute("REQUEST_DATA", rMap);

        }
        catch(Exception e){
	       throw new FrontException(e);
	    }
        return "/member/modi_check";
    }    
    
    /**
     * 회원정보 > 등록
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 등록
    @RequestMapping(value = "/user/modiForm.do")
    public String modiForm(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{       
        try{ 
            if (("").equals(rMap.getString("SES_USERID"))) {
            	req.setAttribute("msg", "로그인 후 이용가능합니다.");
            	req.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            }
            
            String password = rMap.getString("pwd");            
        	rMap.setString("userId",  rMap.getString("SES_USERID"));
        	rMap.setString("pwd",  password);        	

            Boolean isVerified = false;

            String snsJoinType = commonUserService.getLoginSessionInfo(rMap).getString("SNS_LOGIN_TYPE");  
            EduMap map = commonUserService.getLoginUserInfo(rMap);
            
            if(snsJoinType.equals("KAKAO") || snsJoinType.equals("NAVER")){
            	isVerified  = true;
            }  
            else{
            	if(map != null && SangsCryptUtil.isMatch(password, map.getString("PWD"))){
            		isVerified = true;
            	}
            }
            if(isVerified){
        		req.setAttribute("uMap", map);
            	
                //	이메일 도메인 목록
                rMap.setString("mtCode","MA");
                req.setAttribute("mailDomainCodeList", commonService.selectMtCodeSub(rMap));
                
                //	직업 목록
                rMap.setString("mtCode","JO");
                req.setAttribute("jobKndCodeList", commonService.selectMtCodeSub(rMap));
                
                //	가입경로 목록
                rMap.setString("mtCode","PA");
                req.setAttribute("userPathCodeList", commonService.selectMtCodeSub(rMap));

    	        rMap.setInt("nowYear", Calendar.getInstance().get(Calendar.YEAR));	 
    	        
                // SNS가입 여부
                if(snsJoinType.equals("KAKAO") || snsJoinType.equals("NAVER")){
                	req.setAttribute("isSNS","Y");
                }
                else{
                	req.setAttribute("isSNS","N");
                	
                    // SNS연동 여부 체크
                    rMap.putString("sns_type","KAKAO");
                    if(userService.getUserInfoDuplBySNSType(rMap) == null){
                    	req.setAttribute("kakaoYN","N");
                    }
                    else{
                    	req.setAttribute("kakaoYN","Y");                	
                    }
                    
                    rMap.putString("sns_type","NAVER");
                    if(userService.getUserInfoDuplBySNSType(rMap) == null){
                    	req.setAttribute("naverYN","N");
                    }
                    else{
                    	req.setAttribute("naverYN","Y");                	
                    }                	
                }
                
                req.setAttribute("REQUEST_DATA", rMap);
        	}
        	else{
            	req.setAttribute("msg", "회원정보가 일치하지 않습니다.");
            	req.setAttribute("url", "/user/modiCheck.do");
                return "forward:/common/msgForward.do";
        	}        
        } 
        catch (Exception e) {
            throw new FrontException(e);
        }        
        return "/member/modi_form";
    }
    /**
     * 연동
     * @param
     * @return
     * @throws IOException 
     * @throws Exception
     */
    // TODO :  SNS 연동
    @RequestMapping(value = "/user/insertSNSstatus.do")
    public void insertSNSstatus(HttpServletRequest request, HttpServletResponse response, DataMap rMap) throws FrontException, IOException{    	
    	 response.setContentType("text/html; charset=utf-8");
		 PrintWriter out = response.getWriter();
	     Gson gson = new Gson();
	     String json = null;
	     
	     Map<String,Object> resultMap = new HashMap<String,Object>();	     
	     try{       
	    	 if(userService.getUserInfoDuplBySNSId(rMap) != null){
	    		 resultMap.put("result", "FAIL"); 
	    	 }
	    	 else{
		    	 userService.insertSNSstatus(rMap);
		    	 resultMap.put("result", "SUCCESS");  
	    	 }
	         json = gson.toJson(resultMap);  
	    } 
	     catch (Exception ex) {
	    	json = gson.toJson("FAIL");
	    }
	     
	    out.print(json);
	    out.flush();
	    out.close();    	
    } 
    /**
     * 연동해제
     * @param
     * @return
     * @throws IOException 
     * @throws Exception
     */
    // TODO :  SNS 연동해제
    @RequestMapping(value = "/user/deleteSNSstatus.do")
    public void deleteSNSstatus(HttpServletRequest request, HttpServletResponse response, DataMap rMap) throws FrontException, IOException{    	
    	 response.setContentType("text/html; charset=utf-8");
		 PrintWriter out = response.getWriter();
	     Gson gson = new Gson();
	     String json = null;
	     
	     Map<String,Object> resultMap = new HashMap<String,Object>();	     
	     try{       
	    	 if(userService.getUserInfoDuplBySNSType(rMap) == null){
	    		 resultMap.put("result", "FAIL"); 
	    	 }
	    	 else{
	    		 userService.deleteSNSstatus(rMap);
	    		 resultMap.put("result", "SUCCESS"); 
	    	 }
	         json = gson.toJson(resultMap);  
	    } 
	     catch (Exception ex) {
	    	json = gson.toJson("FAIL");
	    }
	     
	    out.print(json);
	    out.flush();
	    out.close();    	
    }     
    /**
     * 회원정보 > 수정
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원정보수정 > 회원정보 수정
    @RequestMapping(value = "/user/modiExec.do")
    public String modiExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
    	if(("").equals(rMap.getString("SES_USERID"))){
        	req.setAttribute("msg", "로그인 후 이용가능합니다.");
        	req.setAttribute("url", "/user/login.do");
            return "forward:/common/msgForward.do";
        }       
        try{            
            rMap.setString("userId",  rMap.getString("SES_USERID")); 
            
        	if(rMap.getString("isSNS").equals("N")){
        		String password = SangsCryptUtil.crypt(rMap.getString("userPassword"));  
        		rMap.setString("pwd", password);
        	}
        	
        	//수정
        	commonUserService.updateMemberInfo(rMap);
        	
            req.setAttribute("REQUEST_DATA", rMap);            
            req.setAttribute("msg", "회원정보가 수정되었습니다.");
            req.setAttribute("url", "/main/main.do");        
        } 
        catch (Exception e){
            throw new FrontException(e);
        }        
        return "forward:/common/msgForward.do";       
    }
    
    /**
     * 회원정보 > 탈퇴
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 회원정보수정 > 회원탈퇴
    @RequestMapping(value = "/user/secsnForm.do")
    private String secsnForm(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        if(("").equals(rMap.getString("SES_USERID"))) {
            req.setAttribute("msg", "로그인 후 이용가능합니다.");
            req.setAttribute("url", "/user/login.do");
            return "forward:/common/msgForward.do";
        }

        try{
            rMap.setString("userId", rMap.getString("SES_USERID"));
            
            //	탈퇴 사유 목록
            rMap.setString("mtCode","PC");
            req.setAttribute("secsnCodeList", commonService.selectMtCodeSub(rMap));
            
            req.setAttribute("REQUEST_DATA", rMap);

        }
        catch(Exception e){
	       throw new FrontException(e);
	    }
        return "/member/secsn_form";
    }
    
    /**
     * 회원정보수정 > 탈퇴실행
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 회원정보수정 > 회원탈퇴 실행
    @RequestMapping(value = "/user/secsnExec.do")
    private String secsnExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException{
        if(("").equals(rMap.getString("SES_USERID"))) {
            req.setAttribute("msg", "로그인 후 이용가능합니다.");
            req.setAttribute("url", "/user/login.do");
            return "forward:/common/msgForward.do";
        }        
        if(!(rMap.getString("userId")).equals(rMap.getString("SES_USERID"))) {
            req.setAttribute("msg", "회원정보가 일치하지 않습니다.");
            req.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }
        
        try{ 
        	commonUserService.deleteJsessionId(rMap);
        	commonUserService.deleteMemberSecsnSNS(rMap.getInt("SES_USERNO"));
            UserSessionManager.deleteUserSessionVO(req);

        	rMap.putString("secsnID",rMap.getString("SES_USERID")+"_DEL_"+Integer.toString(rMap.getInt("SES_USERNO")));
        	
    		commonUserService.updateMemberSecsn(rMap);    
    		
    		req.setAttribute("msg", "탈퇴가 완료 되었습니다");        	
        	req.setAttribute("url", "/main/main.do");
            req.setAttribute("REQUEST_DATA", rMap);
        }
        catch (Exception e) {
	       throw new FrontException(e);
	    }
        return "forward:/common/msgForward.do";
    }
    
    /**
     * 회원가입 > 회원구분
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 회원구분
    @RequestMapping(value = "/user/memberJoinType.do")
    public String memberJoinType(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }
        
        request.setAttribute("REQUEST_DATA", rMap);

        return "/member/member_join_type";
    }
    
    /**
     * 회원가입 > 이메일인증
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 이메일인증
    @RequestMapping(value = "/user/memberJoinStep01.do")
    public String memberJoinStep01(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        // 로그인 시
    	if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }          
        // 강제접근 시 
        if(rMap.getString("snsType").equals("") || rMap.getString("snsType") == null){
            request.setAttribute("msg", "잘못된 접근입니다.");
            request.setAttribute("url", "/user/memberJoinType.do");
            return "forward:/common/msgForward.do";        	
        }
        // 이메일가입 아닐 시 
        if(!rMap.getString("snsType").equals("JM0001")){
            request.setAttribute("msg", "잘못된 접근입니다.");
            request.setAttribute("url", "/user/memberJoinType.do");
            return "forward:/common/msgForward.do";        	
        }

		try{
	        rMap.setString("mtCode","MA");
			request.setAttribute("mailDomainCodeList", commonService.selectMtCodeSub(rMap));
		} 
		catch(Exception e){
		}
		
        request.setAttribute("REQUEST_DATA", rMap);

        return "/member/member_join_step01";
    }
    
    /**
     * 회원가입 > 등록
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 등록
    @RequestMapping(value = "/user/memberJoinStep02.do")
    public String memberJoinStep02(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{        
        try{
        	// 로그인 시
            if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
                request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
            }            
            // 강제접근 시 
            if(rMap.getString("snsType").equals("") || rMap.getString("snsType") == null){
                request.setAttribute("msg", "잘못된 접근입니다.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";        	
            }
        	// 이메일이 누락됐다면
            if(rMap.getString("email").equals("") || rMap.getString("email") == null){
                request.setAttribute("msg", "이메일이 누락되었습니다.");
                request.setAttribute("url", "/user/memberJoinType.do");
                return "forward:/common/msgForward.do";        	
            }
			// 사용중인 이메일 주소일 경우
			if(commonUserService.getUserInfoDuplByEmail(rMap) != null){
    			request.setAttribute("msg", "사용 중인 이메일주소입니다.");
    			request.setAttribute("url", "/user/login.do");    			
    			return "forward:/common/msgForward.do";       				
			}
            
            if(rMap.getString("snsType").equals("JM0001")){
                // 이메일 인증 안됐다면
            	if(!rMap.getString("emailDupCheck").equals("Y")){
                    request.setAttribute("msg", "이메일 인증을 해주세요.");
                    request.setAttribute("url", "/user/memberJoinStep01.do?snsType=JM0001");
                    return "forward:/common/msgForward.do";     
            	}
            }
            else if(rMap.getString("snsType").equals("JM0002") || rMap.getString("snsType").equals("JM0003")){
            	// 존재하는 SNS 계정일 경우
    			if(commonUserService.getUserInfoBySNSId(rMap) != null){ 
        			request.setAttribute("msg", "가입 내역이 존재합니다");
        			request.setAttribute("url", "/user/login.do");    			
        			return "forward:/common/msgForward.do";   
    			}  
            }
    		
	        rMap.setInt("nowYear", Calendar.getInstance().get(Calendar.YEAR));	        	        
	        request.setAttribute("REQUEST_DATA", rMap);
		}
        catch(Exception e){
		}    

        return "/member/member_join_step02";
    }
        
    /**
     * 회원가입 > 회원정보 등록 폼 실행 (EXEC)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 회원정보 등록 폼 실행
    @RequestMapping(value = "/user/memberJoinExec.do")
    public String memberJoinExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try{ 
        	// 로그인 시
        	if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
                request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
            } 
        	// 강제접근 체크
    		if(rMap.getString("email") == null || rMap.getString("email") == ""){
    			request.setAttribute("msg", "잘못된 접근입니다.");
    			request.setAttribute("url", "/user/login.do");    			
    			return "forward:/common/msgForward.do";
    		}
            // 중복확인    		
    		String snsType = "";
    		if(rMap.getString("snsType").equals("JM0001")){
    			snsType = "EMAIL";
    		}
    		else if(rMap.getString("snsType").equals("JM0002")){
    			snsType = "KAKAO";
    		}
    		else if(rMap.getString("snsType").equals("JM0003")){
    			snsType = "NAVER";
    		}
            if(snsType.equals("EMAIL")){
            	if(commonUserService.getUserInfoDuplByEmail(rMap) != null){
        			request.setAttribute("msg", "가입 내역이 존재합니다");
        			request.setAttribute("url", "/user/login.do");    
                    return "forward:/common/msgForward.do";     
            	}

                String password = SangsCryptUtil.crypt(rMap.getString("userPassword"));
                rMap.setString("userPassword", password);
            }
            else if(snsType.equals("KAKAO") || snsType.equals("NAVER")){
    			if(commonUserService.getUserInfoBySNSId(rMap) != null){ 
        			request.setAttribute("msg", "가입 내역이 존재합니다");
        			request.setAttribute("url", "/user/login.do");    			
        			return "forward:/common/msgForward.do";   
    			}       	
            }
    		    	
    		rMap.setString("snsType",snsType);
            rMap.setString("regAt", "Y");   
            rMap.setString("brthdy",rMap.getString("brthdy").replace(" ", ""));            
        	
            userService.insertUnityMber(rMap);
            
            if(snsType.equals("KAKAO") || snsType.equals("NAVER")){
            	Integer userNo = userService.getMberNo(rMap.getString("email"));
            	rMap.putInt("userNo", userNo);
	            userService.insertUnityMberSNS(rMap);	            	
            }
            	
            request.setAttribute("REQUEST_DATA", rMap);            
        } 
        catch (Exception e) {
			log.error(e.getMessage());
			throw new FrontException(e);
		}
        return "redirect:/user/memberJoinStep03.do";
    }
    
    
    /**
     * 회원가입 > 회원가입 완료
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입  완료
    @RequestMapping(value = "/user/memberJoinStep03.do")
    public String memberJoinStep04(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }        
        return  "/member/member_join_step03";
    }
    
    /**
     * 회원 가입 아이디 중복체크 (ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/user/searchId.do")
    public void searchId(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {

            request.setAttribute("userId", userService.searchMberId(rMap));

            int checkStat = 0;

            //중복값 존재
            if (request.getAttribute("userId") != null) {
                checkStat = 1;

                //검색결과 없음
            } else {
                checkStat = 0;
            }
            json = gson.toJson(String.valueOf(checkStat));
        }
        catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }    
    
    /**
     * 기타 > 아이디 비밀번호찾기 폼
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/user/memberFindIdPw.do")
    public String memberFindIdPw(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        if("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0){
            request.setAttribute("msg", "로그인 상태에서는 아이디/비밀번호 찾기를 할 수 없습니다.");
            request.setAttribute("url", "/main/main.do");
            return "forward:/common/msgForward.do";
        }
        rMap.setString("mtCode","MA");
        request.setAttribute("mailDomainCodeList", commonService.selectMtCodeSub(rMap));
        
        rMap.setInt("nowYear", Calendar.getInstance().get(Calendar.YEAR));
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "/member/member_find_idpw";
    }
    
    /**
     * 아이디 찾기 결과
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/user/memberFindIdAjax.do")
    public void memberFindIdAjax(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        EduMap eMap = null;
        
        try{        	
        	String authCode = UserSessionManager.getSessionString(request, "authCode"); // 인증 값
        	String userAuthNumber = UserSessionManager.getSessionString(request, "userAuthNumber"); // 사용자 값
        	
        	if(authCode.equals(userAuthNumber)){
        		
        		eMap = userService.getFindId(rMap);
        		json = gson.toJson(eMap);
        		/** 세션 정보를 삭제한다. */
                UserSessionManager.deleteUserSessionVO(request);        		
        	} 
        	else {
        		json = gson.toJson("CERT_FAIL");
        	}            
        }
        catch(Exception ex){
        	/** 세션 정보를 삭제한다. */
            UserSessionManager.deleteUserSessionVO(request);
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }
    
    /**
     * 패스워드 찾기 결과 ajax
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/user/memberFindPwAjax.do")
    public void memberFindPwAjax(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        EduMap eMap = null;
        
        try{
        	String authCode = UserSessionManager.getSessionString(request, "authCode"); // 인증 값
        	String userAuthNumber = UserSessionManager.getSessionString(request, "userAuthNumber"); // 사용자 값
        	
        	if(authCode.equals(userAuthNumber)){                
                eMap = userService.getFindPw(rMap);
                json = gson.toJson(eMap);
        	}
        	else{
        		json = gson.toJson("CERT_FAIL");
        	}            
        } 
        catch(Exception ex){
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }

    /**
     * 회원 SNS 연동(리다이렉트)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 연동(리다이렉트)
    @RequestMapping(value = "/member/redirect.do")
    public String memberSns(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{      
        try{
            request.setAttribute("REQUEST_DATA", rMap);
        } 
        catch (Exception e) {
            throw new FrontException(e);
        }        
        return "/member/redirect";
    }  
}