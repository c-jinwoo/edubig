package com.webapp.ccedu.ctrl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.MainService;
import com.webapp.ccedu.service.OnlineReviewService;

/**
 * Description : 
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.26	CSLAB		최초작성
 *
 */

@Controller
public class OnlineReviewController {
    @Resource(name = "commonService")
    private CommonService   commonService;

    @Resource(name = "mainService")
    private MainService   	 mainService;
    
    @Resource(name = "onlineReviewService")
    private OnlineReviewService onlineReviewService; 
    
    // TODO: 리뷰 > 리스트
    @RequestMapping(value = "/review/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
		try{    
        	// 상단배너 : 과정     
            request.setAttribute("courseList",mainService.getMainCourseList());
            
			request.setAttribute("list_data", onlineReviewService.selectReviewList(rMap));
			request.setAttribute("REQUEST_DATA", rMap);
		} 
		catch(Exception e){
		    throw new FrontException(e);
		}		
		return "/review/main";        
    }  
    
    // TODO: 리뷰 > 작성
    @RequestMapping(value = "/review/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
		try{
            if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1){
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            } 
            if((rMap.getString("rvQuery").equals("") || rMap.getString("rvQuery") == null)
            	|| (rMap.getString("searchCseqno").equals("") || rMap.getString("searchCseqno") == null)
            	|| (rMap.getString("courseno").equals("") || rMap.getString("courseno") == null)){
                request.setAttribute("msg", "잘못된 접근입니다.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
            } 
            
			request.setAttribute("review", onlineReviewService.selectReviewMap(rMap));
			request.setAttribute("REQUEST_DATA", rMap);			
		}
		catch(Exception e){
		    throw new FrontException(e);
		}		
		return "/review/form";        
    }   
    
    // TODO: 리뷰 > 실행
    @RequestMapping(value = "/review/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
		try{
            if("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {	// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/user/login.do");
                return "forward:/common/msgForward.do";
            } 
            if((rMap.getString("rvQuery").equals("") || rMap.getString("rvQuery") == null)
            	|| (rMap.getString("searchCseqno").equals("") || rMap.getString("searchCseqno") == null)
            	|| (rMap.getString("courseno").equals("") || rMap.getString("courseno") == null)){
                request.setAttribute("msg", "잘못된 접근입니다.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";
            } 
            
            String query = "";
            String queryEx = "";
            
            query = rMap.getString("rvQuery");
            if(query.equals("insert")){
                queryEx = "등록";
            	onlineReviewService.insertReview(rMap);
            }
            else if(query.equals("update")){
                queryEx = "수정";
            	onlineReviewService.updateReview(rMap);            	
            }
            else if(query.equals("delete")){
                queryEx = "삭제";
            	onlineReviewService.deleteReview(rMap);  
            }
            else{
                request.setAttribute("msg", "잘못된 접근입니다.");
                request.setAttribute("url", "/main/main.do");
                return "forward:/common/msgForward.do";            	
            }
            
			request.setAttribute("REQUEST_DATA", rMap);			    
			request.setAttribute("msg", "수강후기가 "+ queryEx +"되었습니다.");
			request.setAttribute("url", "/myclass/learningClassList.do?courseno="+rMap.getString("courseno")+"&searchCseqno="+rMap.getString("searchCseqno"));    
		}
		catch(Exception e){
		    throw new FrontException(e);
		}		
        return "forward:/common/msgForward.do";        
    }  
}