package com.webapp.ccedu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.util.ParamUtil;
import com.webapp.ccedu.mapper.OnlineBookMapper;
import com.webapp.ccedu.service.OnlineBookService;
import com.webapp.classdesk.service.ConvertJavaToProcedureService;

/**
 * Description : 
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2021.03.03	CSLAB		최초작성
 *
 */

@Service("onlineBookService")
public class OnlineBookServiceImpl implements OnlineBookService {	
	@Resource(name = "onlineBookMapper")
	private OnlineBookMapper onlineBookMapper;	 

	public List<EduMap> selectTotalBookList() throws Exception{
		return onlineBookMapper.selectTotalBookList();
	}
	
	public List<EduMap> selectCourseBookList() throws Exception{
		return onlineBookMapper.selectCourseBookList();
	}
	
	public List<EduMap> selectClassList(String bookNo) throws Exception{
		return onlineBookMapper.selectClassList(bookNo);
	}	

	public EduMap selectBookInfo(DataMap data) throws Exception{
		return onlineBookMapper.selectBookInfo(data);
	}	
	
    public List<EduMap> getCourseBookInfo(DataMap rMap) throws Exception{
    	return onlineBookMapper.getCourseBookInfo(rMap);
    }
    	
	public Integer getBookPrice(String pNo) throws Exception{
		return onlineBookMapper.getBookPrice(pNo);
	}
}
