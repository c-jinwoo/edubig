<%@ page contentType="text/html; charset=euc-kr" %>
<!-- 올앳관련 함수 Import //-->
<%@ page import="java.util.*,java.net.*,com.sangs.util.AllatUtil" %>
<%@ page import="com.sangs.support.SangsProperties"%>
<%
  //Request Value Define
  //----------------------
  // Service Code
  String sCrossKey = "";	//설정필요 [사이트 참조 - http://www.allatpay.com/servlet/AllatBiz/support/sp_install_guide_scriptapi.jsp#shop]
  String sShopId   = "";		//설정필요
  
  String sAmount   = (String)request.getAttribute("price");				//결제 금액을 다시 계산해서 만들어야 함(해킹방지)  ( session, DB 사용 )
  String sEncData  = request.getParameter("allat_enc_data");
  String strReq = "";
  // 요청 데이터 설정
  //----------------------
  strReq  ="allat_shop_id="   +sShopId;
  strReq +="&allat_amt="      +sAmount;
  strReq +="&allat_enc_data=" +sEncData;
  strReq +="&allat_cross_key="+sCrossKey;
  // 올앳 결제 서버와 통신  : AllatUtil.approvalReq->통신함수, HashMap->결과값
  //-----------------------------------------------------------------------------
  AllatUtil util = new AllatUtil();
  HashMap hm     = null;
  
  String sMode = SangsProperties.getProperty("Globals.ServerMode");
  if(sMode.equals("real")){
	  hm = util.approvalReq(strReq, "SSL"); 
  }
  else{
	  hm = util.approvalReq(strReq, "NOSSL");
  }  
  
  // 결제 결과 값 확인
  //------------------
  String sReplyCd     = (String)hm.get("reply_cd");
  String sReplyMsg    = (String)hm.get("reply_msg");
  String pType 		  = (String)hm.get("pay_type");
  String sAccountNo      = "";
  String sAccountNm      = "";
  String sIncomeAccNm    = "";
  String sIncomeLimitYmd = "";
  String sIncomeExpectYmd= "";	  
  /* 결과값 처리
  --------------------------------------------------------------------------
     결과 값이 '0000'이면 정상임. 단, allat_test_yn=Y 일경우 '0001'이 정상임.
     실제 결제   : allat_test_yn=N 일 경우 reply_cd=0000 이면 정상
     테스트 결제 : allat_test_yn=Y 일 경우 reply_cd=0001 이면 정상
  --------------------------------------------------------------------------*/
  //out.println("에러코드 : " + sReplyCd + "@"+ strReq);  
  //out.println(pType);
  /*if( sReplyCd.equals("0001") ){
	  pType = (String)hm.get("pay_type");  
	  if(pType.equals("VBANK")){
		  sAccountNo       = (String)hm.get("account_no");
		  sAccountNm       = (String)hm.get("account_nm");
		  sIncomeAccNm     = (String)hm.get("income_account_nm");
		  sIncomeLimitYmd  = (String)hm.get("income_limit_ymd");
		  sIncomeExpectYmd = (String)hm.get("income_expect_ymd");	  
	  }
    // reply_cd "0000" 일때만 성공
    String sOrderNo        = (String)hm.get("order_no");
    String sAmt            = (String)hm.get("amt");
    String sPayType        = (String)hm.get("pay_type");
    String sApprovalYmdHms = (String)hm.get("approval_ymdhms");
    String sSeqNo          = (String)hm.get("seq_no");
    String sApprovalNo     = (String)hm.get("approval_no");
    String sCardId         = (String)hm.get("card_id");
    String sCardNm         = (String)hm.get("card_nm");
    String sSellMm         = (String)hm.get("sell_mm");
    String sZerofeeYn      = (String)hm.get("zerofee_yn");
    String sCertYn         = (String)hm.get("cert_yn");
    String sContractYn     = (String)hm.get("contract_yn");
    String sSaveAmt        = (String)hm.get("save_amt");
    String sBankId         = (String)hm.get("bank_id");
    String sBankNm         = (String)hm.get("bank_nm");
    String sCashBillNo     = (String)hm.get("cash_bill_no");
    String sCashApprovalNo = (String)hm.get("cash_approval_no");
    String sEscrowYn       = (String)hm.get("escrow_yn");
    String sAccountNo      = (String)hm.get("account_no");
    String sAccountNm      = (String)hm.get("account_nm");
    String sIncomeAccNm    = (String)hm.get("income_account_nm");
    String sIncomeLimitYmd = (String)hm.get("income_limit_ymd");
    String sIncomeExpectYmd= (String)hm.get("income_expect_ymd");
    String sCashYn         = (String)hm.get("cash_yn");
    String sHpId           = (String)hm.get("hp_id");
    String sTicketId       = (String)hm.get("ticket_id");
    String sTicketPayType  = (String)hm.get("ticket_pay_type");
    String sTicketNm       = (String)hm.get("ticket_nm");
    String sPointAmt       = (String)hm.get("point_amt");

    out.println("결과코드               : " + sReplyCd          + "<br>");
    out.println("결과메세지             : " + sReplyMsg         + "<br>");
    out.println("주문번호               : " + sOrderNo          + "<br>");
    out.println("승인금액               : " + sAmt              + "<br>");
    out.println("지불수단               : " + sPayType          + "<br>");
    out.println("승인일시               : " + sApprovalYmdHms   + "<br>");
    out.println("거래일련번호           : " + sSeqNo            + "<br>");
    out.println("에스크로 적용 여부     : " + sEscrowYn         + "<br>");
	out.println("==================== 신용 카드 ===================<br>");
    out.println("승인번호               : " + sApprovalNo       + "<br>");
    out.println("카드ID                 : " + sCardId           + "<br>");
    out.println("카드명                 : " + sCardNm           + "<br>");
    out.println("할부개월               : " + sSellMm           + "<br>");
    out.println("무이자여부             : " + sZerofeeYn        + "<br>");   //무이자(Y),일시불(N)
    out.println("인증여부               : " + sCertYn           + "<br>");   //인증(Y),미인증(N)
    out.println("직가맹여부             : " + sContractYn       + "<br>");   //3자가맹점(Y),대표가맹점(N)
    out.println("세이브 결제 금액       : " + sSaveAmt          + "<br>");
    out.println("포인트 결제 금액       : " + sPointAmt         + "<br>");
	out.println("=============== 계좌 이체 / 가상계좌 =============<br>");
    out.println("은행ID                 : " + sBankId           + "<br>");
    out.println("은행명                 : " + sBankNm           + "<br>");
    out.println("현금영수증 일련 번호   : " + sCashBillNo       + "<br>");
    out.println("현금영수증 승인 번호   : " + sCashApprovalNo   + "<br>");
    out.println("===================== 가상계좌 ===================<br>");
    out.println("계좌번호               : " + sAccountNo        + "<br>");
    out.println("입금 계좌명            : " + sIncomeAccNm      + "<br>");
    out.println("입금자명               : " + sAccountNm        + "<br>");
    out.println("입금기한일             : " + sIncomeLimitYmd   + "<br>");
    out.println("입금예정일             : " + sIncomeExpectYmd  + "<br>");
    out.println("현금영수증신청 여부    : " + sCashYn           + "<br>");
    out.println("===================== 휴대폰 결제 ================<br>");
    out.println("이동통신사구분         : " + sHpId             + "<br>");
    out.println("===================== 상품권 결제 ================<br>");
    out.println("상품권ID               :" + sTicketId          + "<br>");
    out.println("상품권 이름            :" + sTicketPayType     + "<br>");
    out.println("결제구분               :" + sTicketNm          + "<br>");

	// 배포본에서는 제외 시킬것 //////////////////////////////////////////
	String sPartcancelYn  = (String)hm.get("partcancel_yn");
	String sBCCertNo      = (String)hm.get("bc_cert_no");
	String sCardNo        = (String)hm.get("card_no");
	String sIspFullCardCd = (String)hm.get("isp_full_card_cd");
	String sCardType      = (String)hm.get("card_type");
	String sBankAccountNm = (String)hm.get("bank_account_nm");
    out.println("===================== 배포본제외 ================<br>");
	out.println("신용카드 부분취소가능여부 : " + sPartcancelYn  + "<br>"); 
	out.println("BC인증번호                : " + sBCCertNo      + "<br>");
	out.println("카드번호 Return           : " + sCardNo        + "<br>");
	out.println("ISP 전체 카드코드         : " + sIspFullCardCd + "<br>");
	out.println("카드구분                  : " + sCardType      + "<br>");
	out.println("계좌이체 예금주명         : " + sBankAccountNm + "<br>");
	////////////////////////////////////////////////////////////////////// 

  }else{   
	 // reply_cd 가 "0000" 아닐때는 에러 (자세한 내용은 매뉴얼참조)
    // reply_msg 가 실패에 대한 메세지
    out.println("결과코드               : " + sReplyCd  + "<br>");
    out.println("결과메세지             : " + sReplyMsg + "<br>");
  }*/
