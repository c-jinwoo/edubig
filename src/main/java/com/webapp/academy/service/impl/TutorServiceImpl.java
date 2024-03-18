package com.webapp.academy.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.academy.mapper.TutorMapper;
import com.webapp.academy.service.TutorService;

/**
 * Description : Tutor Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2021.04.09   SANGS           최초작성
 *
 */

@Service("tutorService")
public class TutorServiceImpl implements TutorService { 

    @Resource(name = "tutorMapper")
    private TutorMapper tutorMapper;

    /**
     * 강사료관리 목록 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSyTutorFeeList(DataMap data) throws Exception {
        return tutorMapper.getSyTutorFeeList(data);
    }

    /**
     * 강의 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTutorCourseList(DataMap data) throws Exception {
    	ParamUtil.setPagingValue(data);
        return tutorMapper.getTutorCourseList(data);
    }

    /**
     * 강사료 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getTutorPrice(DataMap data) throws Exception {
        return tutorMapper.getTutorPrice(data);
    }

    /**
     * 강사료 신청
     * 
     * @param data
     * @throws Exception
     */
    public void insertSyTutorFee(DataMap data) throws Exception {
        tutorMapper.insertSyTutorFee(data);
    }

    /**
     * 강의 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEdCourseSeqInfo(DataMap data) throws Exception {
        return tutorMapper.getEdCourseSeqInfo(data);
    }

    /**
     * 과정상태 변경
     * 
     * @param data
     * @throws Exception
     */
    public void updateEdCourseSeq(DataMap data) throws Exception {
        tutorMapper.updateEdCourseSeq(data);
    }

    /**
     * 강사료 신청양식 상세
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUpdateTutorInfo(DataMap data) throws Exception {
        return tutorMapper.getUpdateTutorInfo(data);
    }
    
    /**
     * 커뮤니티관리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getCmmntyList(DataMap data)throws Exception{
		data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
		return tutorMapper.getCmmntyList(data);
	}
	
	/**
     * 커뮤니티관리 서브리스트 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCmmntySubListCount(DataMap data) throws Exception {
        return tutorMapper.getCmmntySubListCount(data);
    }
    
    /**
     * 커뮤니티관리 서브TOP리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getCmmntySubTopList(DataMap data)throws Exception{
		data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
		return tutorMapper.getCmmntySubTopList(data);
	}
	
	/**
     * 커뮤니티관리 서브리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getCmmntySubList(DataMap data)throws Exception{
		data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
		return tutorMapper.getCmmntySubList(data);
	}
	
	/**
     * 커뮤니티관리 상세 서브리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public EduMap getCmmntyDetailSubInfo(DataMap data)throws Exception{
		return tutorMapper.getCmmntyDetailSubInfo(data);
	}
	
	/**
     * 커뮤니티관리 조회수
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void updateCmmntyRcnt(DataMap data)throws Exception{
		tutorMapper.updateCmmntyRcnt(data);
	}
	
	/**
     * 커뮤니티코드관리 삭제 비활성화
     *
     * @param data
     * @return
     * @throws Exception
     */
	public int selectReplyInfo(DataMap data)throws Exception{
		return tutorMapper.selectReplyInfo(data);
	}
	
	/**
     * 커뮤니티관리 서브 폼 파일리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getFileList(DataMap data)throws Exception{
		return tutorMapper.getFileList(data);
	}
	
	/**
     * 커뮤니티관리 서브 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void deleteCmmntySubInfo(DataMap data)throws Exception{
		tutorMapper.deleteCmmntySubInfo(data);
	}
	
	/**
     * 커뮤니티관리 서브 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void insertCmmntySubInfo(DataMap data)throws Exception{
		tutorMapper.insertCmmntySubInfo(data);
	}
	
	/**
     * 커뮤니티관리 서브파일 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void insertCmmntySubFileInfo(HttpServletRequest request , DataMap data)throws Exception{
		if (ServletFileUpload.isMultipartContent(request)) {

            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            FileUploadUtil uploadUtil = new FileUploadUtil();
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }
        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");
        
        if (fileCnt != fileTempCnt) {
            data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
        }

        if(data.getString("qu").equals("update")){
        	String delCheckFile = data.getString("delNum");
    		StringTokenizer str = new StringTokenizer(delCheckFile ,",");
    		
    		//기존파일 삭제
    		while(str.hasMoreTokens()) {
    			data.setString("fileId", str.nextToken());
    			tutorMapper.deleteCmmntyFile(data);
    		}
        }
		
        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
            DataMap paramFileMap = new DataMap();
            paramFileMap.setString("nttNo", data.getString("nttNo"));
            paramFileMap.setString("bbsNo", data.getString("bbsNo"));
            paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
            paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
            paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
            paramFileMap.setString("uploadFileFulltPath", fileMap.get("uploadFileFulltPath", i).toString());
            paramFileMap.setString("uploadFileExt", fileMap.get("uploadFileExt", i).toString());

            tutorMapper.insertCmmntySubFileInfo(paramFileMap);
        }
	}
	
	/**
     * 커뮤니티관리 등록글의 nttNo값
     *
     * @param data
     * @return
     * @throws Exception
     */
	public String getNewNttNo()throws Exception{
		return tutorMapper.getNewNttNo();
	}
	
