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
import com.webapp.ccedu.service.OnlinePaymentService;
import com.webapp.classdesk.service.ClassdeskUserProgressService;
import com.sangs.util.AllatUtil;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
/**
 * Description : 결제 관련 컨트롤러
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.02.25	CSLAB		최초작성
 *
 */

@Controller
public class OnlinePaymentController{
    @Resource(name = "onlineEducationService")
    private OnlineEducationService onlineEducationService;

    @Resource(name = "onlineBookService")
    private OnlineBookService onlineBookService; 
    
    @Resource(name = "onlinePaymentService")
    private OnlinePaymentService onlinePaymentService; 
    
    /**
     * 결제 > 메인
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 결제 > 메인
    @RequestMapping(value = "/payment/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{  	      
		try{    		
			String pType = rMap.getString("productCd");
			
			/* 비로그인 시 */
			if("N".equals(rMap.getString("SES_ISLOGIN")) || ("").equals(rMap.getString("SES_USERID"))){
				request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
				request.setAttribute("url", "/user/login.do");
				return "forward:/common/msgForward.do";
			}			
			/* URL 강제접근 시 */
			if(pType.equals("") || pType == null){
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("url", "/main/main.do");
				return "forward:/common/msgForward.do";
			}
			/* 모바일 접근 시 */
			String userAgent = request.getHeader("user-agent");
			boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
			boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
			
			/* 강의 */
			if(pType.equals("TT0001")){
				rMap.putString("productPr", rMap.getString("price"));			
				rMap.putString("productNm", rMap.getString("goodname"));		
				rMap.putString("productNo", rMap.getString("cseqno"));		
				rMap.putString("productCount", "1");			
				
				request.setAttribute("bookList", onlineBookService.getCourseBookInfo(rMap));		
			}
			/* 교재 */
			else if(pType.equals("TT0002")){
				rMap.putString("productPr", rMap.getString("price"));			
				rMap.putString("productNm", rMap.getString("booknm"));		
				rMap.putString("productNo", rMap.getString("bookno"));		
				rMap.putString("productCount", rMap.getString("bookcount"));				
			}
			
			request.setAttribute("userInfo", onlinePaymentService.selectUserInfo(rMap.getInt("SES_USERNO")));		
			request.setAttribute("REQUEST_DATA", rMap);			
		}
		catch(Exception e){
		    throw new FrontException(e);
		}		
		return "/payment/main";        
    }
    
    /**
     * 결제 > 승인
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 결제 > 승인
    @RequestMapping(value = "/payment/approve.do")
    public String onlinePayApprove(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException{
        request.setAttribute("REQUEST_DATA", rMap);
        try{ 		
			String pType = rMap.getString("pCd");
			String pNo = rMap.getString("pNo");
			String pCnt = rMap.getString("pCnt");
			Integer price = 0;
			Integer totalPrice = 0;
        			
			/* 비로그인 시 */
			if("N".equals(rMap.getString("SES_ISLOGIN")) || ("").equals(rMap.getString("SES_USERID"))){
				request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
				request.setAttribute("url", "/user/login.do");
				return "forward:/common/msgForward.do";
			}  	
			/* URL 강제접근 시 */
			if(pType.equals("") || pType == null){
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("url", "/main/main.do");
				return "forward:/common/msgForward.do";
			}
			
			/* 중복결제 방지 */
			String orderNo = rMap.getString("allat_order_no");
			List<EduMap> orderList = onlinePaymentService.selectPaymentHist(orderNo);
			
			if(orderList.size() > 0){
				request.setAttribute("msg", "이미 결제처리 되었습니다.");
				request.setAttribute("url", "/main/main.do");
				return "forward:/common/msgForward.do";
			}
			else{						
				/* 강의 */
				if(pType.equals("TT0001")){
					rMap.putString("pCd","TT0001");
					rMap.putInt("pAmount", 1);  
					onlinePaymentService.insertPayment(rMap);
									
					List<EduMap> bookList = onlineBookService.getCourseBookInfo(rMap);
		        	for(Integer i=0;i<bookList.size();i++){	 
		        		rMap.putString("pCd","TT0002");
						rMap.putInt("price", 0);    		
		        		rMap.putInt("pNo", Integer.parseInt(bookList.get(i).get("BOOKNO").toString()));
		        		
						onlinePaymentService.insertPayment(rMap);
		        	}				
		        	
					price = onlineEducationService.getCoursePrice(pNo);  			
				}
				/* 교재 */
				else if(pType.equals("TT0002")){
					rMap.putString("pCd","TT0002");	
					rMap.putInt("pAmount", Integer.parseInt(pCnt));
					onlinePaymentService.insertPayment(rMap);	
					
					price = onlineBookService.getBookPrice(pNo);			
				}      
				
				totalPrice = Integer.parseInt(pCnt) * price;
	        	request.setAttribute("price",Integer.toString(totalPrice));	 
			}
		}
        catch(Exception e){
		}
        
        return "/payment/allat_approval";
    }
    
    /**
     * 결제 > 결과
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 결제 > 결과
    @RequestMapping(value = "/payment/receive.do")
    public String onlinePayReceive(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        request.setAttribute("REQUEST_DATA", rMap);
        return "/payment/allat_receive";
    }   
    
    /**
     * 신청진행 Ajax
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/payment/ajaxFindLastOrderIdx.do")
    public void findLastOrderIdx(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null ;

        json =  gson.toJson(onlinePaymentService.selectPaymentLastOrder());       

        out.print(json);
        out.flush();
        out.close();        
    }  
}