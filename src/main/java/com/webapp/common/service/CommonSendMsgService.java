package com.webapp.common.service;

import java.util.List;
import com.webapp.common.vo.SendMsgVO;

public interface CommonSendMsgService {

    /**
     * SMS 보내기 (다건)
     * 
     * @param sendList
     * @return
     * @throws Exception
     */
    List<SendMsgVO> sendMsgList(List<SendMsgVO> sendList) throws Exception;

    /**
     * SMS 보내기 (한건)
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    SendMsgVO sendMsg(SendMsgVO vo) throws Exception;
}