	/**
     * 커뮤니티관리 서브 등록 파일정보수정
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void updateCmmntySubFileInfo(DataMap data)throws Exception{
		tutorMapper.updateCmmntySubFileInfo(data);
	}
	
	/**
     * 커뮤니티관리 서브 답글 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void insertCmmntySubReplyInfo(DataMap data)throws Exception{
		tutorMapper.insertCmmntySubReplyInfo(data);
	}
	
	/**
     * 커뮤니티관리 소분류 업데이트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void updateCmmnthSubInfo(DataMap data)throws Exception{
		tutorMapper.updateCmmnthSubInfo(data);
	}
	
	/**
     * 커뮤니티관리 소분류 리플정보 업데이트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void updateCmmnthSubReplyInfo(DataMap data)throws Exception{
		tutorMapper.updateCmmnthSubReplyInfo(data);
	}
	
	/**
     * 커뮤니티관리 소분류 파일카운트 증가
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void updateCmmntySubFileCount(DataMap data)throws Exception{
		tutorMapper.updateCmmntySubFileCount(data);
	}
	
	/**
     * 권한코드 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getMtSubCodeList(DataMap data) throws Exception {
        return tutorMapper.getMtSubCodeList(data);
    }
    
    /**
     * 강사정보 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
	public EduMap getTutorDetail(DataMap data) {
		return tutorMapper.getTutorDetail(data);
	}
    
    /**
     * 강사정보 상세
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getTutorDetail2(DataMap data) {
		return tutorMapper.getTutorDetail2(data);
	}
	/**
     * 강사 위촉이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getTutorEntRstList(DataMap data) {
		return tutorMapper.getTutorEntRstList(data);
	}
	
	/**
     * 강사 위촉이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getTutorEntRstYearList(DataMap data) {
		return tutorMapper.getTutorEntRstYearList(data);
	}
	
	/**
     * 강사 위촉이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getMtFieldNameList(DataMap data) {
		return tutorMapper.getMtFieldNameList(data);
	}
	
	/**
     * 강사정보 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void updateTutorInfo(HttpServletRequest request,DataMap data)throws Exception{
		
		
		insertFileInfo2(request , data);
		
		tutorMapper.updateTutorInfo(data);
		
		String work_nms = data.getString("work_nm2");
		String work_in_dts = data.getString("work_in_dt2");
		String work_out_dts = data.getString("work_out_dt2");
		String dept_infos = data.getString("dept_info2");
		
		String[] work_nm = work_nms.split(","); // work_nm
		String[] work_in_dt = work_in_dts.split(","); // work_id_dt
		String[] work_out_dt = work_out_dts.split(","); // work_out_dt
		String[] dept_info = dept_infos.split(","); // 부서직위
		
		
		data.set("userno", data.get("SES_USERNO"));
		tutorMapper.deleteTutorInfo(data);
		
		int result = 0;
		int work_his_seq = tutorMapper.getMaxBoardNo(data);
		
		for(int i = 0; i< work_nm.length; i++){

			data.set("work_his_seq", (work_his_seq));
			data.set("work_nm", work_nm[i]);
		 	data.set("work_in_dt", work_in_dt[i]);
		 	data.set("work_out_dt", work_out_dt[i]);
		 	data.set("dept_info", dept_info[i]);
		 	tutorMapper.updateTutorInfo2(data);
		 	result++;
		}
		
		if(result > 0){
			
			work_nms = data.getString("work_nm3");
			work_in_dts = data.getString("work_in_dt3");
			work_out_dts = data.getString("work_out_dt3");
			dept_infos = data.getString("dept_info3");
			
			work_nm = work_nms.split(","); // work_nm
			work_in_dt = work_in_dts.split(","); // work_id_dt
			work_out_dt = work_out_dts.split(","); // work_out_dt
			dept_info = dept_infos.split(","); // 부서직위
			
			
			work_his_seq = tutorMapper.getMaxBoardNo(data);
			
			for(int i = 0; i< work_nm.length; i++){
				
				data.set("work_his_seq", (work_his_seq));
				data.set("work_nm", work_nm[i]);
				data.set("work_in_dt", work_in_dt[i]);
				data.set("work_out_dt", work_out_dt[i]);
				data.set("dept_info", dept_info[i]);
				
				tutorMapper.updateTutorInfo2(data);
			}
		}
		
		
	}
	
	/**
     * 강사 정보관리 파일 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertFileInfo2(HttpServletRequest request, DataMap data) throws Exception {

        if (ServletFileUpload.isMultipartContent(request)) {

            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            FileUploadUtil uploadUtil = new FileUploadUtil();
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPrivePath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }
        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");
        
        if (fileCnt != fileTempCnt) {
            data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
        }
        
        if(data.getString("qu").equals("delete")){
        	int saveFilePath = data.getString("saveFilePath").indexOf("utor");
        	data.putString("saveFilePath" , data.getString("saveFilePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
        	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFileNm"));
        }
        
        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
            DataMap paramFileMap = new DataMap();
            //paramFileMap.setString("sltno", data.getString("sltno"));
          //  paramFileMap.setString("slno", data.getString("slno"));
            paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
            paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
            paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
            paramFileMap.setString("uploadFileFulltPath", fileMap.get("uploadFileFulltPath", i).toString());
            paramFileMap.setString("userNo", data.get("SES_USERNO").toString());
    /*        
            if(fileMap.get("uploadSeq" , i).toString().equals("1")){
            	paramFileMap.setString("MT_TUTOR_FILE_CODE", "TF0001");
            }else if(fileMap.get("uploadSeq" , i).toString().equals("2")){
            	paramFileMap.setString("MT_TUTOR_FILE_CODE", "TF0002");
            }else if(fileMap.get("uploadSeq" , i).toString().equals("3")){
            	paramFileMap.setString("MT_TUTOR_FILE_CODE", "TF0006");
            }*/
            
