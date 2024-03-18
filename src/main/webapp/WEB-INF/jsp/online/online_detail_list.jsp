<%
/****************************************
    subject : 온라인교육
    summary : 온라인교육 > 교육소개
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 강의소개 > <c:out value="${title}"/></title>
<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
<style type="text/css">	
	.noneDataImg { width: 100%; margin-top: 45px; height: 400px; background:url('/cmmn/images/contentspage-no_pc.png') no-repeat center center;  }
	
	@media screen and (max-width:767px) {
		.noneDataImg { width: 100%; margin-top: 25px; height: 450px; background:url('/cmmn/images/contentspage-no_mobile.png') no-repeat center center;  }
	}
</style>
<script type="text/javascript">
	$(function(){
		if('${REQUEST_DATA.loan}' != "" && '${REQUEST_DATA.schSeqTitle}' == '' && '${REQUEST_DATA.mtScCode}' != "") {
			    var bodyHS = $('html').height(); 
			    $("#join_pop").css('display', 'block');
			    $('.modal-backdrop').attr('style','height:'+bodyHS+'px; '+'z-index:100;');
		}
		else{
			$("#join_pop").css('display', 'none');
		}
	});

	// 팝업 닫기
	function layerPop() {
		$("#join_pop").css('display', 'none');
		$('#schSeqTitle').focus();
		$('.modal-backdrop').hide();	  
	}

	//검색
	function fnSearch() {
		$('#schSeqTitleIncode')
				.val(encodeURIComponent($('#schSeqTitle').val()));

		$('form[name=frm]').attr('target', '_self').attr('action',
				'<c:out value="${ctx}"/>/academy/course/onDetail.do');
		$('#frm').submit();
	}

	//과정신청
	function fnCourseApply(courseno, cseqno, cancelYn) {
		$('#cseqno').val(cseqno);
		$('#courseno').val(courseno);
		$('#mttype').val('온라인과정');
		$('#cancelYn').val(cancelYn);
		$('form[name=frm]').attr('target', '_self').attr('action','/online/onlineDetailForm.do');
		$('#frm').submit();

	}
	
	function nextPage(){

		var cPage =  parseInt($('#cPage').val())+1;
		$('#cPage').val(cPage);
		$.ajax({
            url : "/online/ajaxOnlineDetailList.do",
            data : { cPage : cPage
                   , mtScCode : '${REQUEST_DATA.mtScCode}'
                   , mtCseqStatusCode : '${REQUEST_DATA.mtCseqStatusCode}'
            	   },
            dataType : "json",
            type : 'post',
            success : function(res) { 		            	

            	var append = '';

				for(var i = 0; i < res.length ; i++){
					0
					append += '<li><div class="inbox">';
					append += '<a href="/online/onlineDetailForm.do?courseno='+ res[i].COURSENO + '&cseqno='+ res[i].CSEQNO + '&mtScCode='+ res[i].MT_SC_CODE  + '" class="imgtxt" title="' + res[i].SEQ_TITLE + '상세보기">';
					append += '<span class="img">';
					append += '<img src="/att_file/course/'+res[i].SAVFILE+'" alt="'+ res[i].SEQ_TITLE + '" />'
					append += '</span>';
					append += '<span class="tit">'+res[i].SEQ_TITLE+'</span>';
					append += '</a>';
					append += '<div class="txt"><dl>';
					append += '<dt>재생시간 : </dt>';
					append += '<dd>'+res[i].SUM_RUNTIME+'분</dd>';
					append += '</dl><dl>';
					append += '<dt>난이도 : </dt>';
					append += '<dd>'+res[i].MT_LEVEL_NAME+'</dd>';
					append += '</dl>';
					append += '<a href="#none" class="btn_blueline btn_detail" onclick="fnCourseApply('+ res[i].COURSENO + ','+ res[i].CSEQNO + ','+ res[i].CANCEL_YN + ')"   title=" '+ res[i].SEQ_TITLE + ' 상세보기">상세보기</a>';
					append += '</div></div>';
					append +='</div></li>';

				}

				$('.g_list').append(append);
        		
				if(res[0].ROW_DIV == 'N'){
					$('#appendBtn').hide();
				}

            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        }); 
	}

</script>
</head>
<body>
	<form name="frm" id="frm" action="" method="post">
			<input type="hidden" name="cseqno" id="cseqno" value="">
			<input type="hidden" name="courseno" id="courseno" value="">
			<input type="hidden" name="mttype" id="mttype" value="">
			<input type="hidden" name="cancelYn" id="cancelYn" value="">
			<input type="hidden" name="mtScCode" id="mtScCode" value="<c:out value='${REQUEST_DATA.mtScCode}' />">
			<input type="hidden" name="cPage" id="cPage" value="<c:out value='${REQUEST_DATA.cPage}' />">
	</form>
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->
	
	<!-- container -->
	<div id="container">
		<div class="con_center">
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title">${title}</h3>
				</div>			
			</div>
			<div id="content">			
				<div class="wrapper">
					<div class="cont_body">
						<c:if test = "${ not empty listData }">
							<div class="c_section">
								<c:if test = "${ not empty listData }">
									<div class="g_list_box">
										<ul class="g_list">
											<c:forEach items="${listData}" var="result" varStatus="stat">
												<c:set value="${result.ROW_DIV}" var="rowDiv"/>
												<li>
													<div class="inbox">													
															<a href="/online/onlineDetailForm.do?courseno=<c:out value="${result.COURSENO}"/>&cseqno=<c:out value="${result.CSEQNO}"/>&mtScCode=<c:out value="${REQUEST_DATA.mtScCode}"/>" class="imgtxt" title="<c:out value="${result.SEQ_TITLE}"/> 상세보기">
															<span class="img">
																<img src="/att_file/course/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.SEQ_TITLE}"/>" />
															</span>
															
															<!-- 센터로 -->
															<span class="tit"><c:out value="${result.SEQ_TITLE}"/></span>
														</a>
													</div>
												</li>
											</c:forEach>
										</ul>
										<div class="c_btn_center">
											<c:if test = "${rowDiv == 'Y'}">
												<button type="button" id="appendBtn" onclick="nextPage(); return false;" class="btn_list_more"><span>더 보기</span></button>
											</c:if>
										</div>
									</div>
								</c:if>
							</div>
						</c:if>
					
						<c:if test = "${empty listData }">
							<div class="cont_none">
								<div class="img">
									<p>등록된 컨텐츠가 없습니다.</p>
								</div>
							</div>
						</c:if>
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