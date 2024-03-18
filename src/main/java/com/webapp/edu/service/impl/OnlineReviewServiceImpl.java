package com.webapp.ccedu.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.ParamUtil;
import com.webapp.ccedu.mapper.OnlineReviewMapper;
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

@Service("onlineReviewService")
public class OnlineReviewServiceImpl implements OnlineReviewService {	
	@Resource(name = "onlineReviewMapper")
	private OnlineReviewMapper onlineReviewMapper;	 

	public List<EduMap> selectReviewList(DataMap rMap) throws Exception{
		List<EduMap> listData = onlineReviewMapper.selectReviewList(rMap);
		for(Integer i=0;i<listData.size();i++){
			String writer = listData.get(i).getString("WRITER");
			String replaceString = "";
			
			for(Integer j=0;j<writer.length();j++){
				if(j == 1){
					replaceString += "*";
				}
				else{
					replaceString += writer.charAt(j);					
				}
			}
			listData.get(i).put("WRITER",replaceString);
			listData.set(i, listData.get(i));				
		}
		return listData;
	}
	
	public EduMap selectReviewMap(DataMap rMap) throws Exception{
		return onlineReviewMapper.selectReviewMap(rMap);
	}	
	
	public void insertReview(DataMap rMap) throws Exception{
		onlineReviewMapper.insertReview(rMap);
	}
	
	public void updateReview(DataMap rMap) throws Exception{
		onlineReviewMapper.updateReview(rMap);
	}	

	public void deleteReview(DataMap rMap) throws Exception{
		onlineReviewMapper.deleteReview(rMap);
	}	
}
