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
<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
<script type="text/javascript">
   	var examTime = '<c:out value="${listData[0].EXAM_TIME_MS}"/>'; //제한시간 MMSS
   	var userExamTime = '<c:out value="${listData[0].USER_EXAM_TIME}"/>'; //응시시간 MMSS
   	var currentTime = 0;   	
   	//뒤로가기 막음
   	//history.pushState(null, null, location.href); 
   	window.onpopstate = function(event) { 
   		history.go(1);
   	}
   	$(document).ready(function(e){
		/* document.onkeydown = doNotReload; */ //새로고침 막음
   		
   		//var currentTop = parseInt($('#quickmenu').css('top'));

   		$(window).scroll(function() {
   			var currentTop = -250;
   			if($(window).scrollTop() < 275 ){
   				currentTop =  10;//parseInt($('#quickmenu').css('top'));
   			}
   			
   			$('#quickmenu').stop().animate({'top': $(window).scrollTop()+currentTop+'px'}, 500);
   			  
   		});
   		
   		currentTime = examTime - userExamTime; //현재 카운트
   		
   		/**************************************************
   		 이벤트명 :  $('#shortly').countdown
   		 설 명 : 카운트 이벤트
   		 일단 사용하지 않음
   		***************************************************/ 
   		/*  $('#shortly').countdown({until: currentTime, compact: true, description: '',  format: 'MS', layout: '{mn}:{sn}',
   			    onExpiry: liftOff, onTick: watchCountdown});  */
   		
   		/**************************************************
   		 이벤트명 : $('input:radio').bind('click', function(e){
   		 설 명 : 정답 오답 라디오 바인딩
   		***************************************************/ 
   		 $('input:radio').bind('click', function(e){
   			 var index = $(this).attr('itemSeq').replace('itemSeq',''); // 클릭한 인덱스
   			/*****************************************************
   				시험 답 바인딩 영역
   			*****************************************************/
   			var itemSeq = 'itemSeq'+index;
   			//객관식
   			if($('#qType'+index).val() == 2){
   				//$('#ans_'+index).html($('#itemSeq'+index +':checked').val()); 
   				$('#ans_'+index).html($(':radio[name='+itemSeq+']:checked').val()); 
   			
   			//OX
   			}else if($('#qType'+index).val() == 1){
   				
   				//if($('#itemSeq'+index +':checked').val() == 1){
   				if($(':radio[name='+itemSeq+']:checked').val() == 1){
   					$('#ans_'+index).html('O');
   				}else{
   					$('#ans_'+index).html('X');
   				}
   			}
   			fnSubmit(index);
   		});
   		 
   		 
   		 /**************************************************
   		 이벤트명 : $('input:text, textarea').bind('focusout', function(e){
   		 설 명 : 주관식 답 바인딩
   		***************************************************/ 
   	 	 $('input:text, textarea').bind('focusout', function(e){
   	 		var index = $(this).attr('id').replace('answer','');
   			$('#ans_'+index).html($('#answer'+index).val());
   			fnSubmit(index);
      	     }); 
   		 
   	});
   	
   	/* //응시시간 세팅
   	function fnExTimeControll(){
   		var sp = $('#shortly').html().split(':');
   		if(sp[0] != 0){
   			$('#examTime').val(examTime - (Number(sp[0])*60 + Number(sp[1]))); //응시시간
   			alert(sp[0]);
   		}else{
   			$('#examTime').val(examTime - Number(sp[1])); //응시시간
   			alert(sp[1]);
   		}
   	} */
   	
   	/**************************************************
   	 함수명 : fnSubmit
   	 설 명 : 실시간 정답 UPDATE 
   	***************************************************/ 
   	function fnSubmit(index){
   		//응시시간 세팅
   		//fnExTimeControll();
   		var itemSeq = 'itemSeq'+index;
   		$('#qNo').val($('#qNo'+index).val()); //문제번호
   		$('#qSeq').val($('#qSeq'+index).val()); //출제문제 순번
   		$('#qType').val($('#qType'+index).val()); //문제유형 : 1.OX 2.객관식 4.단답형 5.서술형
   		$('#answer').val($('#answer'+index).val()); //주관식응시답안
   		$('#itemSeq').val($(':radio[name='+itemSeq+']:checked').val()); //선택답안
   		//$('#itemSeq').val($('#itemSeq'+index +':checked').val()); //선택답안
   		$('#submitYn').val('N'); //제출여부(Y,N)

      $.ajax( {
          type : "POST", 
          url : "/classdesk/user/exam/ajaxSaveRealTmAns.do",
          data : $('#ansFrm').serialize(),
          dataType : "json",
          success : function( data ) {
            eval('fnSucces'); 
          }
      } );

   	}
      	 
   	function watchCountdown(periods) { 
   	    $('#monitor').text(periods[5] + '분' + periods[6] + '초'); 
   	}
   	
   	function showScrollTop(index){
   	    var val =$('.exam-list dl').eq(index).offset();
   	    $('body,html').animate({scrollTop:val.top},300);
   	    
   	}
   	
   	function fnSave(){
   		
   		var radioArr = new Array();
   		$(":radio").each(function(i, val) {
   			if ($(this).is(':checked')) {
   				radioArr.push($(this).val());
   			}
   		});
   		
   		if("${fn:length(listData)}" == radioArr.length){
   			$('#submitYn').val('Y'); 
	   			$('form[name=ansFrm]').attr('target', '_self').attr('action', '/classdesk/user/exam/submit_exec.do').submit();
   		}else {
   			fnModalMsg('누락된 항목이 있습니다. <br/>모든 항목에 정답을 입력해주세요');
   		}
   	}
   	
   	
   	function fnList() { 
   	    $('#subcmd').val('list');
   		$('form[name=ansFrm]').attr('target', '_self').attr('action', '/classdesk/user/exam/list.do').submit();
   	} 
     	
     	document.onkeydown = function(){
     	   	if(event.srcElement.type != 'text' && event.srcElement.type != 'textarea'){
     	   		if(event.keyCode == 116){
     	   			event.keyCode = 2;
     	   			return false;
     	   		}
     	  		else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)){
     	   			return false;
     	   		}else if(event.keyCode == 8){
     	  			return false;
     	  		}
     	  	}
     	}
