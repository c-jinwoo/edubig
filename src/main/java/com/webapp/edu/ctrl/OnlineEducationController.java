package com.webapp.ccedu.ctrl;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.webapp.academy.service.BoardService;
import com.webapp.academy.service.CommonService;
import com.webapp.ccedu.service.OnlineBookService;
import com.webapp.ccedu.service.OnlineEducationService;
import com.webapp.ccedu.service.OnlineReviewService;
import com.webapp.classdesk.service.ClassdeskUserProgressService;
import com.sangs.util.AllatUtil;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;

/**
 * Description : 과정관련
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

@Controller
public class OnlineEducationController{
    @Resource(name = "onlineEducationService")
    private OnlineEducationService onlineEducationService;

    @Resource(name = "commonService")
    private CommonService   commonService;
    
    @Resource(name = "classdeskUserProgressService")
    private ClassdeskUserProgressService classdeskUserProgressService;
    
    @Resource(name = "onlineBookService")
    private OnlineBookService onlineBookService; 

    @Resource(name = "onlineReviewService")
    private OnlineReviewService onlineReviewService; 

    @Resource(name = "boardService")
    private BoardService boardService;
    
    /**
     * 온라인교육 > 과정소개
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception 
     */
    // TODO: 온라인교육 > 과정소개
    @RequestMapping(value = "/online/onlineEducationInfo.do")
    public String info(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        if(rMap.getString("courseno").equals("") || rMap.getString("courseno") == null){
            rMap.setString("courseno", "1");
        }
        String title = onlineEducationService.selectOnlineDetailTitle(Integer.parseInt(rMap.getString("courseno")));       
                
        if(title == null || title == ""){
			request.setAttribute("msg", "잘못된 경로로 접근하셨습니다."); 
			request.setAttribute("url", "/main/main.do"); 
			return "forward:/common/msgForward.do";        	
        }  
        
        request.setAttribute("reviewList",onlineReviewService.selectReviewList(rMap));
    	request.setAttribute("title", title);
    	
    	EduMap bargainMap = boardService.getBargainInfo();
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");

		String isBargain = "";
    	Date tDay = null;
    	Date sDay = null;
    	Date eDay = null;

    	if(bargainMap == null){
    		isBargain = "N";
    	}
    	else{
	    	try{
	    		Date currentTime = new Date();
	    		String tDayStr = dateFormat.format(currentTime);

	    		tDay = dateFormat.parse(tDayStr);
	    		sDay = dateFormat.parse(bargainMap.getString("EVENT_SDATE"));
	    		eDay = dateFormat.parse(bargainMap.getString("EVENT_EDATE"));

	    		int compare1 = tDay.compareTo(sDay);
	    		int compare2 = tDay.compareTo(eDay);

	    		if(compare1 > 0 && compare2 < 0){
	    			isBargain = "Y";
	    		}
	    		else{
	    			isBargain = "N";
	    		}	    		
	    		
	        	request.setAttribute("bargainInfo", bargainMap);
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}
    	}    
    	request.setAttribute("isBargain", isBargain); 	
        request.setAttribute("REQUEST_DATA", rMap);
        return "/online/online_education_info";
    }
    
    /**
     * 온라인교육 > 과정상세
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 온라인교육 > 과정상세
    @RequestMapping(value = "/online/onlineDetailForm.do")
    public String onlineDetailForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        try{                        
            EduMap eMap = onlineEducationService.getEdCourse1stSeqInfo(rMap);
            
            //데이터값 없을 경우 main 이동
            if(eMap == null){
            	request.setAttribute("msg", "과정 정보가 없습니다.");
            	request.setAttribute("url", "/main/main.do");
            	return "forward:/common/msgForward.do";
            }
            if(eMap.getString("CANCEL_YN").equals("N")){
            	request.setAttribute("msg", "신청기간이 아닙니다.");
            	request.setAttribute("url", "/main/main.do");
            	return "forward:/common/msgForward.do";            	
            }
            String title = onlineEducationService.selectOnlineDetailTitle(Integer.parseInt(rMap.getString("courseno")));   
        	request.setAttribute("title", title);   
            rMap.setInt("SES_COURSENO", eMap.getInt("COURSENO"));
            rMap.setString("courseno", Integer.toString(eMap.getInt("COURSENO")));
            rMap.setString("cseqno", Integer.toString(eMap.getInt("CSEQNO")));

            request.setAttribute("rowData", eMap);
            rMap.setString("applyYn", "N"); 
            if(("").equals(rMap.getString("SES_USERID"))){
                rMap.setInt("userNo", rMap.getInt("SES_USERNO"));
                EduMap uMap = commonService.getUserInfo(rMap);
                request.setAttribute("userData", uMap);
                
                if(uMap != null){
                    rMap.setString("applyYn", "Y");
                }
            }
            
            List<EduMap> resultList =  classdeskUserProgressService.getEdCourseTreeList(rMap);

            if(resultList != null){
                rMap.setString("FILE_PATH", (String) resultList.get(0).get("FILE_PATH"));
                rMap.setString("MEDIA_FILE", (String) resultList.get(0).get("MEDIA_FILE"));
            }

            // 교육 커리쿨럼
            rMap.add("paramCourseNo", rMap.get("courseno"));
            rMap.add("paramcSeqNo", rMap.get("cseqno"));

            // 과정 파일정보
            List<EduMap> fileMap = onlineEducationService.getFileInfoByCourseNo2(rMap);
            request.setAttribute("fileMap", fileMap);

            // 과정 자막 파일정보
            List<EduMap> txtFileMap = onlineEducationService.getTxtFileInfoByCourseNo(rMap);
            request.setAttribute("txtFileMap", txtFileMap);

            rMap.setString("title", SangsProperties.getProperty("Globals.onMain"));
            request.setAttribute("REQUEST_DATA", rMap);

            String mtCode = "SC";        
            request.setAttribute("courseList",commonService.getToSangsCodes(mtCode));
            request.setAttribute("bookInfo",onlineBookService.getCourseBookInfo(rMap));

        	Date sday = null;
        	Date eday = null;
        	Date now = new Date();
        	
            // 기간운영일 경우
            if(eMap.getString("OPENTYPE").equals("D")){
            	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");            	
            	try{
            		sday = dateFormat.parse(eMap.getString("APPLY_SDATE"));
            		String apply_edate = eMap.getString("APPLY_EDATE");
            		Integer len = apply_edate.length();
            		String apply_edate_front = apply_edate.substring(0,len-1);
            		String apply_edate_back = Integer.toString(Integer.parseInt(apply_edate.substring(len-1,len)) + 1);
            		eday = dateFormat.parse(apply_edate_front+apply_edate_back);   
            	}
            	catch(ParseException e){
            		e.printStackTrace();
            	}        	
            	int sCompare = now.compareTo(sday);
            	int eCompare = now.compareTo(eday);
            	
            	if(sCompare > 0  && eCompare < 0){
            		request.setAttribute("applyAb","A");
            	}
            	else{
            		request.setAttribute("applyAb","N");            		
            	}           	
            }  
            else{
        		request.setAttribute("applyAb","A");            	
            }
        } 
        catch(Exception e){
            throw new FrontException(e);
        }
        return "/online/online_detail_form";        
    }
    
    /**
     * 신청진행 Ajax
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 인권배움터 > 과정 신청 진행
    @RequestMapping(value = "/online/common/apply_ajaxExec.do")
    public void applyAjaxExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null ;
        EduMap rowData = null;
        
        //신청되어있는지 체크
        EduMap eMap = onlineEducationService.getCourseAppUserInfo(rMap);
        
        //중복신청인경우 중단
        if(eMap != null){
            json = "fail";
            eMap.put("classDiv", "Y");
            //중복신청이 아닌 경우 진행
        }
        else{
            onlineEducationService.insertCourApplyExec(rMap);
            eMap = onlineEducationService.getCourseAppUserInfo(rMap);
            rowData = onlineEducationService.getEdCourseSeqInfo(rMap);
            eMap.put("targetYn", rowData.getString("TARGETYN"));
            eMap.put("msg", rowData.getInt("CUSERNO"));
        }
        
        json =  gson.toJson(eMap);
        out.print(json);
        out.flush();
        out.close();
    }
}