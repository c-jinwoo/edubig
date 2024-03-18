<%
/****************************************
    subject : 나의학습실
    summary : 나의학습실 > 나의 학습현황 
    author  : SANGS
    date    : 2018-06-15
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>강의실 > 나의학습실 > 의료평가기관인증원</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>

<script type="text/javascript">
$(document).ready(function(e){
	$('input:radio').bind('click', function(e){
		//한문제당 하나의 보기만 선택할 수 있게
		var qno = $(this).attr('radio');
		$('.question input[radio^="'+qno+'"]').not(this).prop('checked', false);
	});


	var radioQno = new Array(); // 문제 번호
	var radioArr = new Array(); // 선택 답
	
	var keyValue = {}; // 선택 값 임시 저장 
	
	var question = new Array();
	var temp = [];
	
	var count = $("#itemCnt2").val(); // 객관식 문제 개수
	
	$("body").on("click",".btnSvy",function(){
		
		question.push($(this).attr('radio'));
		
		$.each(question, function(key, value){
			if($.inArray(value, temp) === -1){
				temp.push(value);
			}
		});
		
		if(temp.length <= count){
			
			
			for(var i = 0; i < temp.length; i++){
				
				keyValue[$(this).attr('radio')] = $(this).val();
				
			}
			$("#check").val(Object.keys(keyValue).length);
			
			if($("#itemCnt2").val() == $("#check").val()){
					
				for(key in keyValue){
					radioQno.push(key);
					radioArr.push(keyValue[key]);
						
				}

				for(var i = 0; i < $("#check").val(); i++){
					if(radioQno[i] == $(this).attr('radio')){
							radioQno = new Array();
							radioArr = new Array();
							$("#radioQno").val("");
							$("#radioArr").val("");
					}
				
				}
				
				for(key in keyValue){
					radioQno.push(key);
					radioArr.push(keyValue[key]);
						
				}
				
				$("#radioQno").val(radioQno);
				$("#radioArr").val(radioArr);
			}
		}
		
	});
	
});

function fnApply(){
	
	//주관식 문항 
	var textQno = new Array();
	var textArr = new Array();
	
	
	var input = $(".testInput");
	
	for(var i = 0; i< input.length; i++){
		if(input[i].value !=""){

			textArr.push(new String(input[i].value));
			textQno.push(input[i].name);
		} 
	}
	if(textArr.length != input.length){
		fnModalMsg('누락된 항목이 있습니다. \n모든 항목에 정답을 입력해주세요.');
		return false;
	} else {
		$("#textQno").val(textQno);
		$("#textArr").val(textArr); 
	}


	var cnt = $('input[radio]').length / 5;
	var valCnt = 0;
	var radioQno = new Array();	
	var radioArr = new Array();	


	$('input[radio]').each(function(i, val) {
		
		if ($(this).is(':checked')) {
			valCnt++;
			radioQno.push($(this).val());
			radioArr.push($(this).attr('radio'));
		}
	});
	
	//라디오 버튼 체크
	if(cnt != valCnt){
		fnModalMsg('누락된 항목이 있습니다. \n모든 항목에 정답을 입력해주세요.');
		return false;
	}

	$("#radioQno").val(radioQno);
	$("#radioArr").val(radioArr);	
	
	//응답수 +1
	var cnt = Number($("#cnt").val()) + 1;
	$("#cnt").val(cnt); 
	
	fnConfirm("제출한 설문은 수정할 수 없습니다.<br/>제출하시겠습니까?",function(result){
		if(result){
			$("#markingForm").submit();	
		}
	});
	
}
</script>

</head>

<body>

<!-- skip nav -->
	<%@ include file="/WEB-INF/jsp/inc/nav_inc.jsp"%>
<!--// skip nav -->


<div id="wrap">

	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->

	<!-- container -->
	<div id="container">

		<!-- location -->
		<jsp:include page="/WEB-INF/jsp/inc/location/loc_06_01.jsp"> 
		  	<jsp:param name="menuNm" value="강의실 설문"/> 
		</jsp:include> 
		<!--// location -->
		<!--// location -->

		<div class="con_center">

			<!-- lnb -->
			<div id="lnb">
				<jsp:include page="/WEB-INF/jsp/inc/lnb/lnb_06.jsp"> 
				  	<jsp:param name="dep2" value="02"/>
				</jsp:include> 
			</div>
			<!--// lnb -->
			
			<!-- content 본문 -->		
			<div id="content">
				
				<!-- 기존 START 2018-08-30  -->
<!-- 				<h3 class="cont_titile">설문조사</h3> -->
				<!-- 기존 END 2018-08-30  -->
				
				<!-- 2018-08-28 김동인 작업 S --> 
				<h3 class="cont_titile type06">설문조사<span></span></h3>
				<!-- 2018-08-28 김동인 작업 E -->
					
				<!-- 본문내용 -->
				<div class="cont_body">
					<!-- start -->
					
					<div class="c_section">
						<h4 class="c_tit">설문조사 참여방법 안내</h4>
						<div class="txt_introbox">
							<h5>5점척도</h5>
							<p>설문 문항을 읽고 본인이 생각하는 항목을 골라주세요.<br />(매우 아니다 =1, 아니다 =2. 보통이다 =3, 그렇다 =4, 매우 그렇다 =5)</p>
							<h5>서술형</h5>
							<p>설문 문항을 읽고 본인이 생각하는 의견을  자유롭게 적어주세요.</p>
						</div>
					</div>
					
					<div class="c_section">

						<form id="markingForm" name="markingForm" action="/classdesk/user/poll/exec.do" method="post">
							<input type="hidden" name=pollcseqno id="pollcseqno"	value="<c:out value="${REQUEST_DATA.pollcseqno}"/>"> 
							<input type="hidden" name="CLASSDESK" id="CLASSDESK"	value="<c:out value="${REQUEST_DATA.CLASSDESK}"/>" /> 
							<input type="hidden" name="paramCourseNo" id="paramCourseNo"	value="<c:out value="${REQUEST_DATA.SES_COURSENO}"/>" /> 
							<input type="hidden" name="paramcSeqNo" id="paramcSeqNo"value="<c:out value="${REQUEST_DATA.SES_CSEQNO}"/>" /> 
							<input type="hidden" name="paramcUserNo" id="paramcUserNo"value="<c:out value="${REQUEST_DATA.SES_CUSERNO}"/>" />
							<input type="hidden" name="paramcMtScCode" id="paramcMtScCode"value="<c:out value="${REQUEST_DATA.mtScCode}"/>" />
						
							<input type="hidden" id="courseSelect" name="courseSelect" value="<c:out value="${REQUEST_DATA.courseSelect}"/>"/>
							
							<input type="hidden" id="itemCntQno" value="<c:out value="${itemCntQno[0]}"/>" />	
							<input type="hidden" id="itemCnt2"	value="<c:out value="${itemCnt2}"/>" />	
							<input type="hidden" name="radioQno" id="radioQno" /> 
							<input type="hidden" name="radioArr" id="radioArr" /> 
							<input type="hidden" name="checkboxQno" id="checkboxQno" /> 
							<input type="hidden" name="checkboxArr" id="checkboxArr" /> 
							<input type="hidden" name="textQno" id="textQno" /> 
							<input type="hidden" name="textArr" id="textArr" /> 
							<input type="hidden" name="cnt" id="cnt" value="<c:out value="${REQUEST_DATA.cnt}"/>" /> 
							<input type="hidden" id="seqTitle" name="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
							<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
							
							<input type="hidden" id="check" value=""/> <!-- 객관식 체크 여부 변수 -->


							<c:forEach var="itemCnt" items="${itemCnt}" varStatus="stat">
								<input type="hidden" id="itemCntQNO${stat.index}" value="<c:out value="${itemCnt.QNO}"/>" />
								<input type="hidden" id="itemCnt${stat.index}" value="<c:out value="${itemCnt.ITEMCNT}"/>" />
							</c:forEach>

							<h4 class="c_tit"> <c:out value="${REQUEST_DATA.seqTitle}"/></h4>

							<div class="survey_box first">

								<c:forEach var="moduleList" items="${moduleList}"	varStatus="status1">
									<h5 class="title"><span>[ 설문 ${status1.count} ]</span> <c:out value='${moduleList.CPOLL_TITLE}' /></h5>
									<c:forEach var="questionList" items="${questionList}"	varStatus="status2">
										<c:if test="${moduleList.CPOLL_TITLE == questionList.CPOLL_TITLE}">
											<input type='hidden' id='countItem'  >
											<input type='hidden' id='qno'	value="<c:out value='${questionList.QNO}'/>" /> 
											<input type='hidden' id='doubleAtyn' >
											<input	type='hidden' id='cpollTitleValue' > 
											
											<ul class="survey_list">
												<!-- 주관식 -->
												<c:if test="${questionList.MT_CPOLL_CODE eq 'JBAA00'}">
													<li>
														<p><c:out value='${status2.count}' />. <c:out value='${questionList.SUBJECT}' /></p>
														<div class="survey_textarea">
															<textarea cols="100" rows="100" id="l-school" name="${questionList.QNO}" placeholder="내용을 입력해주세요." title="<c:out value='${questionList.SUBJECT}' />" class="testInput"></textarea>
														</div>
													</li>
												</c:if>
												<!-- 객관식 -->
												<c:if test="${questionList.MT_CPOLL_CODE ne 'JBAA00'}">
													<c:set value="1" var="count" />
													<li>
														<p><c:out value='${status2.count}' />. <c:out value='${questionList.SUBJECT}' /></p>
														<div class="sel_points">
															<h6 class="alt_text">점수선택</h6>
															<c:set value="1" var="count" />
															<c:forEach var="resultList" items="${resultList}" varStatus="status3">
																<c:if test="${questionList.QNO == resultList.QNO}">
																	<c:if	test="${resultList.ITEM_SUBJECT != null && resultList.ITEM_SUBJECT != ''}">
																		<c:if test="${questionList.MT_CPOLL_CODE eq 'JBBA00'}">
																			<input type="radio" name="test${status2.count}" id="radio${status1.count}${status3.count}" radio="${questionList.QNO}" value="${resultList.ITEMNO}" title="객관식답변" class="btnSvy"/>
																			<label for="radio${status1.count}${status3.count}">${count}</label>
																			<c:set var="count" value="${count+1 }" />
																		</c:if>
																	</c:if>
																</c:if>
															</c:forEach>
															<c:if test="${count == 5 }">
																<c:set var="count" value="1" />
															</c:if>
														</div>
													</li>
												</c:if>

												<!-- 테스트 -->
												<!-- <li>
													<p>3. 신용회복위원회 실무과정이 도움이 되나요?</p>
													<div class="survey_textarea">
														<textarea cols="" rows="" placeholder="내용을 입력해주세요." title="이번 교육의 좋은점을 입력해주세요."></textarea>
													</div>
												</li>
												<li>
													<p>4. 신용회복위원회 실무과정이 도움이 되나요?</p>
													<div class="sel_points">
														<h6 class="alt_text">점수선택</h6>
														<input type="radio" id="s2_1" name="s2" /><label for="s2_1">1</label>
														<input type="radio" id="s2_2" name="s2" /><label for="s2_2">2</label>
														<input type="radio" id="s2_3" name="s2" /><label for="s2_3">3</label>
														<input type="radio" id="s2_4" name="s2" /><label for="s2_4">4</label>
														<input type="radio" id="s2_5" name="s2" /><label for="s2_5">5</label>
													</div>
												</li> -->
												<!-- //테스트 -->
											</ul>
										</c:if>
									</c:forEach>
								</c:forEach>

								</form>
							</div>

						<!-- <div class="survey_box">
							<h5 class="title"><span>[ 설문 2 ]</span> 이번 교육의 좋은점은 무엇입니까?</h5>
							<div class="survey_textarea"> 
								<textarea cols="" rows="" placeholder="내용을 입력해주세요." title="이번 교육의 좋은점을 입력해주세요."></textarea>
							</div>
						</div> -->

						<div class="c_btn_center">
							<button type="button" onclick="fnApply();return false" class="btn_bluebg03">설문조사 참여하기</a>
						</div>

					</div>

					<!--// end -->
				</div>
				<!--// 본문내용 -->
				
			<!--  -->
			</div>
			<!--// content 본문 -->

		
		</div>
	</div>
	<!--// container -->

	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->

</div>

</body>
</html>