%>
<form id="frm"  name ="frm" method ="post" action ="">
	<input type="hidden" name="returnUrl" id="returnUrl" value=""/>
	<input type="hidden" name="goodname" id="goodname" value="<%=request.getParameter("goodname")%>"/>
	<input type="hidden" name="price" value="<%=request.getParameter("price")%>"/>
	<input type="hidden" name="searchWord" id="searchWord" value=""/> 
	<input type="hidden" name="cseqno" id="cseqno"  value="<%=request.getParameter("cseqno")%>"/>
	<input type="hidden" name="searchCseqno" id="searchCseqno"  value="<%=request.getParameter("searchCseqno")%>"/>
	<input type="hidden" name="courseno" id="courseno"  value="<%=request.getParameter("courseno")%>"/>
	<input type="hidden" name="cuserno" id="cuserno"  value="<%=request.getParameter("cuserno")%>"/>
	<input type="hidden" name="targetYn" id="targetYn"  value="<%=request.getParameter("targetYn")%>"/>
	<input type="hidden" name="mtScCode" id="mtScCode" value="<%=request.getParameter("mtScCode")%>"/>
	<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<%=request.getParameter("mtCtypeCode")%>"/>
	<input type="hidden" name="ref1" id="ref1" value="<%=request.getParameter("ref1")%>"/>
	<input type="hidden" name="applyChk" id="applyChk" value="N"/><!-- 과정 중복수강방지 -->
	<input type="hidden" name="multipleCancelYn" id="multipleCancelYn" value="N" />
	<input type="hidden" name="startDate"  id="startDate" value="<%=request.getParameter("startDate")%>">
	<input type="hidden" name="endDate"  id="endDate" value="<%=request.getParameter("endDate")%>">
	<input type="hidden" name="fileid"  id="fileid" value="">
	<input type="hidden" name="fileseq"  id="fileseq" value="">
	<input type="hidden" name="applyYn"  id="applyYn" value="<%=request.getParameter("applyYn")%>">
	<input type="hidden" name="logUserNo" id="logUserNo"  value="<%=request.getParameter("logUserNo")%>"/>
	<input type="hidden" name="logUserId" id="logUserId"  value="<%=request.getParameter("logUserId")%>"/>
	<input type="hidden" name="allat_order_no" id="allat_order_no"  value="<%=request.getParameter("allat_order_no")%>"/>	
	<!-- 강의실 이동 -->
	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo"  value="<%=request.getParameter("paramcSeqNo")%>"/>
	<input type="hidden" name="paramCourseNo" id="paramCourseNo"  value="<%=request.getParameter("paramCourseNo")%>"/>
	<input type="hidden" name="paramcUserNo" id="paramcUserNo"  value="<%=request.getParameter("paramcUserNo")%>"/>
	<input type="hidden" name="CLASSDESK" id="CLASSDESK"  value="<%=request.getParameter("CLASSDESK")%>"/>
	<input type="hidden" name="paramcMtScCode" id="paramcMtScCode"  value="<%=request.getParameter("paramcMtScCode")%>"/>	
	<input type="hidden" id="fileSubmitYn" value="<%=request.getParameter("fileSubmitYn")%>"/>	
	<!-- 미디어 -->
    <input type="hidden" name="filePath" id="filePath" value="<%=request.getParameter("filePath")%>"/>
	<input type="hidden" name="mediaFile" id="mediaFile" value="<%=request.getParameter("mediaFile")%>"/>
	<input type="hidden" name="progressChk" id="progressChk" value="false"/>
	<input type="hidden" name="mediaPath" id="mediaPath" value="<%=request.getParameter("mediaPath")%>"/>	
