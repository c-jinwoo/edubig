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
import com.webapp.academy.service.CommonService;
import com.webapp.ccedu.service.OnlineBookService;
import com.webapp.ccedu.service.OnlineEducationService;
import com.webapp.classdesk.service.ClassdeskUserProgressService;
import com.sangs.util.AllatUtil;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
/**
 * Description : 무료강의 관련 컨트롤러
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.02.25	CSLAB		최초작성
 *
 */

@Controller
public class OnlineFreeController{
    /**
     * 무료강의 > 메인
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 강사 > 메인페이지
    @RequestMapping(value = "/free/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{  	      
		try{          
			request.setAttribute("REQUEST_DATA", rMap);
		}
		catch(Exception e){
		    throw new FrontException(e);
		}		
		return "free/main";        
    }
}