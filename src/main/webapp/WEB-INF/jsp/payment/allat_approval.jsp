<%@ page contentType="text/html; charset=euc-kr" %>
<!-- �þܰ��� �Լ� Import //-->
<%@ page import="java.util.*,java.net.*,com.sangs.util.AllatUtil" %>
<%@ page import="com.sangs.support.SangsProperties"%>
<%
  //Request Value Define
  //----------------------
  // Service Code
  String sCrossKey = "";	//�����ʿ� [����Ʈ ���� - http://www.allatpay.com/servlet/AllatBiz/support/sp_install_guide_scriptapi.jsp#shop]
  String sShopId   = "";		//�����ʿ�
  
  String sAmount   = (String)request.getAttribute("price");				//���� �ݾ��� �ٽ� ����ؼ� ������ ��(��ŷ����)  ( session, DB ��� )
  String sEncData  = request.getParameter("allat_enc_data");
  String strReq = "";
  // ��û ������ ����
  //----------------------
  strReq  ="allat_shop_id="   +sShopId;
  strReq +="&allat_amt="      +sAmount;
  strReq +="&allat_enc_data=" +sEncData;
  strReq +="&allat_cross_key="+sCrossKey;
  // �þ� ���� ������ ���  : AllatUtil.approvalReq->����Լ�, HashMap->�����
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
  
  // ���� ��� �� Ȯ��
  //------------------
  String sReplyCd     = (String)hm.get("reply_cd");
  String sReplyMsg    = (String)hm.get("reply_msg");
  String pType 		  = (String)hm.get("pay_type");
  String sAccountNo      = "";
  String sAccountNm      = "";
  String sIncomeAccNm    = "";
  String sIncomeLimitYmd = "";
  String sIncomeExpectYmd= "";	  
  /* ����� ó��
  --------------------------------------------------------------------------
     ��� ���� '0000'�̸� ������. ��, allat_test_yn=Y �ϰ�� '0001'�� ������.
     ���� ����   : allat_test_yn=N �� ��� reply_cd=0000 �̸� ����
     �׽�Ʈ ���� : allat_test_yn=Y �� ��� reply_cd=0001 �̸� ����
  --------------------------------------------------------------------------*/
  //out.println("�����ڵ� : " + sReplyCd + "@"+ strReq);  
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
    // reply_cd "0000" �϶��� ����
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

    out.println("����ڵ�               : " + sReplyCd          + "<br>");
    out.println("����޼���             : " + sReplyMsg         + "<br>");
    out.println("�ֹ���ȣ               : " + sOrderNo          + "<br>");
    out.println("���αݾ�               : " + sAmt              + "<br>");
    out.println("���Ҽ���               : " + sPayType          + "<br>");
    out.println("�����Ͻ�               : " + sApprovalYmdHms   + "<br>");
    out.println("�ŷ��Ϸù�ȣ           : " + sSeqNo            + "<br>");
    out.println("����ũ�� ���� ����     : " + sEscrowYn         + "<br>");
	out.println("==================== �ſ� ī�� ===================<br>");
    out.println("���ι�ȣ               : " + sApprovalNo       + "<br>");
    out.println("ī��ID                 : " + sCardId           + "<br>");
    out.println("ī���                 : " + sCardNm           + "<br>");
    out.println("�Һΰ���               : " + sSellMm           + "<br>");
    out.println("�����ڿ���             : " + sZerofeeYn        + "<br>");   //������(Y),�Ͻú�(N)
    out.println("��������               : " + sCertYn           + "<br>");   //����(Y),������(N)
    out.println("�����Ϳ���             : " + sContractYn       + "<br>");   //3�ڰ�����(Y),��ǥ������(N)
    out.println("���̺� ���� �ݾ�       : " + sSaveAmt          + "<br>");
    out.println("����Ʈ ���� �ݾ�       : " + sPointAmt         + "<br>");
	out.println("=============== ���� ��ü / ������� =============<br>");
    out.println("����ID                 : " + sBankId           + "<br>");
    out.println("�����                 : " + sBankNm           + "<br>");
    out.println("���ݿ����� �Ϸ� ��ȣ   : " + sCashBillNo       + "<br>");
    out.println("���ݿ����� ���� ��ȣ   : " + sCashApprovalNo   + "<br>");
    out.println("===================== ������� ===================<br>");
    out.println("���¹�ȣ               : " + sAccountNo        + "<br>");
    out.println("�Ա� ���¸�            : " + sIncomeAccNm      + "<br>");
    out.println("�Ա��ڸ�               : " + sAccountNm        + "<br>");
    out.println("�Աݱ�����             : " + sIncomeLimitYmd   + "<br>");
    out.println("�Աݿ�����             : " + sIncomeExpectYmd  + "<br>");
    out.println("���ݿ�������û ����    : " + sCashYn           + "<br>");
    out.println("===================== �޴��� ���� ================<br>");
    out.println("�̵���Ż籸��         : " + sHpId             + "<br>");
    out.println("===================== ��ǰ�� ���� ================<br>");
    out.println("��ǰ��ID               :" + sTicketId          + "<br>");
    out.println("��ǰ�� �̸�            :" + sTicketPayType     + "<br>");
    out.println("��������               :" + sTicketNm          + "<br>");

	// ������������ ���� ��ų�� //////////////////////////////////////////
	String sPartcancelYn  = (String)hm.get("partcancel_yn");
	String sBCCertNo      = (String)hm.get("bc_cert_no");
	String sCardNo        = (String)hm.get("card_no");
	String sIspFullCardCd = (String)hm.get("isp_full_card_cd");
	String sCardType      = (String)hm.get("card_type");
	String sBankAccountNm = (String)hm.get("bank_account_nm");
    out.println("===================== ���������� ================<br>");
	out.println("�ſ�ī�� �κ���Ұ��ɿ��� : " + sPartcancelYn  + "<br>"); 
	out.println("BC������ȣ                : " + sBCCertNo      + "<br>");
	out.println("ī���ȣ Return           : " + sCardNo        + "<br>");
	out.println("ISP ��ü ī���ڵ�         : " + sIspFullCardCd + "<br>");
	out.println("ī�屸��                  : " + sCardType      + "<br>");
	out.println("������ü �����ָ�         : " + sBankAccountNm + "<br>");
	////////////////////////////////////////////////////////////////////// 

  }else{   
	 // reply_cd �� "0000" �ƴҶ��� ���� (�ڼ��� ������ �Ŵ�������)
    // reply_msg �� ���п� ���� �޼���
    out.println("����ڵ�               : " + sReplyCd  + "<br>");
    out.println("����޼���             : " + sReplyMsg + "<br>");
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
	<input type="hidden" name="applyChk" id="applyChk" value="N"/><!-- ���� �ߺ��������� -->
	<input type="hidden" name="multipleCancelYn" id="multipleCancelYn" value="N" />
	<input type="hidden" name="startDate"  id="startDate" value="<%=request.getParameter("startDate")%>">
	<input type="hidden" name="endDate"  id="endDate" value="<%=request.getParameter("endDate")%>">
	<input type="hidden" name="fileid"  id="fileid" value="">
	<input type="hidden" name="fileseq"  id="fileseq" value="">
	<input type="hidden" name="applyYn"  id="applyYn" value="<%=request.getParameter("applyYn")%>">
	<input type="hidden" name="logUserNo" id="logUserNo"  value="<%=request.getParameter("logUserNo")%>"/>
	<input type="hidden" name="logUserId" id="logUserId"  value="<%=request.getParameter("logUserId")%>"/>
	<input type="hidden" name="allat_order_no" id="allat_order_no"  value="<%=request.getParameter("allat_order_no")%>"/>	
	<!-- ���ǽ� �̵� -->
	<input type="hidden" name="paramcSeqNo" id="paramcSeqNo"  value="<%=request.getParameter("paramcSeqNo")%>"/>
	<input type="hidden" name="paramCourseNo" id="paramCourseNo"  value="<%=request.getParameter("paramCourseNo")%>"/>
	<input type="hidden" name="paramcUserNo" id="paramcUserNo"  value="<%=request.getParameter("paramcUserNo")%>"/>
	<input type="hidden" name="CLASSDESK" id="CLASSDESK"  value="<%=request.getParameter("CLASSDESK")%>"/>
	<input type="hidden" name="paramcMtScCode" id="paramcMtScCode"  value="<%=request.getParameter("paramcMtScCode")%>"/>	
	<input type="hidden" id="fileSubmitYn" value="<%=request.getParameter("fileSubmitYn")%>"/>	
	<!-- �̵�� -->
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
					alert("������ �����߽��ϴ�.");
					apply_course();
				}
				else{
					fnModalMsg("������ �����߽��ϴ�.",function(result){
						apply_course();
					});
				}
			<%
				}
			else if(pType.equals("VBANK")){
			%>
					<%-- var txt = "";
					txt += "������ �Ա�(�������)</br>";
					txt += "</br>���¹�ȣ :"+<%=sAccountNo%>;
					txt += "</br>�ݾ� : "+<%=sAmount%>+"��";
					txt += "</br>�Աݱ����� : "+<%=sIncomeLimitYmd%>;
					fnModalMsg(txt,function(result){
						location.href = "/main/main.do";					
					}); --%>
			<%
			} 
		}
		else if(pCd.equals("TT0002")){
			if(pType.equals("3D") || pType.equals("ISP") || pType.equals("ABANK")){%>
				if(isMobile()){
					alert("������ �����߽��ϴ�.");
					location.href = "/main/main.do";
				}
				else{
					fnModalMsg("������ �����߽��ϴ�.",function(result){
						location.href = "/main/main.do";
					});
				}
			<%
				}
			else if(pType.equals("VBANK")){
			%>
					<%-- var txt = "";
					txt += "������ �Ա�(�������)</br>";
					txt += "</br>���¹�ȣ :"+<%=sAccountNo%>;
					txt += "</br>�ݾ� : "+<%=sAmount%>+"��";
					txt += "</br>�Աݱ����� : "+<%=sIncomeLimitYmd%>;
					fnModalMsg(txt,function(result){
						location.href = "/main/main.do";					
					}); --%>
			<%
			} 
		}
	}else{%>
		fnModalMsg("������ �����߽��ϴ�.",function(result){
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