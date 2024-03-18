<%
/****************************************
    subject : 나의학습실
    summary : 나의학습실 > 강의실
    author  : SANGS
    date    : 2018-06-15
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
	<title>자격소개 > 자격시험 > 신용상담사</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
</head>
<body>
<!-- skip nav -->
	<%@ include file="/WEB-INF/jsp/inc/nav_inc.jsp"%>
<!--// skip nav -->
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
	aryData3.push('${result.VAL}');  // mp4 파일명 
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

function fnPageMove(url){
	$("#frm").attr("action", url);
	$("#frm").submit();
}



function fnApply(pollcseqno,cnt,edate,sdate){
	
	for(var i = 0 ; i < $("#histDataCheck").val() ; i++) {
		if(pollcseqno == $("#histData"+i).val()){
			alert('이미 참여하셨습니다');
			return false;
		}
	}
	
	var d = new Date();
	var day = d.getDate().toString();
	if(day.length < 2){
		day = '0'+day;
	}
	
   	var now = new Date(); 
   	var todayAtMidn = new Date(now.getFullYear(), now.getMonth(), now.getDate());

   	var edate = new Date(edate);
   	var sdate = new Date(sdate);
   	
   	todayAtMidn.setHours(0,0,0,0);
   	edate.setHours(0,0,0,0);
   	sdate.setHours(0,0,0,0);

   	if (todayAtMidn.getTime() > edate.getTime() || todayAtMidn.getTime() < sdate.getTime())
   	{
   		alert('설문 기간이 아닙니다.');
   		return false;
   	}
	var frm = document.frm;
	frm.pollcseqno.value=pollcseqno;
	frm.cnt.value=cnt;
	$("#frm").attr("action", "/classdesk/user/poll/view.do");
	frm.submit();  
}

// 시험

$(function(){
	$("#sum").on("click",function(){
		alert("시험을 보셨습니다");
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
        	location.reload();
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
	//순차일 경우 
	if(eduseqYn == 'Y'){
		if( aryData7[idx-1] != progCodeEnd){
			if( aryData7[idx-1] == ''){
				alert("안됌");
				return false;
			}
		}

	}
	
	$('#filePath').val(aryData1[idx]);
	$('#mediaFile').val(aryData2[idx]);
	$('#val').val(aryData3[idx]);
	
	$('#treeno').val(aryData4[idx]);
	$('#studytime').val(aryData5[idx]);
	$('#sday').val(aryData6[idx]);
	
	var UserAgent = navigator.userAgent;
	var html = "";
	if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null)
	{
		html = "1002.html";
	} else {
		html = "1001.html";
	}
	
	window.open("/edudata/contents/"+html,"mediaPop","width=1000,height=650");
}


function fnForms(examNo, cmd, edate, examTime, pupType) {

		$("#examEdate").val(edate);
		$("#examTime").val(examTime);
		$("#pupType").val(pupType); // 출제방식 (순차, 랜덤)

	   var userPercent = parseInt('<c:out value="${examProgData}"/>'); 

	   var onlineEdu = '<c:out value="${REQUEST_DATA.ONLINE_EDU}"/>'; 
	   

	    // 시험 결과보기
		if (cmd == 'review_form') {
			$('#examNo').val(examNo);
			$('form[name=frm]').attr('action','/classdesk/user/exam/' + cmd + '.do').submit();
		} else {
			if (onlineEdu != 'Y') {
				fnModalMsg('온라인학습을 수료 해주시기 바랍니다.');
				return;
			}

			$('#examNo').val(examNo);
			$('form[name=frm]').attr('action','/classdesk/user/exam/' + cmd + '.do').submit();
		}
	}


</script>
<script type="text/javascript"> 

	function errimg(img){ 
		img.src='/classdesk/images/thumb_noimage.gif';
	}
	
	$(document).ready(function() {

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
				})
	});
	
	
	function fnForm(bbsNo, cmd, select){
		
		if(select == 1){
			$("#select").val("list1");
		}else {
			$("#select").val("list2");
		}
		
		$('#bbsNo').val(bbsNo);
		$("#searchWord").val($("#searchText").val());
		$('form[name=frm]').attr('action', '/myclass/' + cmd + '.do').submit();
	}
	
	
	function selectTitle(selectTitle){
		
		var frm = document.frm;
		$('#searchCseqno').val($('#cseqno').val());
		$('#cuserno').val('');
		frm.submit();
	}
	
	//파일다운로드
	function filedown(fileId, bbsNo, fileSeq){
		
		
		var frm = document.frm;
		$("#fileId").val(fileId);
		$("#fileSeq").val(fileSeq);
		/* frm.fileId.value = fileId;
		frm.bbsNo.value = bbsNo;
		frm.fileSeq.value = fileSeq; */
		$('#frm').attr('action', '/classdesk/main/fileDown.do').submit(); 
	} 
