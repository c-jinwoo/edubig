package com.webapp.ccedu.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.webapp.academy.service.CommonService;
import com.webapp.ccedu.service.OnlineBookService;

/**
 * Description : 
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

@Controller
public class OnlineBookController {
    @Resource(name = "commonService")
    private CommonService   commonService;
    
    @Resource(name = "onlineBookService")
    private OnlineBookService onlineBookService; 
    
    // TODO: 온라인서점 > 리스트
    @RequestMapping(value = "/book/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
		try {    
			request.setAttribute("listData", onlineBookService.selectTotalBookList());
			
			request.setAttribute("REQUEST_DATA", rMap);			
		} catch (Exception e) {
		    throw new FrontException(e);
		}		
		return "/book/main";        
    }  
    
    // TODO: 온라인서점 > 상세정보
    @RequestMapping(value = "/book/view.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
		try {    
			EduMap tMap = onlineBookService.selectBookInfo(rMap);
			
            if(tMap == null){
                request.setAttribute("msg", "잘못된 접근입니다.");
                request.setAttribute("url", "/book/main.do");
                return "forward:/common/msgForward.do";
            }		            
            
            request.setAttribute("result", tMap);
			request.setAttribute("classList", onlineBookService.selectClassList(rMap.getString("bookNo")));				
			
			request.setAttribute("REQUEST_DATA", rMap);			
		}
		catch(Exception e){
		    throw new FrontException(e);
		}		
		return "/book/view";        
    }   
}