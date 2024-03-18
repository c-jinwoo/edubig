package com.webapp.ccedu.ctrl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sangs.session.SessionManager;
import com.sangs.session.UserSessionManager;
import com.sangs.support.ControllerParamManager;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.Aes_128;
import com.sangs.util.DownloadServlet;
import com.sangs.util.NxKeyUtil;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsCryptUtil;
import com.sangs.util.SangsUtil;
import com.webapp.academy.mapper.BoardMapper;
import com.webapp.academy.mapper.MyClassMapper;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.MyClassService;
import com.webapp.academy.service.TutorService;
import com.webapp.academy.service.UserService;
import com.webapp.classdesk.service.ClassdeskBoardService;
import com.webapp.common.service.CommonUserService;

/**
 * Description : 사용자 공통 관련 컨트롤러
 *
 * Modification Information
 * 
 */

@Controller
public class CommonController {

    @Resource(name = "commonService")
    private CommonService     commonService;

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;

    @Resource(name = "myClassService")
    private MyClassService myClassService;
    
    @Resource(name = "classdeskBoardService")
    private ClassdeskBoardService classdeskBoardService;
    
    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "boardMapper")
    private BoardMapper       boardMapper;
    
    @Resource(name = "tutorService")
    private TutorService  tutorService;
    
    @Resource(name = "myClassMapper")
    private MyClassMapper       myClassMapper;
        
    private Logger log = LogManager.getLogger(CommonController.class);
    
    /**
     * 전체메뉴 > 이용안내 > 사이트맵
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 전체메뉴
    @RequestMapping(value="/common/siteMap.do")
    public String commonMenu(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/common_menu";    	
    }      
    /**
     * 전체메뉴 > 이용안내 > 이용약관
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 전체메뉴
    @RequestMapping(value="/common/termsConditions.do")
    public String termsConditions(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/terms_conditions";
    	
    }     
    /**
     * 전체메뉴 > 이용안내 > 개인정보보호정책
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 전체메뉴
    @RequestMapping(value="/common/privacy.do")
    public String privacy(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/privacy";
    	
    }    
    /**
     * 전체메뉴 > 이용안내 > 저작권보호
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 전체메뉴
    @RequestMapping(value="/common/copyright.do")
    public String copyright(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/copyright";    	
    }        
    /**
     * FOOTER > 이메일 무단 수집 거부
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 전체메뉴
    @RequestMapping(value="/common/rejectEmail.do")
    public String rejectEmail(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/reject_email";
    }     
    /**
     * FOOTER > 찾아오시는 길
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 전체메뉴
    @RequestMapping(value="/common/navigation.do")
    public String navigation(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/navigation";
    }   
    /**
     * FOOTER > 환불규정
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 전체메뉴
    @RequestMapping(value="/common/cancel.do")
    public String cancel(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("REQUEST_DATA", rMap);
    	return "/main/cancel";
    }
    

    /**
     * 나의강의실 파일다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/academy/classdeskFiledown.do")
    public String reportFiledown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
        	
        	EduMap data = classdeskBoardService.getBbsFileInfo(rMap);
        	
            EduMap map = new EduMap() ;
            map.put("SAVFILE", data.getString("SAVFILE"));
            map.put("SAVPATH", data.getString("SAVPATH"));
            map.put("ORGFILE", data.getString("ORGFILE"));
            result = filedown.downLoadFile(req, res, map);
            
            if (result) {
                return null;
                
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) { log.debug(e.getMessage());
            return "common/cmmn_error";
        }
    }    
}