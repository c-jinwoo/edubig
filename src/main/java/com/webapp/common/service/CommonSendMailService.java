package com.webapp.common.service;

import java.util.List;
import com.webapp.common.vo.SendMailVO;

public interface CommonSendMailService {

    /**
     * 메일 보내기(다수건)
     * 
     * @param sendList
     * @return
     * @throws Exception
     */
    List<SendMailVO> sendMailList(List<SendMailVO> sendList) throws Exception;

    /**
     * 메일 보내기(한건)
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    SendMailVO sendMail(SendMailVO vo) throws Exception;

}