</script>

<div id="wrap">

	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->

	<!-- container -->
	<div id="container">

		<!-- location -->
		<jsp:include page="/WEB-INF/jsp/inc/location/loc_06_01.jsp"> 
		  	<jsp:param name="menuNm" value="강의실"/> 
		</jsp:include> 
		<!--// location -->

		<div class="con_center">

			<!-- lnb -->
			<div id="lnb">
				<jsp:include page="/WEB-INF/jsp/inc/lnb/lnb_06.jsp"> 
				  	<jsp:param name="dep2" value="02"/>
				</jsp:include> 
			</div>
			<!--// lnb -->


				<form name="ansFrm" id="ansFrm" method="post" >
			
				<input type="hidden" name="userNo" id="userNo" value="<c:out value="${REQUEST_DATA.SES_USERNO}"/>">
				<input type="hidden" name="answer" id="answer" value="">
				<input type="hidden" name="pollCseQno" id="pollCseQno" value="<c:out value="${REQUEST_DATA.pollCseQno}"/>"/>
				<input type="hidden" name="mtAppType" id="mtAppType" value="<c:out value="${REQUEST_DATA.mtAppType}"/>"/>
				<input type="hidden" name="ccNo" id="ccNo" value="<c:out value="${REQUEST_DATA.ccNo}"/>"/>
				<input type="hidden" name="ccAppNo" id="ccAppNo" value="<c:out value="${REQUEST_DATA.ccAppNo}"/>"/>
	 			<input type="hidden" name="qno" id="qno" value=""/> 
			
			<!-- content 본문 -->
			<div id="content">

				<h3 class="cont_titile">설문조사</h3>
				<!-- 본문내용 -->
				<div class="cont_body">
					<!-- start -->
					
					
					<div class="c_section">
							
						<h4 class="c_tit"><c:out value='${edPollInfo.TITLE}'/></h4>
						
						<c:forEach items="${edPollQuizList}" var="result" varStatus="stat">
							<c:set var="qno" value="${result.QNO}"/>
							<c:if test="${result.MT_CPOLL_CODE == 'JBBA00'}">
								<div class="survey_box first">
									<input type="hidden" name="exNo" qType="${result.MT_CPOLL_CODE}" id="exNo${result.count}" value="<c:out value='${result.QNO }'/>"/>
							 	 	<input type="hidden" name="ordr" id="ordr" value="<c:out value='${result.ORDR }'/>"/>
							 	 	
							 	 	<input type="hidden" name="itemSeq" id="itemSeq" value="<c:out value='${result.ITEMNO}'/>">
									<h5 class="title"><span>[ 설문 ${stat.count} ]</span> ${result.CPOLL_TITLE}</h5>
									<ul class="survey_list">
										<li>
											<p>${result.SUBJECT}</p>
											<div class="sel_points">
												<h6 class="alt_text">점수선택</h6>
												
												<c:forEach items="${edPollQitemList}" var="pollQitemList" varStatus ="stat2">
													<c:if test="${pollQitemList.QNO == result.QNO}">
														<input type="radio" id="result01<c:out value="${stat2.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" value="<c:out value="${pollQitemList.ITEM_SUBJECT}"/>" name="itemSeq<c:out value="${stat.index}"/>" />
														<label for="result01<c:out value="${stat2.index}"/>">${pollQitemList.ITEM_ORDR}</label>
													</c:if>
												</c:forEach>
											</div>
										</li>
									</ul>
								</div>
							</c:if>
							
							<c:if test="${result.MT_CPOLL_CODE == 'JBAA00' }">
								<div class="survey_box">
									<input type="hidden" name="exNo" qType="${result.MT_CPOLL_CODE}" id="exNo${result.count}" value="<c:out value='${result.QNO }'/>"/>
									<h5 class="title"><span>[ 설문  ${stat.count} ]</span> ${result.CPOLL_TITLE} </h5>
									<div class="survey_textarea">
										<textarea name="itemSeq<c:out value="${stat.index}"/>" itemSeq="itemSeq<c:out value="${stat.index}"/>" id="answer<c:out value="${stat.count}"/>" cols="" rows="" placeholder="내용을 입력해주세요." title="이번 교육의 좋은점을 입력해주세요."></textarea>
									</div>
								</div>
							</c:if>
						</c:forEach>
						
						<div class="c_btn_center">
							<button onclick="fnSave(); return false;" class="btn_bluebg03">설문조사 참여하기</a>
						</div>
					
					</div>
					<!--// end -->
				</div>
				<!--// 본문내용 -->
				
			</div>
			<!--// content 본문 -->
			</form>
			
		</div>
	</div>
	<!--// container -->

	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->

</div>

</body>
</html>