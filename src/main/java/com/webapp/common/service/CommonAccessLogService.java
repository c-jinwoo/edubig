package com.webapp.common.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.sangs.support.DataMap;

public interface CommonAccessLogService {

	/**
	 * 접속로그 등록
	 * @param req
	 * @param sysGb
	 * @throws Exception
	 */
	void insertAccessLog (HttpServletRequest req, String sysGb) throws Exception;
	
}
