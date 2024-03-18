<%
/****************************************
    subject : 나의학습실
    summary : 나의학습실 > 강의실
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>에듀빅 :: 나의강의실</title>
<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
</head>
<body>
<script  type="text/javascript"> 
	var progCodeEnd = "";
	var eduseqYn = '${REQUEST_DATA.eduseqYn}';
	var aryData1 = new Array;
	var aryData2 = new Array;
	var aryData3 = new Array;
	var aryData4 = new Array;
	var aryData5 = new Array;
	var aryData6 = new Array;
	var aryData7 = new Array;
	
	<c:forEach var="result" items="${onResultList}" varStatus="status">
		aryData1.push('${result.FILE_PATH}');   // 경로
		aryData2.push('${result.MEDIA_FILE}');  // mp4 파일명
		aryData3.push('${result.VAL}');  //
		aryData4.push('${result.TREENO}');     // 목차코드
		aryData5.push('${result.STUDYTIME}'); // 학습시간
		aryData6.push('${result.SDAY}'); // 페이지
		aryData7.push('${result.MT_PROG_STATUS_CODE}'); //합격 여부
	</c:forEach>

	$(document).ready(function(e){
		
		progCodeEnd = '<%=SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END")%>';
	
		var d = new Date();
		var sysdate = d.getFullYear() +'-'+ Number(d.getMonth()+1)+'-'+d.getDate();
	    $(".edate").each(function(i, val) { 
	    	var edate = new Date($(this).val());
	    	if(d > edate) {
	    		$(this).parents(".btnAreaC").find("a").attr('class','btn btn-sm btn-gray join');
	    		$(this).parents(".btnAreaC").find("a").text('기간종료');
	    	}
		});
		
		var checkArr = new Array;
		var histDataArr = new Array;
		var cnt = 0; 
		
		$(".join").each(function(i, val) {
			var check = $(this).attr('check');
			checkArr.push(check);
		});
		
		for(var i = 0 ; i < $("#histDataCheck").val() ; i++) {
			//console.log($("#histData"+i).val());
			histDataArr.push($("#histData"+i).val());
		}
		
		for(var i = 0 ; i < checkArr.length ; i++) {
			//console.log("참여완료최초진입 길이="+checkArr.length);
			for(var j = 0 ; j < histDataArr.length ; j++){
				//console.log("0부터 길이 까지");
				if(checkArr[i] == histDataArr[j]){
					//console.log("일치값 확인");
					$("#"+ histDataArr[j]).attr('class','btn btn-drkblue btn-sm join');
					$("#"+ histDataArr[j]).text('참여완료');
				}
			}
		}
	
		
	});
	
	
	var arySeqTitle = new Array;
	var aryCseqNo = new Array;
	var arryMtScCode = new Array;
	var arryClassDesk = new Array;
	var arryEduseqYn = new Array;

	<c:forEach var="result" items="${seqList}" varStatus="status">
		arySeqTitle.push('${result.SEQ_TITLE}');     //타이틀
		aryCseqNo.push('${result.CSEQNO}');  		 // 코드
		arryMtScCode.push('${result.MT_SC_CODE}');   // 과정구분 코드
		arryClassDesk.push('${result.CLASS_DESK}');  // 클래스데스크(학습, 시험, 설문)
		arryEduseqYn.push('${result.EDUSEQ_YN}');    // 순차여부
	</c:forEach>

	function selectCh(pthis){	
		var append = '';
		var arryIdx = 0;
		var idx = 0;
	
		for(var i = 0; i < arryMtScCode.length ; i++){
			if($(pthis).val() == arryMtScCode[i]){
				if(idx < 0){
					idx++
					arryIdx = i; 
				}
				append += '<option value="'+aryCseqNo[i]+'"> '+arySeqTitle[i]+'</option>';
			}
		}
		$('#cseqno').find('option').remove();
		$('#cseqno').append(append);	
	}
	
	function pad(nVal) {
		var tmp = ""+nVal;
		if (tmp.length < 2) {
			return "0"+tmp;
		} else {
			return tmp;
		}
	}

	function getToday() {
		var dt = new Date();
		var yyyy = ""+dt.getFullYear();
		var mm = pad(dt.getMonth()+1);
		var dt = pad(dt.getDate());
		
		return yyyy + "-" + mm + "-" + dt;
	}

	$(document).ready(function(){
		//간이메뉴 클릭시 원 헤더 복원
		//헤더열기	
		$('.menu_toggle').click(function(){
			//$('.menu_toggle').css('display', 'none');
			if($('#pmode').val() == 'E'){
				$('.menu_toggle_close').slideDown(500);
			}
		});
		//헤더 닫기
		$('.menu_toggle_close').click(function(){
			if($('#pmode').val() == 'E'){
				$('.menu_toggle_close').slideUp(500);
			}
			//$('.menu_toggle').css('display', 'block');
		});
	});
	
	//진도프로세스
	function progExec(cuserno, treeno, sday, studytime, totalEduTime){
	    $.ajax({
	        url : "/myclass/ajaxProgressCheck.do",
	        data : { cuserno : cuserno
	               , treeno : treeno
	               , studytime : studytime 
	               , totalEduTime : totalEduTime
	               , sday : sday
	        	   },
	        dataType : "json",
	        type : 'post',
	        success : function(res) { 		  
	        	$("#frm").submit();
	        },
	        error : function(e) {
	        	fnModalMsg("중복 로그인으로 진도체크가 되지 않았습니다.",function(){
	        		$("#frm").attr("action", "/user/login.do");
	        		frm.submit();  
	        	});
	        }
	    }); 
	}	
	
	//진도 화면
	function fnView(idx){		
		$('#filePath').val(aryData1[idx].split("/")[3]);
		$('#mediaFile').val(aryData2[idx]);
		$('#val').val(aryData3[idx]);
		
		$('#treeno').val(aryData4[idx]);
		$('#studytime').val(aryData5[idx]);
		$('#sday').val(aryData6[idx]);
		
		var UserAgent = navigator.userAgent;
		var html = "index.html";
		window.open("/edudata/contents/"+$('#filePath').val()+"/"+$('#mediaFile').val()+"/index.html","mediaPop","width=1280,height=760,scrollbars=1,resizable=1");
	}
	function fnForms(examNo, cmd, edate, examTime, pupType){
		$("#examEdate").val(edate);
		$("#examTime").val(examTime);
		$("#pupType").val(pupType);

	   	var userPercent = parseInt('<c:out value="${examProgData}"/>'); 
	   	var onlineEdu = '<c:out value="${REQUEST_DATA.ONLINE_EDU}"/>'; 	   

	    // 시험 결과보기
		if(cmd == 'review_form'){
			$('#examNo').val(examNo);
			$('form[name=frm]').attr('action','/myclass/learningExamReviewForm.do').submit();
		} 
		else{
			if(onlineEdu != 'Y'){
				//fnModalMsg('온라인학습을 수료 해주시기 바랍니다.');return;
			} 
			$('#examNo').val(examNo);
			$('form[name=frm]').attr('action','/myclass/learningExamForm.do').submit();
		}
	}
	
	$(document).ready(function(){
		$('#schOnline').change(function() {
			$('#courseSelect').find('option').each(function() {
				$(this).remove();
			});

			$('#courseSelect').append('<option value="">선택</option>');

			var selectVal = $(this).val();
			if (selectVal != '') {
				var params = $('#frm').serialize();

				$.ajax({
				url : '/classdesk/main/mainSelect.do',
				type : "POST",
				data : params,
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.result.length; i++) {
						$('#courseSelect').append("<option value='"+data.result[i].CUSERNO+","+ data.result[i].CSEQNO+","+ data.result[i].COURSENO+","+ data.result[i].CLASS_DESK+","+ data.result[i].SEQ_TITLE+","+data.result[i].MT_CTYPE_NAME + "'" + "</option>"+data.result[i].SEQ_TITLE);
						}
					}	
				});
			}
		});
	});	
	function rvGo(query){
		$("#rvQuery").val(query);
		$("#rvFm").submit();
	}
</script>
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->

	<!-- container -->
	<div id="container">
		<div class="con_center">	
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title">강의실</h3>
				</div>			
			</div>
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<form name="frm" id="frm" action="/myclass/learningClassList.do" method="post">
						 	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
							<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
							<input type="hidden" name="bcateno" id="bcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
							<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
							<input type="hidden" name="select" id="select" value=""/> 
							<input type="hidden" name="searchWord" id="searchWord" value=""/>
							<input type="hidden" name="searchCseqno" id="searchCseqno"  value="<c:out value="${REQUEST_DATA.searchCseqno}"/>"/>
							<input type="hidden" name="courseno" id="courseno"  value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
							<input type="hidden" name="CLASSDESK" id="CLASSDESK" 	value="${REQUEST_DATA.CLASSDESK }"/>
							<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
							<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>						
							<input type="hidden" id="fileId" name="fileId" value=""/>
							<input type="hidden" id="fileSeq" name="fileSeq" value=""/>
	
							<!-- 미디어 -->
							<input type="hidden" name="filePath" id="filePath" value=""/>
							<input type="hidden" name="mediaFile" id="mediaFile" value=""/>
							<input type="hidden" name="treeno" id="treeno" value=""/>
							<input type="hidden" name="studytime" id="studytime" value=""/>
							<input type="hidden" name="sday" id="sday" value=""/>
							<input type="hidden" name="val" id="val" value=""/>
							<input type="hidden" name="cuserno" id="cuserno" value="${REQUEST_DATA.SES_CUSERNO}">
							<input type="hidden" name="mediaPath" id="mediaPath" value="${REQUEST_DATA.SES_COURSENO}">		
							<input type="hidden" name="SAVFILE" id="SAVFILE" value="<c:out value="${REQUEST_DATA.SAVFILE}"/>"/>
							<input type="hidden" name="SUBTITLE" id="SUBTITLE" value="<c:out value="${subTitle}"/>"/>
	
							<!-- 설문 -->
							<input type="hidden" name="pollcseqno" id="pollcseqno" value=""/> 
							<input type="hidden" name="cnt" id="cnt" value=""/>
							<input type="hidden" id="histDataCheck" value="<c:out value="${pollHistData2}"/>"/>
							
							<!-- 시험 -->
							<input type="hidden" name="subcmd" id="subcmd" value=""> 
							<input type="hidden" name="examNo" id="examNo" value=""> 
							<input type="hidden" name="examEdate" id="examEdate" value=""> 
							<input type="hidden" name="examTime" id="examTime" value=""> 
							<input type="hidden" name="pupType" id="pupType" value=""> 
							<input type="hidden" name="examType" id="examType" value=""> 
							<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>" /> 
							<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>" /> 
							<input type="hidden" name="openType" id="openType" value="<c:out value="${examRowData.OPENTYPE}"/>" />
	
							<div class="c_section">
								<h4 class="c_tit" id="conSection1">온라인학습</h4>
								<div class="table_style_col">
									<table>
										<caption>번호, 차수명, 진도율, 마지막 수강일, 학습하기 등 항목을 확인 할 수 있는 표 입니다.</caption>
										<thead>
											<tr>
												<th scope="col" class="num_col">No.</th>
												<th scope="col" class="subject_col">차시명</th>
												<th scope="col" class="page_col">수강현황</th>
												<th scope="col" class="date_col">수강날짜</th>
												<th scope="col" class="btn_col">학습</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${onResultList}" var="result" varStatus="stat">
												<tr>
													<input type="hidden" name="lastview" id="lastview${stat.count}" value="<c:out value="${result.STUDYTIME}"/>"/>
		                                			<td class="align_center">${stat.count}</td>
		                                			<td><c:out value="${result.SUBJECT}" default="-"/></td>		                                			
		                                			<td class="align_center">
		                                				<c:choose>
		                                					<c:when test="${result.STUDYTIME == 0 || result.STUDYTIME == null}">
		                                						-
		                                					</c:when>
		                                					<c:otherwise>
		                                						<c:out value="${result.STUDYTIME}"/> / <c:out value="${result.FRAMECNT}"/>
		                                					</c:otherwise>
		                                				</c:choose>
		                                			</td>
		                                			<td class="align_center"><c:out value="${result.EDATE}" default="-"/></td>
		                                			<td class="align_center">
		                                				<c:choose>
															<%-- <c:when test="${result.FRAMECNT == result.FRAMESEQ}"> --%> 
															<c:when test="${result.MT_PROG_STATUS_CODE eq 'PS0003'}"> 
																<button type="button" style="width:70px;" class="btn_bluebg  mobile_ico_book" onclick="fnView('${stat.index}');" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 복습하기" >복습하기</button>
															</c:when>
															<c:otherwise>
																<button type="button" style="width:70px;" class="btn_blueline mobile_ico_book" onclick="fnView('${stat.index}')" title="<c:out value="${stat.index + 1}" /> 차시 <c:out value="${result.SUBJECT}" /> 학습하기">학습하기</button>
															</c:otherwise>
														</c:choose>
		                                			</td>
		                                    	</tr>
											</c:forEach>
											<tr>
												<td colspan="5" class="align_center">
													<b class="txtbule">(유의사항)</b> <b>온라인 학습 도중에 ∥(일시정지) 또는 X(나가기)를 클릭하지 않고, 새창을 열게되면 진도율이 확인(인정)되지 않습니다.<br>
													온라인학습 도중 쉬어가고자하는 경우 반드시 ∥(일시정지), X(나가기)버튼을 이용하시기 바랍니다.</b>
												</td>
												</tr>
											<c:if test="${empty onResultList }">
												<tr>
													<td class="align_center" colspan="5">온라인 학습 데이터가 없습니다.</td>
												</tr>
											</c:if>
											
										</tbody>
									</table>
								</div>
							</div>							
						</form>
						
						<!-- 시험 선택 여부 -->
						<%-- <c:if test="${fn:substring(REQUEST_DATA.classDesk,2,3) eq '1' }">
							<div class="c_section">
								<h4 class="c_tit" id="conSection2">시험</h4>
								<div class="table_style_col">
									<table>
										<caption>번호, 시험명, 점수, 제출일, 시험보기 등 항목을 확인 할 수 있는 표 입니다.</caption>
										<colgroup>
											<col width="10%"/>
											<col width=""/>
											<col width="15%"/>
											<col width="20%"/>
											<col width="15%"/>
										</colgroup>
										<thead>
											<tr>
												<th scope="col" class="num_col">No.</th>
												<th scope="col" class="subject_col">시험명</th>
												<th scope="col">점수</th>										
												<th scope="col" class="date_col">제출일</th>
												<th scope="col" class="btn_col"></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${examListData}" var="result" varStatus="stat">
		                                	 	<tr>
													<td class="align_center">${stat.count}</td>
													<td class="align_center">${result.TITLE}</td>		
													<td class="align_center">
														<c:if test="${result.USER_SUBMITYN eq 'Y' }">
															<c:out value="${result.SCORE}" default="0"/> 점
		                                	 			</c:if>
		                                	 			<c:if test="${result.USER_SUBMITYN ne 'Y' }">
															-
		                                	 			</c:if>
													</td>										
													<td class="align_center">
														<c:if test="${result.USER_SUBMITYN eq 'Y' }">
															${result.EXAM_SDATE}
		                                	 			</c:if>
		                                	 			<c:if test="${result.USER_SUBMITYN ne 'Y' }">
															-
		                                	 			</c:if>
													</td>
													<td class="align_center">
														<c:choose>
															<c:when test="${result.USER_SUBMITYN eq 'Y' }">
																<button type="button" class="btn_bluebg mobile_ico_board_write_off" onclick="fnForms('<c:out value="${result.EXAMNO}"/>','review_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>'); return false;">결과보기</button>
															</c:when>
															<c:when test="${result.USER_SUBMITYN eq 'N' || empty result.USER_SUBMITYN}">
																<button type="button" class="btn_blueline mobile_ico_board_write_in" onclick="fnForms('<c:out value="${result.EXAMNO}"/>','exaim_form' , '<c:out value="${result.EDATE}"/>' , '<c:out value="${result.EXAM_TIME}"/>', '<c:out value="${result.PUB_TYPE}"/>', '<c:out value="${result.EXAM_TYPE}"/>'); return false;">시험보기</button>
															</c:when>
														</c:choose>
													</td>
												</tr>
		                                	 </c:forEach>
		                                	 <c:if test="${empty examListData}">
												<tr>
													<td class="align_center" colspan="5">시험 데이터가 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</c:if>   --%>
						
						<!-- 수강후기 -->
						<form name="rvFm" id="rvFm" action="/review/form.do" method="post">
							<input type="hidden" name="searchCseqno" id="searchCseqno"  value="<c:out value="${REQUEST_DATA.searchCseqno}"/>"/>
							<input type="hidden" name="courseno" id="courseno"  value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
							<input type="hidden" name="rvQuery" id="rvQuery" value=""/>
							<div class="c_section">
								<h4 class="c_tit" id="conSection4">수강후기</h4>
								<div class="reviews_list">
									<c:choose>
										<c:when test="${review == null}">
											<div class="reviews_box">
												<div class="reviews_box_cont">
													<div style="margin:0;" class="reviews_cont">
														수강후기를 작성해주세요.
													</div>
												</div>
											</div>
											<div class="rvGo_btn" onclick="rvGo('insert');return false;">작성하기</div>
										</c:when>
										<c:otherwise>
											<div class="reviews_box">
												<div class="reviews_box_cont">
													<div style="margin:0;" class="reviews_cont">
														<c:out value="${review.CONTENT}"/>
													</div>
												</div>
											</div>
											<div class="rvChange_btn" onclick="rvGo('update');return false;">수정하기</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>								
						</form>
					</div>
				</div>
			</div>			
		</div>
	</div>
		
	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->
</body>
</html>