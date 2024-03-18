<%
/****************************************
    subject : 온라인교육
    summary : 온라인교육 > 과정 상세
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<%@ include file="/WEB-INF/jsp/inc/top_inc.jsp"%>
<% pageContext.setAttribute("newline", "\n"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 강의소개 > <c:out value="${rowData.MT_SC_NAME}"/></title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>

	<script type="text/javascript">
		$(document).ready(function(){
			$('.modal-backdrop').click(function(){
				$('.modal-backdrop').hide();
				$('#layer_01').attr('style','display:none;');
				$('#layer_02').attr('style','display:none;');
			})
		});
		
		function ftn_reject(){
			fnModalMsg('수강신청 기간이 아닙니다.');
		}
		
		//결제
		function ftn_approval(){
			if($("#courseOpen").val() == "D"){
				if($("#courseAble").val() == "N"){
					fnModalMsg('수강신청 기간이 아닙니다.');
					return;				
				}
			}	
			//$("#frm").attr("action", "/online/onlinePayment.do");
			$("#frm").attr("action", "/payment/main.do");
			$("#frm").submit();
		}
		
		// 결과값 반환( receive 페이지에서 호출 )
		function result_submit(result_cd,result_msg,enc_data) {
			// 결제창 자동종료 체크 종료
			AllatPay_Closechk_End();
			if( result_cd != '0000'){
				fnModalMsg("결제에 실패했습니다.");
			} else {
				fm.allat_enc_data.value = enc_data;
				fm.action = "/online/onlinePayApprove.do";
				fm.method = "post";
				fm.target = "_self";
				fm.submit();
			}
		}
		
		function fnList() {
			$("#cseqno").val("");
			$("#courseno").val("");
			$('#frm').attr('target', '_self').attr('action', '/online/onlineDetailList.do').submit();
		}
		
		function fnLogin(){
			$('#returnUrl').val("/online/onlineDetailForm.do");
			$('form[name=frm]').attr('action', '/user/login.do').submit();
		}
		
		//파일다운로드
		function filedown(fileid, fileseq){
			$('#fileid').val(fileid);
			$('#fileseq').val(fileseq);
			$('form[name=frm]').attr('action', '/academy/course/filedown.do').submit();
		}
		
		//수강신청ajax
		var submitted = false;
		function fnSaveAjax(pthis){		
			if($('#logUserNo').val() == 0 && $('#logUserId').val() == ""){
				fnModalMsg("로그인이 필요합니다.");
			}
			else if($('#applyYn').val() == 'Y'){
				$("#frm").attr("action", "/myclass/learningStatusList.do");
				$("#frm").submit();
			}
			else{
				$(window).bind('touchmove',function(e){e.preventDefault()});
		
				if(submitted == true) { 
					fnModalMsg('수강신청 처리중 입니다. 잠시만 기다려주세요.');
					return; 
				}
				
				if($("#courseOpen").val() == "D"){
					if($("#courseAble").val() == "N"){
						fnModalMsg('수강신청 기간이 아닙니다.');
						return;				
					}
				}	
				fnConfirm("수강신청 하시겠습니까?",function(result){
					if(result){
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
				});
			}
		}
	</script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->

	<!-- container -->
	<div id="container">
		<div class="con_center">
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title"><c:out value="${title}"/></h3>
				</div>			
			</div>	
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<form name="frm" id="frm" action="/myclass/learningClassList.do" method="post">	
							<input type="hidden" name="seq" id="seq" value="<c:out value="${REQUEST_DATA.seq}"/>"/>	
							<input type="hidden" name="productCd" value="TT0001"/>							
							<input type="hidden" name="returnUrl" id="returnUrl" value=""/>
							<input type="hidden" name="goodname" id="goodname" value="<c:out value="${rowData.SEQ_TITLE}"/>"/>
							<input type="hidden" name="mtScName" id="mtScName" value="<c:out value="${rowData.MT_SC_NAME}"/>"/>
							<input type="hidden" name="searchWord" id="searchWord" value=""/> 
							<input type="hidden" name="cseqno" id="cseqno"  value="<c:out value="${rowData.CSEQNO}"/>"/>
							<input type="hidden" name="searchCseqno" id="searchCseqno"  value="<c:out value="${rowData.CSEQNO}"/>"/>
							<input type="hidden" name="courseno" id="courseno"  value="<c:out value="${rowData.COURSENO}"/>"/>
							<input type="hidden" name="cuserno" id="cuserno"  value="<c:out value="${rowData.CUSERNO}"/>"/>
							<input type="hidden" name="targetYn" id="targetYn"  value="<c:out value="${rowData.TARGETYN}"/>"/>
							<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value='${REQUEST_DATA.mtScCode}'/>"/>
							<input type="hidden" name="mtCtypeCode" id="mtCtypeCode" value="<c:out value="${REQUEST_DATA.mtCtypeCode}"/>"/>
							<input type="hidden" name="ref1" id="ref1" value="<c:out value="${REQUEST_DATA.ref1}"/>"/>
							<input type="hidden" name="applyChk" id="applyChk" value="N"/><!-- 과정 중복수강방지 -->
							<input type="hidden" name="multipleCancelYn" id="multipleCancelYn" value="N" />
							<input type="hidden" name="startDate"  id="startDate" value="<c:out value="${rowData.STUDY_SDATE}"/>">
							<input type="hidden" name="endDate"  id="endDate" value="<c:out value="${rowData.STUDY_EDATE}"/>">
							<input type="hidden" name="fileid"  id="fileid" value="">
							<input type="hidden" name="fileseq"  id="fileseq" value="">
							<input type="hidden" name="applyYn"  id="applyYn" value="<c:out value="${rowData.APPLY_YN}"/>">
							<input type="hidden" name="courseOpen"  id="courseOpen" value="<c:out value="${rowData.OPENTYPE}"/>">
							<input type="hidden" name="courseAble"  id="courseAble" value="<c:out value="${applyAb}"/>">							
							<input type="hidden" name="logUserNo" id="logUserNo"  value="<c:out value="${REQUEST_DATA.SES_USERNO}"/>"/>
							<input type="hidden" name="logUserId" id="logUserId"  value="<c:out value="${REQUEST_DATA.SES_USERID}"/>"/>
							
							<!-- 강의실 이동 -->
							<input type="hidden" name="paramcSeqNo" id="paramcSeqNo"  value="<c:out value="${rowData.CSEQNO}"/>"/>
							<input type="hidden" name="paramCourseNo" id="paramCourseNo"  value="<c:out value="${rowData.COURSENO}"/>"/>
							<input type="hidden" name="paramcUserNo" id="paramcUserNo"  value="<c:out value="${rowData.CUSERNO}"/>"/>
							<input type="hidden" name="CLASSDESK" id="CLASSDESK"  value="<c:out value="${rowData.CLASS_DESK}"/>"/>
							<input type="hidden" name="paramcMtScCode" id="paramcMtScCode"  value="<c:out value="${rowData.MT_SC_CODE}"/>"/>		
							
							<!-- 미디어 -->					
							<input type="hidden" name="fileSubmitYn"  id="fileSubmitYn" value="<c:out value="${rowData.FILE_SUBMIT_YN}"/>"/>
	                 		<input type="hidden" name="filePath" id="filePath" value="<c:out value="${REQUEST_DATA.FILE_PATH}"/>"/>
							<input type="hidden" name="mediaFile" id="mediaFile" value="<c:out value="${REQUEST_DATA.MEDIA_FILE}"/>"/>
							<input type="hidden" name="progressChk" id="progressChk" value="false"/>
							<input type="hidden" name="mediaPath" id="mediaPath" value="<c:out value="${rowData.COURSENO}"/>">		
										
							<div class="c_section">
								<h4 class="c_tit">기본정보</h4>
								<div class="table_style_row">
									<table>
										<caption>항목을 보여줍니다.</caption>
										<colgroup>
											<col class="col2_1" />
											<col />
										</colgroup>
										<tr>
											<th scope="row">강의명</th>
											<td><c:out value="${rowData.SEQ_TITLE}"/></td>
										</tr>
										<tr>
											<th scope="row">수강대상</th>
											<td><c:out value="${rowData.ATARGET}"/></td>
										</tr>
										<c:if test="${rowData.OPENTYPE eq 'A'}">									
											<tr>
												<th scope="row">진행방식</th>
												<td>상시운영</td>
											</tr>							
											<tr>
												<th scope="row">학습일수</th>
												<td>${rowData.EDUDAY_DEL}일</td>
											</tr>
										</c:if>	
										<c:if test="${rowData.OPENTYPE eq 'D'}">								
											<tr>
												<th scope="row">진행방식</th>
												<td>기간운영</td>
											</tr>
											<tr>
												<th scope="row">신청기간</th>
												<td>${rowData.APPLY_SDATE} ~ ${rowData.APPLY_EDATE}</td>
											</tr>								
											<tr>
												<th scope="row">교육기간</th>
												<td>${rowData.STUDY_SDATE} ~ ${rowData.STUDY_EDATE}</td>
											</tr>
										</c:if>		
									</table>
								</div>
							</div>
							
							<div class="c_section" style="margin-top:100px;">
								<h4 class="c_tit">상세정보</h4>
								<div class="table_style_row">
									<table>
										<caption>교육소개, 교육대상, 교육기간, 평가방법, 수료기준점수, 커리큘럼, 첨부파일, 자막등 항목을 보여줍니다.</caption>
										<colgroup>
											<col class="col2_1" />
											<col />
										</colgroup>
										<tr>
											<th scope="row">강의소개</th>
											<td><c:out value="${fn:replace(rowData.RESULT_DESCRIPTION, newline, '<br>')}" escapeXml="false"/></td>
										</tr>										
										<tr>
											<th scope="row">수강료</th>
											<td>
												<c:if test="${rowData.PRICE_FK > 0}">
													<span style="text-decoration:line-through;">
														<c:out value="${rowData.PRICE_DEL}"/>원
													</span>
												</c:if>
												<span style="color:red;font-weight:bold;">
													<c:out value="${rowData.PRICE_DEL - rowData.PRICE_FK}"/>원
													<input type="hidden" name="price" value="<c:out value="${rowData.PRICE_DEL - rowData.PRICE_FK}"/>"/>
												</span>
											</td>
										</tr>							
										<tr>
											<th scope="row">강의목록</th>
											<td>
												<ol>
													<li><c:out value="${fn:replace(rowData.RESULT_EX_DESCRIPTION, newline, '<br>')}" escapeXml="false"/></li>
												</ol>
											</td>
										</tr>
									</table>
								</div>
							</div>
							<c:if test="${not empty bookInfo}">			
								<div class="c_section" style="margin-top:100px;">
									<h4 class="c_tit">교재정보</h4>
									<c:forEach items="${bookInfo}" var="bookInfo" varStatus="stat">	
										<div class="table_style_row book_info_table">
											<table>
												<colgroup>
													<col width="30%"/>
													<col width="10%"/>
													<col width=""/>
												</colgroup>
												<tr>
													<td rowspan="6" class="book_info_img"><img style="max-width:100%;" src="/att_file/book/<c:out value="${bookInfo.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>" /></td>
													<th scope="row">도서명</th>
													<td><c:out value="${bookInfo.TITLE}"/></td>
												</tr>
												<tr>
													<th scope="row">저자</th>
													<td><c:out value="${bookInfo.B_WRITER}"/></td>
												</tr>
												<tr>
													<th scope="row">출판사</th>
													<td><c:out value="${bookInfo.B_COMP}"/></td>
												</tr>
												<tr>
													<th scope="row">페이지</th>
													<td><c:out value="${bookInfo.B_PAGE}"/></td>
												</tr>
												<tr>
													<th scope="row">발행일</th>
													<td><c:out value="${bookInfo.B_PUBD}"/></td>
												</tr>
												<tr>
													<th scope="row">ISBN</th>
													<td><c:out value="${bookInfo.B_ISBN}"/></td>
												</tr>	
											</table>
										</div>
									</c:forEach>
								</div>
							</c:if>
	
							<div class="c_btn_center">
								<!-- 회원 -->
							    <c:if test = "${ REQUEST_DATA.SES_USERID ne '' }">
								    <c:choose>
										<c:when  test="${rowData.APPLY_YN eq 'Y'}">
											<button type="button" class="btn_bluebg03" onclick="fnSaveAjax();return false;">강의실 이동</button>
										</c:when>
										<c:otherwise>				   				
											<c:choose>
												<c:when test="${applyAb eq 'A'}">
									   				<c:if test = "${rowData.PRICE_DEL < 1000}">
														<button type="button" class="btn_bluebg03" onclick="fnSaveAjax();return false;" >신청하기</button>
													</c:if>				   				
									   				<c:if test = "${rowData.PRICE_DEL >= 1000}">
														<button type="button" class="btn_bluebg03" onclick="ftn_approval();return false;" >신청하기</button>
													</c:if>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn_bluebg03" onclick="ftn_reject();return false;" >신청하기</button>
												</c:otherwise>
											</c:choose>															
										</c:otherwise> 
									</c:choose>
							    </c:if>					    
								<!-- 비회원 -->
								<c:if test = "${REQUEST_DATA.SES_USERID eq '' }">
									<button type="button" class="btn_bluebg03" data-tooltip="alertpop01">신청하기</button>
								</c:if>						
								<button type="button" class="btn_blueline03" onclick="history.back(); return false;" title="뒤로가기">뒤로가기</button>
							</div>
		
							<!-- layer pop -->
							<div class="layerpop alertpop01" tabindex="0" data-tooltip-con="alertpop01" data-focus="alertpop01" data-focus-prev="alertpop01-close">
								<div class="layer_mask tooltip-close"></div><!-- 블랙mask영역 -->
								<div class="layer_cont">
									<div class="lc_head"></div>
									<div class="lc_cont">		
										<p class="alert_txt">학습을 수강하시려면 로그인이 필요합니다.<br />로그인 페이지로 이동하시겠습니까?</p>		
										<div class="p_btn_center">
											<a href="#none" class="btn_graybg02 tooltip-close">취소</a>
											<a href="#none" onclick="fnLogin();return false;" class="btn_bluebg02">확인</a>
										</div>		
									</div>
								</div>
								<button class="btn_close tooltip-close" data-focus="alertpop01-close" data-focus-next="alertpop01">닫기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--// container -->

	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->
</body>
</html>