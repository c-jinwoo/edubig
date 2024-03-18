package com.webapp.academy.ctrl;

import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.sangs.support.ControllerParamManager;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.SangsUtil;
import com.webapp.academy.service.BoardService;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.MyClassService;

/**
 * Description : 사용자 강의실 관련 컨트롤러
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.29	CSLAB		최초작성
 *
 */

@Controller
public class MyclassController {

    @Resource(name = "myClassService")
    private MyClassService myClassService;

    @Resource(name = "boardService")
    private BoardService   boardService;

    @Resource(name = "commonService")
    private CommonService  commonService;

    private Logger         log = LogManager.getLogger(MyclassController.class);

    /**
     * 과정 삭제
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/myclass/del_course_exec.do")
    public String delCourseExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        try {
            if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {	// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                return "forward:/common/msgForward.do";
            }            
            String[] aryCuserno = rMap. getString("cuserNo").split(",");
            for(int i = 0; i < aryCuserno.length; i++){
                rMap.setString("CUSERNO", aryCuserno[i]);
                myClassService.deleteCourseAll(rMap);
            }            

            rMap.putString("rMsg", "신청취소 되었습니다.");							// 메세지
            rMap.putString("url", "/myclass/learningStatusList.do");	// 리턴url
            request.setAttribute("REQUEST_DATA", rMap);
        } 
        catch(Exception e){
        	log.debug(e.getMessage());             
            throw new FrontException(e);
        }
        return "academy/cmmn/academyExec";
    }    
    
    /**
     * 나의 학습실 강의실
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 나의 학습실 진도체크 
    @RequestMapping(value = "/myclass/learningStatusList.do")
    public String learningStatusList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        try {
            if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {	// 로그인 안했다면                
                rMap.putString("$returnUrl", "/myclass/learningStatusList.do");                
                DataMap removeDataMap = new DataMap();
        	    removeDataMap = SangsUtil.dataMapRemoveScriptTag(rMap);                
                request.setAttribute("paramInputs", ControllerParamManager.getParamHtmlFormConvert(removeDataMap));
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            }            

            if(rMap.getString("tab").isEmpty()) rMap.setString("tab", "O");
            if(rMap.getString("ispass").isEmpty()) rMap.setString("ispass", "N");
            request.setAttribute("listData", myClassService.selectLearningStatusList(rMap));
            request.setAttribute("resultCount", myClassService.selectLearningStatusListCnt(rMap));            
            request.setAttribute("REQUEST_DATA", rMap);            
        }
        catch(Exception e){
        	log.debug(e.getMessage());
            throw new Exception(e);
        }        
        return "/myclass/learning_status_list";
    }

    
    /**
     * 과정수료관리 > 수료증 인쇄 (온라인)
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 과정수료관리 > 수료증 인쇄 (온라인)
    @RequestMapping(value = "/myclass/cerOnlinePrint.do")
    public String cerOnlinePrint(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        try{             
            int m,h = 0;
            String time = "";
            EduMap map = myClassService.getUserCertPrintInfo(rMap);
            
            int studyTime = map.getInt("STUDYTIME");            
            m = studyTime / 60;
            h = m /60;
            
            if(h > 0){
                time = h + "시간" + m + "분";
            }else if(m > 0){
                time = m + "분";
            }  
            String brthdy = map.getString("BRTHDY"); 
            if(brthdy.length()>=4){
                map.put("YYYY", brthdy.substring(0,4));//년
                if(brthdy.length()>=6){
                    map.put("MM", brthdy.substring(4,6));//월
                    if(brthdy.length()>=8){
                        map.put("DD", brthdy.substring(6,8));//일
                    }
                }
            }
            
            // 회원 수료 데이터
            request.setAttribute("map", map);

            int idx = myClassService.getPrintMaxIdx(rMap);
            rMap.setInt("idx", idx);
            rMap.setString("mtPmTypeCode", rMap.getString("mtPmTypeCode"));
            rMap.setInt("pmNo", rMap.getInt("cseqno"));
            rMap.setInt("userNo", rMap.getInt("userno"));
            rMap.setString("userId", rMap.getString("userId"));
            rMap.setString("time", time);
            rMap.setString("printType", "A");   //인쇄구분 (수료증)

            myClassService.insertPrintLog(rMap);
            request.setAttribute("REQUEST_DATA", rMap);
            
        } 
        catch(Exception e){            
            throw new Exception(e);
        }
        return "academy/tutor/cert_online_print";        
    }
    
    /**
     * 진도체크 - 강의실
     * @param req
     * @param rMap
     * @throws Exception
     */
    // TODO: 집합교육일정표 달력
    @RequestMapping(value = "/myclass/ajaxProgressCheck.do")
    public void ajaxProgressCheck(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null ;

        try{
            myClassService.insertProgressCheck(rMap);            
            json =  gson.toJson(rMap);            
        }
        catch(Exception ex){
            json =  gson.toJson("FAIL");
        }
        out.print(json);
        out.flush();
        out.close();
    }
}