</script>
</head>
<body>
<div id="wrap">
	<!-- layer pop 합격자조회 팝업 -->
	<div class="layerpop alertpop01" tabindex="0" data-tooltip-con="alertpop01" data-focus="alertpop01" data-focus-prev="alertpop01-close">
		<div class="layer_mask tooltip-close"></div><!-- 블랙mask영역 -->
		<div class="layer_cont">
			<div class="lc_head"></div>
			<div class="lc_cont">
				<p class="alert_txt">제출한 시험자는 수정할 수 없습니다.<br />제출하시겠습니까?</p>
				<div class="p_btn_center">
					<button class="btn_blueline02 tooltip-close">취소</button>
					<button class="btn_bluebg02 tooltip-close" onclick="fnSave();return false">확인</button>
				</div>

			</div>
		</div>
		<button class="btn_close tooltip-close" data-focus="alertpop01-close" data-focus-next="alertpop01">닫기</button>
	</div>
	<!--// layer pop -->

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
						<form name="ansFrm" id="ansFrm" action="<c:out value="${ctx}"/>/classdesk/user/exam.do" method="post" >
							<input type="hidden" name="examNo" id="examNo" value="<c:out value="${REQUEST_DATA.examNo}"/>">
							<input type="hidden" name="qNo" id="qNo">
							<input type="hidden" name="qSeq" id="qSeq">
							<input type="hidden" name="qType" id="qType">
							<input type="hidden" name="examTime" id="examTime" value="<c:out value="${listData[0].EXAM_TIME_MS}"/>">
							<input type="hidden" name="answer" id="answer">
							<input type="hidden" name="itemSeq" id="itemSeq">
							<input type="hidden" name="submitYn" id="submitYn">
							<input type="hidden" name="subcmd" id="subcmd">
							<input type="hidden" name="examType" id="examType" value="<c:out value="${REQUEST_DATA.examType}"/>">
							<input type="hidden" name="pubType" id="pubType" value="<c:out value="${REQUEST_DATA.pubType}"/>">	
							<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK}">
							<input type="hidden" name="openType" id="openType" value="${REQUEST_DATA.openType}">
							<input type="hidden" name="ctypeName" id="ctypeName" value="${REQUEST_DATA.ctypeName}">
							<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>				
							<input type="hidden" id="courseSelect" name="courseSelect" value="<c:out value="${REQUEST_DATA.courseSelect}"/>"/>						
						</form>
	
						<div class="c_section">						
							<div class="questionnaire">
								<h4 class="q_title"><c:out value="${listData[0].TITLE}"/></h4>
								<ol class="q_list">
									<c:forEach items="${listData}" var="result" varStatus="stat">
										<input type="hidden" name="qNo<c:out value="${stat.index}"/>" id="qNo<c:out value="${stat.index}"/>" value="<c:out value="${result.QNO}" />" />
										<input type="hidden" name="qSeq<c:out value="${stat.index}"/>" id="qSeq<c:out value="${stat.index}"/>" value="<c:out value="${result.QSEQ}" />" />
										<input type="hidden" name="qType<c:out value="${stat.index}"/>" id="qType<c:out value="${stat.index}"/>" value="<c:out value="${result.QTYPE}" />" />
									
										<!-- O,X  -->
										<c:if test="${result.QTYPE == 1}">
											<li>
												<h5 class="q_list_tit"><span class="num"><c:out value="${stat.count}"/></span>[O, X] <c:out value="${result.QSUBJECT}"/></h5>
												<ul class="q_list_con">
													<li>
														<input type="radio" id="choice_o${stat.count}" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="1" title="답변 o" />
														<label for="choice_o${stat.count}">O</label>
													</li>
													<li>
														<input type="radio" id="choice_x${stat.count}" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="2" title="답변 x" />
														<label for="choice_x${stat.count}">X</label>
													</li>
												</ul>
											</li>
										</c:if>
	
										<!-- 객관식 -->
										<c:if test="${result.QTYPE == 2}">
											<li>
												<h5 class="q_list_tit"><span class="num"><c:out value="${stat.count}"/></span>[객관식] <c:out value="${result.QSUBJECT}"/></h5>
												<ul class="q_list_con">
													<c:if test="${not empty result.A01}">
														<li><input type="radio" id="result01<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="1">
														<label for="result01<c:out value="${stat.index}"/>"><c:out value="${result.A01}"/></label></li>                                            
													</c:if>
													<c:if test="${not empty result.A02}">
														<li><input type="radio" id="result02<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="2">
														<label for="result02<c:out value="${stat.index}"/>"><c:out value="${result.A02}"/></label></li>                                              
													</c:if> 
													<c:if test="${not empty result.A03}">                                            
														<li><input type="radio" id="result03<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="3">
														<label for="result03<c:out value="${stat.index}"/>"><c:out value="${result.A03}"/></label></li>                                              
													</c:if>	  
													<c:if test="${not empty result.A04}">                                                                    
														<li><input type="radio" id="result04<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="4">
														<label for="result04<c:out value="${stat.index}"/>"><c:out value="${result.A04}"/></label></li>
													</c:if>
													<c:if test="${not empty result.A05}">
														<li><input type="radio" id="result05<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" name="itemSeq<c:out value="${stat.index}"/>" value="5">
														<label for="result05<c:out value="${stat.index}"/>"><c:out value="${result.A05}"/></label></li>
													</c:if>
												</ul>
											</li>
										</c:if>
									</c:forEach>
								</ol>
							</div>
	
							<div class="c_btn_center">
								<button class="btn_bluebg03" data-tooltip="alertpop01">응시 완료</button>
							</div>
						</div>
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