		//	, #{uploadFileSize} // 용량
		//	, #{uploadFileSaveName} 저장파일명
		//	, #{uploadFileOrgName}  원본파일명
		//	, #{uploadFileFulltPath} 저장경로
			
            
            
            tutorMapper.insertFileInfo2(paramFileMap);
        }
    }
	
	
	/**
     * 강사이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
	public List<EduMap> getTutorHisList(DataMap data) {
		return tutorMapper.getTutorHisList(data);
	}
	
	/**
     * 강사이력 수정
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void updateTutorHis(HttpServletRequest request , DataMap data) {
		
		String[] hisno = request.getParameterValues("hisno");
		String[] thema = request.getParameterValues("thema");
    	String[] startDt = request.getParameterValues("startDt");
    	String[] endDt = request.getParameterValues("endDt");
    	String[] applyOrgan = request.getParameterValues("applyOrgan");
    	String[] target = request.getParameterValues("target");
    	String[] personCnt = request.getParameterValues("personCnt");
    	if(!data.getString("startCnt").equals("")){
	    	//수정
	    	for(int i = 0; i < data.getInt("startCnt"); i++){
	    		DataMap updateMap = new DataMap();
	    		
	    		updateMap.setString("userno", data.getString("userno"));
	    		updateMap.setString("hisno", hisno[i]);
	    		updateMap.setString("thema", thema[i]);
	    		updateMap.setString("startDt", startDt[i]);
	    		updateMap.setString("endDt", endDt[i]);
	    		updateMap.setString("applyOrgan", applyOrgan[i]);
	    		updateMap.setString("target", target[i]);
	    		updateMap.setString("personCnt", personCnt[i]);
	    		
	    		//기본 이력사항 수정
	    	
	    		tutorMapper.updateTutorHis(updateMap);
	    	}
    	}
    	
    	//등록
    	if(data.getInt("cnt") != 0){

    		if(data.getString("startCnt").equals("")){
    			data.setInt("startCnt", 0);
    		}
    		for(int i = data.getInt("startCnt"); i < data.getInt("cnt"); i++){
        		DataMap insetMap = new DataMap();
        		
        		insetMap.setString("userno", data.getString("userno"));
        		insetMap.setString("thema", thema[i]);
        		insetMap.setString("startDt", startDt[i]);
        		insetMap.setString("endDt", endDt[i]);
        		insetMap.setString("applyOrgan", applyOrgan[i]);
        		insetMap.setString("target", target[i]);
        		insetMap.setString("personCnt", personCnt[i]);
        		
        		//추가이력사항 등록
        		tutorMapper.insertTutorHis(insetMap);
        	}
    	}
	}
	
	/**
     * 강사이력 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void deleteTutorHis(DataMap data) {
		tutorMapper.deleteTutorHis(data);
	}
	
	/**
     * 커뮤니티 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
	public void deleteCmmntyFile(DataMap data) throws Exception {
		
		//파일삭제
		if(data.getString("type").equals("D")){
			int saveFilePath = data.getString("savePath").indexOf("utor");
        	data.putString("saveFilePath" , data.getString("savePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
        	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
        }
		tutorMapper.deleteCmmntyFile(data);
	}
	
	/**
     * 특강리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLectureList(DataMap data) throws Exception {
    	data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
        return tutorMapper.getLectureList(data);
    }
	
    /**
     * 특강 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getLectureListCount(DataMap data) throws Exception {
        return tutorMapper.getLectureListCount(data);
    }
    
    /**
     * 특강정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLectureInfo(DataMap data) throws Exception {
    	
    	EduMap getLectureInfo = tutorMapper.getLectureInfo(data);
        String mtLctreCode = (String)getLectureInfo.get("MT_LCTRE_CODE");
        String mtLctreName2 = "";
        
        String[] mtLctreName = mtLctreCode.split(",");
	        for(int i2=0;i2<mtLctreName.length;i2++){
	        	if(i2 == 0){
	        		mtLctreName2 = tutorMapper.getMtLctreName(mtLctreName[0]);
	        	}else{
	        		mtLctreName2 = mtLctreName2 +','+tutorMapper.getMtLctreName(mtLctreName[i2]);
	        	}
	        }
	        
	        getLectureInfo.put("mtLctreName", mtLctreName2);
       
	        return getLectureInfo;
    }
    
    /**
     * 특강 신청일시
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSpecialLectureTime(DataMap data) throws Exception {
        return tutorMapper.getSpecialLectureTime(data);
    }

    /**
     * 특강 신청일시
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getSpecialLectureTimeInfo(DataMap data) throws Exception {
        return tutorMapper.getSpecialLectureTimeInfo(data);
    }
    
    /**
     * 강사풀 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLecTutorList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return tutorMapper.getLecTutorList(data);
    }
    
    /**
     * 강사풀 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getLecTutorCount(DataMap data) throws Exception {
        return tutorMapper.getLecTutorCount(data);
    }
    
    /**
     * 특강 강사 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSpecialLectureFile(DataMap data) throws Exception {
        return tutorMapper.getSpecialLectureFile(data);
    }
    
    /**
     * 강사 정보 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSpecialLectureFile2(DataMap data) throws Exception {
        return tutorMapper.getSpecialLectureFile2(data);
    }
    
    /**
     * 강사 저 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLectureJobInfo(DataMap data) throws Exception {
        return tutorMapper.getLectureJobInfo(data);
    }
  
    /**
     * 강사 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */

    public EduMap getFileInfo(DataMap data) throws Exception {
    	 return tutorMapper.getFileInfo(data);
    }
    
    /**
     * 강사 결과보고 첨부파일
     *
     * @param data
     * @return
     * @throws Exception
     */

    public EduMap lecturePersonalFiledown(DataMap data) throws Exception{
    	 return tutorMapper.lecturePersonalFiledown(data);
    }
    /**
     * 특강관리 등록
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertLecture(HttpServletRequest request, DataMap data) throws Exception {
    	if(data.getString("qu").equals("insert")){
    		int slno = tutorMapper.getMaxSlnoInfo(data);
    		int sltno = tutorMapper.getMaxSltnoInfo(data);

        	data.setInt("slno", slno);
        	data.setInt("sltno", sltno);
        	
        	//전화번호
        	String fPhone = data.getString("firstPhone");
        	String sPhone = data.getString("secondPhone");
        	String tPhone = data.getString("thirdPhone");
        	String applyPhone = fPhone+"-"+sPhone+"-"+tPhone;
        	data.setString("applyPhone",applyPhone);
        	
        	//교육시설정보 재조합
        	String eduFacCodeArr = data.getString("eduFacCodeArr");
        	for(int i = 1 ; i < data.getInt("checkLength"); i++){
        		if(!data.get("eduFacCodeArr" , i).equals("")){
        			eduFacCodeArr += ","+data.get("eduFacCodeArr" , i);
        		}
        	}
        	data.putString("eduFacCodeArr", eduFacCodeArr);
        	
        	
        	// 특강 일시 등록
    		String[] multiEduDate = request.getParameterValues("multiEduDate");
    		String[] multiEduSdateHour = request.getParameterValues("multiEduSdateHour");
    		String[] multiEduSdateMinute = request.getParameterValues("multiEduSdateMinute");
    		String[] multiEduEdateHour = request.getParameterValues("multiEduEdateHour");
    		String[] multiEduEdateMinute = request.getParameterValues("multiEduEdateMinute");
    		String check = "X" ;
    		
    		if(multiEduDate != null){
    			for(int i=0; i<multiEduDate.length; i++){
    				DataMap dmap =  new DataMap();
    				
    				dmap.setString("lecUserno", data.getString("lecUserno"));
    				dmap.setString("lecUserName", data.getString("lecUserName"));
    				dmap.setString("lecPhone", data.getString("lecPhone"));
    				dmap.setString("mtTutorCode", data.getString("mtTutorCode"));
    				dmap.setString("mtLctreCode", data.getString("mtLctreCode"));
    				dmap.setInt("slno", data.getInt("slno"));
    				dmap.setString("multiEduDate", multiEduDate[i]);
    				dmap.setString("multiEduSdateHour", multiEduSdateHour[i]);
    				dmap.setString("multiEduSdateMinute", multiEduSdateMinute[i]);
    				dmap.setString("multiEduEdateHour", multiEduEdateHour[i]);
    				dmap.setString("multiEduEdateMinute", multiEduEdateMinute[i]);
    				dmap.setInt("SES_USERNO", data.getInt("SES_USERNO"));
    				dmap.setString("mtScCode", data.getString("mtScCode"));
    				dmap.setString("mtAreaCode", data.getString("mtAreaCode"));
    				int checkNum = tutorMapper.getLectureInsertInfo(dmap);
    				if(checkNum == 0){
    					tutorMapper.insertLectureTime(dmap);
    					check = "Y";
    				}
    			}
    		}
    		if(check.equals("Y")){
    			// 특강 등록
    			tutorMapper.insertLecture(data);
    			
    			//특강파일 등록
    			insertFileInfo(request , data);
    		}
    		
    	}
    	else if(data.getString("qu").equals("update")){
    		
    		EduMap checkMap = tutorMapper.getCheckInfo(data);
    		if(checkMap != null){
	    		//String delCheckFile = data.getString("delCheckFile");
	    		//StringTokenizer str = new StringTokenizer(delCheckFile ,",");
	    		
	    		//기존파일 삭제
	    		/*while(str.hasMoreTokens()) {
	    			data.setString("fileNo", str.nextToken());
	    			deleteFileInfo(data);
	    		}*/
	    		
	    		//개인이력 수정시 교육시설 정보
	    		/*String eduFacCodeArr = data.getString("eduFacCodeArr");
	        	for(int i = 1 ; i < data.getInt("checkLength"); i++){
	        		if(!data.get("eduFacCodeArr" , i).equals("")){
	        			
	        			eduFacCodeArr += ","+data.get("eduFacCodeArr" , i);
	        		}
	        	}
	        	data.setString("eduFacCode", eduFacCodeArr);
	    		data.putString("lecPay" , data.getString("lecPay").replace(",", ""));*/
	    		
	    		//updateLectureTimeInfo(data);
	        	//updateLectureInfo(data);
    			updateTutorLectureResult(data);
	    		insertFileInfo(request , data);
    		}
    	} else if(data.getString("qu").equals("delete")){
    		EduMap checkMap = tutorMapper.getCheckInfo(data);
    		if(checkMap != null){
    			insertFileInfo(request,data);
    		}
    	}
    }
    
    /**
     * 강의 파일 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertFileInfo(HttpServletRequest request, DataMap data) throws Exception {

        if (ServletFileUpload.isMultipartContent(request)) {

            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            FileUploadUtil uploadUtil = new FileUploadUtil();  
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }
        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");
        
        if (fileCnt != fileTempCnt) {
            data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
        }
        
        if(data.getString("qu").equals("delete")){
        	int saveFilePath = data.getString("saveFilePath").indexOf("utor");
        	data.putString("saveFilePath" , data.getString("saveFilePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
        	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFileNm"));
        }
        
        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
            DataMap paramFileMap = new DataMap();
            //paramFileMap.setString("sltno", data.getString("sltno"));
            paramFileMap.setString("slno", data.getString("slno"));
            paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
            paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
            paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
            paramFileMap.setString("uploadFileFulltPath", fileMap.get("uploadFileFulltPath", i).toString());
            
            if(fileMap.get("uploadSeq" , i).toString().equals("1")){
            	paramFileMap.setString("MT_TUTOR_FILE_CODE", "TF0001");
            }else if(fileMap.get("uploadSeq" , i).toString().equals("2")){
            	paramFileMap.setString("MT_TUTOR_FILE_CODE", "TF0002");
            }else if(fileMap.get("uploadSeq" , i).toString().equals("3")){
            	paramFileMap.setString("MT_TUTOR_FILE_CODE", "TF0006");
            }
            
            tutorMapper.insertFileInfo(paramFileMap);
        }
    }
    
    /**
     * 수정 전 파일 삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteFileInfo(DataMap data) throws Exception {
    	tutorMapper.deleteFileInfo(data);
    }
    
    
    /**
     * 평가 강의이력 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEvaluationList(DataMap data) throws Exception {
        return tutorMapper.getEvaluationList(data);
    }
    
    /**
     * 평가 강의이력 강의교안
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEvaluationFirst(DataMap data) throws Exception {
        return tutorMapper.getEvaluationFirst(data);
    }
    
    /**
     * 평가 강의이력 강의계획
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEvaluationSecond(DataMap data) throws Exception {
        return tutorMapper.getEvaluationSecond(data);
    }
    
    /**
     * 평가 강의이력 설문
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEvaluationThird(DataMap data) throws Exception {
        return tutorMapper.getEvaluationThird(data);
    }
    
    /**
     * 평가 강의이력 에세이
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEvaluationFourth(DataMap data) throws Exception {
        return tutorMapper.getEvaluationFourth(data);
    }
    
    /**
     * reportInfoExec
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void reportInfoExec(HttpServletRequest request, DataMap data) throws Exception {
    	//기존파일 삭제
    	if(data.containsKey("delCheckFile")){
    		String delCheckFile = data.getString("delCheckFile");
    		StringTokenizer str = new StringTokenizer(delCheckFile ,",");
			while(str.hasMoreTokens()) {
				data.setString("reportNo", str.nextToken());
				deleteReportFileInfo(data);
			}
    	}
    	insertReportFileInfo(request , data);
    }
    
    /**
     * 보고서 파일 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertReportFileInfo(HttpServletRequest request, DataMap data) throws Exception {

        if (ServletFileUpload.isMultipartContent(request)) {

            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            FileUploadUtil uploadUtil = new FileUploadUtil();
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }
        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");

        if (fileCnt != fileTempCnt) {
        	data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
        }
        
        if(data.getString("qu").equals("delete")){
        	int saveFilePath = data.getString("saveFilePath").indexOf("utor");
        	data.putString("saveFilePath" , data.getString("saveFilePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
        	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFileNm"));
        	tutorMapper.deleteReportFile(data);
        }
        
        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
            DataMap paramFileMap = new DataMap();
            
            paramFileMap.setString("mtFieldCode", data.getString("mtFieldCode"));
            paramFileMap.setString("mtReportTypeCode", data.getString("mtReportTypeCode"));
            paramFileMap.setString("mtTutorFileCode", data.getString("mtTutorFileCode"));
            paramFileMap.setString("entrstYear", data.getString("entrstYear"));
            paramFileMap.setString("reportNo", data.getString("reportNo"));
            paramFileMap.setString("userNo", data.getString("SES_USERNO"));
            paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
            paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
            paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
            paramFileMap.setString("uploadFileFulltPath", fileMap.get("uploadFileFulltPath", i).toString());
            if(data.getString("mtReportTypeCode").equals("RP1000")){
            	if(fileMap.get("uploadSeq" , i).toString().equals("1")){
            		paramFileMap.setString("mtTutorFileCode", "TF0001");
            	}else if(fileMap.get("uploadSeq" , i).toString().equals("2")){
            		paramFileMap.setString("mtTutorFileCode", "TF0002");
            	}else if(fileMap.get("uploadSeq" , i).toString().equals("3")){
            		paramFileMap.setString("mtTutorFileCode", "TF0006");
            	}else if(fileMap.get("uploadSeq" , i).toString().equals("4")){
            		paramFileMap.setString("mtTutorFileCode", "TF0003");
            	}
            }
            if(data.getString("qu").equals("insert")){
            	tutorMapper.insertReportFileInfo(paramFileMap);
            }
            if(data.getString("qu").equals("update")){
            	paramFileMap.setString("reportNo", data.getString("reportNo"));
            	tutorMapper.updateReportFileInfo(paramFileMap);
            }
        }
    }
    
    /**
     * 평가이력관리 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteEvaluationInfo(DataMap data) throws Exception {
    	
    	int saveFilePath = data.getString("saveFilePath").indexOf("utor");
    	data.putString("saveFilePath" , data.getString("saveFilePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
    	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFileNm"));
    	tutorMapper.deleteEvaluationInfo(data);
    }
    
    /**
     * 위원회관리 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteLectureCommitteeInfo(DataMap data) throws Exception {
    	
    	int saveFilePath = data.getString("saveFilePath").indexOf("utor");
    	data.putString("saveFilePath" , data.getString("saveFilePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
    	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
    	tutorMapper.deleteLectureCommitteeInfo(data);
    }
    
    /**
     * 위원회관리 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteTutorBoardFile(DataMap data) throws Exception {
    	
    	int saveFilePath = data.getString("saveFilePath").indexOf("utor");
    	data.putString("saveFilePath" , data.getString("saveFilePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
    	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
    	tutorMapper.deleteTutorBoardFile(data);
    }
    /**
     * 위원회관리 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void tutorBoardFileDelete(DataMap data) throws Exception{
    	
    	tutorMapper.tutorBoardFileDelete(data);
    }
    
    /**
     * 강사정보 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteLecture(DataMap data) throws Exception {
    	
    	int saveFilePath = data.getString("saveFilePath").indexOf("utor");
    	data.putString("saveFilePath" , data.getString("saveFilePath").substring(0,saveFilePath-1) + "/" + SangsProperties.getProperty("Globals.tutorFilePath"));
    	FileUtil.deleteFile(data.getString("saveFilePath") + File.separator + data.getString("saveFile"));
    	tutorMapper.deleteLecture(data);
    }
    
    
    /**
     * 보고서 제출 수정폼
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getReportData(DataMap data) throws Exception {
    	return tutorMapper.getReportData(data);
    }
    
    /**
     * 강의이력 수정(기타내용)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateLectureInfo(DataMap data) throws Exception {
    	tutorMapper.updateLectureInfo(data);
    }
    
    /**
     * 강의이력 시간 수정(기타내용)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateLectureTimeInfo(DataMap data) throws Exception {
    	tutorMapper.updateLectureTimeInfo(data);
    }
    
    /**
     * 평가이력 보고서제출 파일삭제
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void deleteReportFileInfo(DataMap data) throws Exception {
    	tutorMapper.deleteReportFileInfo(data);
    }
    
    /**
     * 지역명 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMtSubName(DataMap data) throws Exception {
    	return tutorMapper.getMtSubName(data);
    }
    
    /**
     * 강사여부확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    public  int getTutorGradeCnt(DataMap data) throws Exception {
    	return tutorMapper.getTutorGradeCnt(data);
    }
    

    

    
    /**
     * 강사  VIEW COUNT 갱신
     *
     * @param data
     * @throws Exception
     */
    public void updateTutorBoardViewCnt(DataMap data) throws Exception {
    	tutorMapper.updateTutorBoardViewCnt(data);
    }
    
    /**
     * 강사 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap selectTutorBoardView(DataMap data) throws Exception {
        return tutorMapper.selectTutorBoardView(data);
    }
    
    /**
     * 강사  파일 리스트
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getTutorBoardFileList(int bbsNo) throws Exception {
        return tutorMapper.getTutorBoardFileList(bbsNo);
    }
    
    /**
     * 강사공지사항 파일
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public EduMap getLectureNoticeFileInfo(DataMap data) throws Exception {
        return tutorMapper.getLectureNoticeFileInfo(data);
    } 
    
    /**
     * 특강리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSpecialLectureList(DataMap data) throws Exception {
    	data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
        
        List<EduMap> tutorlist = tutorMapper.getSpecialLectureList(data);
        for(int i=0;i<tutorlist.size();i++){
        String mtLctreCode = (String)tutorlist.get(i).get("MT_LCTRE_CODE");
        String mtLctreName2 = "";
        int cnt=0;
        
        String[] mtLctreName = mtLctreCode.split(",");
	        for(int i2=0;i2<mtLctreName.length;i2++){
	        	if(i2 == 0){
	        		mtLctreName2 = tutorMapper.getMtLctreName(mtLctreName[0]);
	        	}else{
	        		cnt++;
	        	}
	        }
	        if(mtLctreName.length != 1){
	        	mtLctreName2 = mtLctreName2 + " 외 " +cnt+"개";
	        }
	    tutorlist.get(i).put("mtLctreName", mtLctreName2);
        }

        return tutorlist;
    }
	
    /**
     * 특강 (데이터 총 갯수)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getSpecialLectureListCount(DataMap data) throws Exception {
        return tutorMapper.getSpecialLectureListCount(data);
    }
    
    /**
     * 진행중인 특강 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSpecialLectureAll(DataMap data) throws Exception {
    	
    	 List<EduMap> specialLectureList = tutorMapper.getSpecialLectureAll(data);
         for(int i=0;i<specialLectureList.size();i++){
         String mtLctreCode = (String)specialLectureList.get(i).get("MT_LCTRE_CODE");
         String mtLctreName2 = "";
         int cnt=0;
         
         String[] mtLctreName = mtLctreCode.split(",");
 	        for(int i2=0;i2<mtLctreName.length;i2++){
 	        	if(i2 == 0){
 	        		mtLctreName2 = tutorMapper.getMtLctreName(mtLctreName[0]);
 	        	}else{
 	        		cnt++;
 	        	}
 	        }
 	        if(mtLctreName.length != 1){
	        	mtLctreName2 = mtLctreName2 + " 외 " +cnt+"개";
	        }
 	   specialLectureList.get(i).put("mtLctreName", mtLctreName2);
        }
    	return specialLectureList;
    }
    
    /**
     * 진행중인 특강 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSpecialLectureAllView(DataMap data) throws Exception {
        
    	List<EduMap> getSpecialLectureAllView = tutorMapper.getSpecialLectureAllView(data);
        for(int i=0;i<getSpecialLectureAllView.size();i++){
        String mtLctreCode = (String)getSpecialLectureAllView.get(i).get("MT_LCTRE_CODE");
        String mtLctreName2 = "";
        
        String[] mtLctreName = mtLctreCode.split(",");
	        for(int i2=0;i2<mtLctreName.length;i2++){
	        	if(i2 == 0){
	        		mtLctreName2 = tutorMapper.getMtLctreName(mtLctreName[0]);
	        	}else{
	        		mtLctreName2 = mtLctreName2 +','+tutorMapper.getMtLctreName(mtLctreName[i2]);
	        	}
	        }
	        
	        getSpecialLectureAllView.get(i).put("mtLctreName", mtLctreName2);
       }
    	return getSpecialLectureAllView;
    }
    
    /**
     * 특강신청정보 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSpecialLectureInfo(DataMap data) throws Exception {
    	
    	List<EduMap> specialLectureInfo = tutorMapper.getSpecialLectureInfo(data);
        for(int i=0;i<specialLectureInfo.size();i++){
        String mtLctreCode = (String)specialLectureInfo.get(i).get("MT_LCTRE_CODE");
        String mtLctreName2 = "";
        int cnt=0;
        
        String[] mtLctreName = mtLctreCode.split(",");
	        for(int i2=0;i2<mtLctreName.length;i2++){
	        	if(i2 == 0){
	        		mtLctreName2 = tutorMapper.getMtLctreName(mtLctreName[0]);
	        	}else{
	        		cnt++;
	        	}
	        }
	        if(mtLctreName.length != 1){
	        	mtLctreName2 = mtLctreName2 + " 외 " +cnt+"개";
	        }
	    specialLectureInfo.get(i).put("mtLctreName", mtLctreName2);
       }
   	return specialLectureInfo;
    }
    
    /**
     * 특강신청정보 상세보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getSpecialLectureInfoView(DataMap data) throws Exception {
        
    	List<EduMap> specialLectureInfoView = tutorMapper.getSpecialLectureInfoView(data);
        for(int i=0;i<specialLectureInfoView.size();i++){
        String mtLctreCode = (String)specialLectureInfoView.get(i).get("MT_LCTRE_CODE");
        String mtLctreName2 = "";
        
        String[] mtLctreName = mtLctreCode.split(",");
	        for(int i2=0;i2<mtLctreName.length;i2++){
	        	if(i2 == 0){
	        		mtLctreName2 = tutorMapper.getMtLctreName(mtLctreName[0]);
	        	}else{
	        		mtLctreName2 = mtLctreName2 +','+tutorMapper.getMtLctreName(mtLctreName[i2]);
	        	}
	        }
	    
	        specialLectureInfoView.get(i).put("mtLctreName", mtLctreName2);
       }
    	return specialLectureInfoView;
    }
    
    /**
     * 특강 강사배정취소
     * 
     * @param paramMap
     * @throws Exception
     */
    public void specialLectureCancelExec(Map<String, Object> paramMap) throws Exception{
    	// 취소 실행
    	tutorMapper.CancelExec(paramMap);
    	// 특강상태 변경 실행
    	tutorMapper.specialLectureCancelChange(paramMap);
    }
    
    /**
     * 특강 강사배정취소
     * 
     * @param paramMap
     * @throws Exception
     */
    public void updateTutorLectureResult(DataMap data) throws Exception {
    	tutorMapper.updateTutorLectureResult(data);
    }
    
    /**
     * 강사커뮤니티 댓글입력
     * 
     * @param paramMap
     * @throws Exception
     */
    public void tutorBoardReplySubmit(DataMap data) throws Exception {
    	//댓글 입력
    	tutorMapper.insertBoardReplySubmit(data);
    }
    
    /**
     * 공사소통마다 댓글 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTutorBoardReplyList(DataMap data) throws Exception {
		return tutorMapper.getTutorBoardReplyList(data);
    }
    
    /**
     * 강사커뮤니티 댓글삭제
     * 
     * @param paramMap
     * @throws Exception
     */
    public void tutorBoardReplyDelete(DataMap data) throws Exception {
    	tutorMapper.tutorBoardReplyDelete(data);
    }
    
    /**
     * 강사커뮤니티 댓글수정
     * 
     * @param paramMap
     * @throws Exception
     */
    public void tutorBoardReplyModify(DataMap data) throws Exception {
    	tutorMapper.tutorBoardReplyModify(data);
    }
    
    /**
     * 강사커뮤니티 ajax 댓글리스트
     * 
     * @param paramMap
     * @throws Exception
     */
    public List<Map<String,Object>> getTutorBoardReplyAjaxList(DataMap data) throws Exception {
    	return tutorMapper.getTutorBoardReplyAjaxList(data);
    }
    
    /**
     * 강사커뮤니티 댓글 답글쓰기
     * 
     * @param paramMap
     * @throws Exception
     */
    public void tutorBoardCmtReplySubmit(DataMap data) throws Exception {
    	//답글번호 설정
    	data.setInt("rpyNo",tutorMapper.selectBoardReplyRpyno(data));
    	//답글 입력
    	tutorMapper.tutorBoardCmtReplySubmit(data);
    }

    
}