</form>
<link href='/cmmn/modal/css/jquery.modal.css' rel='stylesheet' />
<link href='/cmmn/modal/css/jquery.modal.theme-atlant.css' rel='stylesheet' />
<link href='/cmmn/modal/css/jquery.modal.theme-xenon.css' rel='stylesheet' />
<script src="/cmmn/js/jquery-1.11.1.min.js??Ver20200309"></script>
<script src="/cmmn/js/common.js?Ver20180618_01"></script>
<script src='/cmmn/modal/js/jquery.modal.js' charset="utf-8"></script>
<script language="JavaScript">
	<%
	String pCd = request.getParameter("allat_product_cd");
	String result = "fail";

  	if(sMode.equals("real")){
  		if(sReplyCd.equals("0000")){  
  			result = "success";
  		}
  	}
	else{
  		if(sReplyCd.equals("0001")){ 
  			result = "success";  			
  		}
	}  
	  
	if(result.equals("success")){
		if(pCd.equals("TT0001")){
			if(pType.equals("3D") || pType.equals("ISP") || pType.equals("ABANK")){%>
				if(isMobile()){
					alert("결제에 성공했습니다.");
					apply_course();
				}
				else{
					fnModalMsg("결제에 성공했습니다.",function(result){
						apply_course();
					});
				}
			<%
				}
			else if(pType.equals("VBANK")){
			%>
					<%-- var txt = "";
					txt += "무통장 입금(가상계좌)</br>";
					txt += "</br>계좌번호 :"+<%=sAccountNo%>;
					txt += "</br>금액 : "+<%=sAmount%>+"원";
					txt += "</br>입금기한일 : "+<%=sIncomeLimitYmd%>;
					fnModalMsg(txt,function(result){
						location.href = "/main/main.do";					
					}); --%>
			<%
			} 
		}
		else if(pCd.equals("TT0002")){
			if(pType.equals("3D") || pType.equals("ISP") || pType.equals("ABANK")){%>
				if(isMobile()){
					alert("결제에 성공했습니다.");
					location.href = "/main/main.do";
				}
				else{
					fnModalMsg("결제에 성공했습니다.",function(result){
						location.href = "/main/main.do";
					});
				}
			<%
				}
			else if(pType.equals("VBANK")){
			%>
					<%-- var txt = "";
					txt += "무통장 입금(가상계좌)</br>";
					txt += "</br>계좌번호 :"+<%=sAccountNo%>;
					txt += "</br>금액 : "+<%=sAmount%>+"원";
					txt += "</br>입금기한일 : "+<%=sIncomeLimitYmd%>;
					fnModalMsg(txt,function(result){
						location.href = "/main/main.do";					
					}); --%>
			<%
			} 
		}
	}else{%>
		fnModalMsg("결제에 실패했습니다.",function(result){
			location.href = "/main/main.do";
		});
	<%
	}
	%>	
	
	function isMobile() {
		return /Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i
				.test(navigator.userAgent);
	}
	function apply_course(){
		$.ajax({
			url : '/online/common/apply_ajaxExec.do',
			type : 'post',
			data : $('form[name=frm]').serialize(),
			dataType : 'json',
			success : function(data) {
				if(data.classDiv == 'Y'){
					$("#frm").attr("action", "/myclass/learningStatusList.do");
					$("#frm").submit();
				} else {
					$("#frm").attr("action", "/myclass/learningStatusList.do");
					$("#frm").submit();
					$('#applyYn').val('Y');
					submitted = false;
				}
			}
		});
	}
</script>