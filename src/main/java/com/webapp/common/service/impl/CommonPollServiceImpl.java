package com.webapp.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.common.mapper.CommonPollMapper;
import com.webapp.common.service.CommonPollService;

@Service("commonPollService")
public class CommonPollServiceImpl implements CommonPollService{

    @Resource(name = "commonPollMapper")
    private CommonPollMapper commonPollMapper;
    
    
	/**
	 * 설문 리스트 - 게시판형식 ( 교육(PT0001) / 신용상담사(PT0002) / 사이트(PT0003) )
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	public List<EduMap> getPollList(DataMap data) throws Exception {
		return commonPollMapper.getPollList(data);
	}
	
	
	/**
	 * 신용상담사 > 합격여부 > 설문관리
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	public EduMap getExamPollInfo(DataMap data) throws Exception {
		return commonPollMapper.getExamPollInfo(data);
	}

	
	/**
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_문항
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	public List<EduMap> getEdPollQuizList(DataMap data) throws Exception {
		return commonPollMapper.getEdPollQuizList(data);
	}
	
	
	/**
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_문항_보기
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	public List<EduMap> getEdPollQitemList(DataMap data) throws Exception {
		return commonPollMapper.getEdPollQitemList(data);
	}
	
	
	/**
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_문항_보기
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	public void insertEdPollApply(DataMap data) throws Exception {
		commonPollMapper.insertEdPollApply(data);
	}
	
	
	/**
	 * 신용상담사 > 합격여부 > 설문관리> 상시설문_응시답안 등록
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	public void insertEdPollHist(DataMap data,String[] qnoList) throws Exception {
		
		for(int i = 0; i < qnoList.length; i++ ) {
			
			data.setInt("qno", Integer.parseInt(qnoList[i]));
			data.set("answer", data.get("itemSeq"+i));
			data.setInt("itemSeq", i+1);
			commonPollMapper.insertEdPollHist(data);
			
		}
		
	}
	
	
	/**
	 * 모듈명 리스트
	 * @param request
	 * @param model
	 * @param rMap
	 * @return
	 * @throws Exception
	 */
	public List<EduMap> getModuleList(DataMap data) throws Exception {
		return commonPollMapper.getModuleList(data);
	}

    /**
     * 신용상담사 > 합격여부 > 설문관리> 상시설문_응시답안 등록 (비회원)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception
     */
    public void insertEdPollSite(DataMap data,String[] ordrList) throws Exception {
        
        int noUserNo = commonPollMapper.selectNoUserNo(data);
        data.setInt("noUserNo", noUserNo);
        
        commonPollMapper.insertEdPollSite(data);
        
        for(int i = 0; i < ordrList.length; i++ ) {
            data.setInt("qno", data.getInt("qno"+i));
            data.set("answer", data.get("itemSeq"+i));
            data.setInt("itemSeq", i+1);
            commonPollMapper.insertEdPollSiteHist(data);
            
        }
        
    }
	
    
}
