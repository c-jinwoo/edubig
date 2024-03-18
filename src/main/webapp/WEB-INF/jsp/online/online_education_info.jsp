<%
/****************************************
    subject : 온라인교육
    summary : 온라인교육 > 과정소개
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 강의소개 > <c:out value="${title}"/></title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	<script>
		function imgSize(){
			if($("#courseno").val() == 1){
				$(".cont_sub .cont1_btn").css({
					"top":685*$(".cont_sub .cont1_btn").parent().width()/1080+"px",
					"left":669*$(".cont_sub .cont1_btn").parent().width()/1080+"px",
					"width":230*$(".cont_sub .cont1_btn").parent().width()/1080+"px",
					"height":230*$(".cont_sub .cont1_btn").parent().width()/1080+"px"
				});
			}
			else if($("#courseno").val() == 2){
				$(".cont_sub .cont2_btn").css({
					"top":715*$(".cont_sub .cont2_btn").parent().width()/1080+"px",
					"left":640*$(".cont_sub .cont2_btn").parent().width()/1080+"px",
					"width":230*$(".cont_sub .cont2_btn").parent().width()/1080+"px",
					"height":230*$(".cont_sub .cont2_btn").parent().width()/1080+"px"
				});		
			}
			else if($("#courseno").val() == 3){
				$(".cont_sub .cont3_btn").css({
					"top":460*$(".cont_sub .cont3_btn").parent().width()/1080+"px",
					"left":665*$(".cont_sub .cont3_btn").parent().width()/1080+"px",
					"width":230*$(".cont_sub .cont3_btn").parent().width()/1080+"px",
					"height":230*$(".cont_sub .cont3_btn").parent().width()/1080+"px"
				});		
			}
			else if($("#courseno").val() == 4){
				$(".cont_sub .cont4_btn").css({
					"top":460*$(".cont_sub .cont4_btn").parent().width()/1080+"px",
					"left":665*$(".cont_sub .cont4_btn").parent().width()/1080+"px",
					"width":230*$(".cont_sub .cont4_btn").parent().width()/1080+"px",
					"height":230*$(".cont_sub .cont4_btn").parent().width()/1080+"px"
				});		
			}
			
			$(".cont_sub .evt_timer").css({
				"height":120*$(".cont_sub .evt_timer").parent().width()/1080+"px"
			});	
			
			$(".cont_sub .timer_btn").css({
				"top":30*$(".cont_sub .timer_btn").parent().width()/1080+"px",
				"right":25*$(".cont_sub .timer_btn").parent().width()/1080+"px",
				"width":190*$(".cont_sub .timer_btn").parent().width()/1080+"px",
				"height":90*$(".cont_sub .timer_btn").parent().width()/1080+"px"
			});	
			
			$(".cont_sub .tick").css({
				"width":745*$(".cont_sub .tick").parent().width()/1080+"px",
				"right":45*$(".cont_sub .tick").parent().width()/1080+"px",
				"margin-top":20*$(".cont_sub .tick").parent().width()/1080+"px"
			});
			
			$(".cont_sub .evt_txt").css({
				"top":30*$(".cont_sub .evt_txt").parent().width()/1080+"px",
				"left":45*$(".cont_sub .evt_txt").parent().width()/1080+"px",
				"font-size":20*$(".cont_sub .evt_txt").parent().width()/1080+"px"
			});
			
			$(".cont_sub .pointer").css({
				"top":138*$(".cont_sub .pointer").parent().width()/230+"px",
				"left":138*$(".cont_sub .pointer").parent().width()/230+"px",
				"width":61*$(".cont_sub .pointer").parent().width()/230+"px",
				"height":76*$(".cont_sub .pointer").parent().width()/230+"px"
			});	
			
			$(".cont_sub .cont_reviews_list").css({
				"top":385*$(".cont_sub .cont_reviews_list").parent().width()/1080+"px"
			});
			
			popSize();
		}
		function popSize(){		
			$("#container .layer_popup .layer_head").css({
				"height":69*$("#container .layer_popup .layer_head").parent().width()/695+"px",
				"line-height":69*$("#container .layer_popup .layer_head").parent().width()/695+"px"
			});	
			$("#container .layer_popup .layer_close").css({
				"width":69*$("#container .layer_popup .layer_close").parent().width()/695+"px",
				"height":69*$("#container .layer_popup .layer_close").parent().width()/695+"px"
			});		
			$("#container .layer_popup .layer_body a").css({
				"width":230*$("#container .layer_popup .layer_body a").parent().width()/695+"px",
				"height":230*$("#container .layer_popup .layer_body a").parent().width()/695+"px"
			});		

			$(".layer_popup").css("margin-top", -0.5 * $(".layer_popup").height());
		}
		$(window).resize(function(){
			imgSize();
		});
		
		function frmSubmit(){
			if('<c:out value="${REQUEST_DATA.courseno}"/>' == "3" || '<c:out value="${REQUEST_DATA.courseno}"/>' == "4"){
				if('<c:out value="${isBargain}"/>' == "Y"){
					$("#seq").val("1");		
				}
				else if('<c:out value="${isBargain}"/>' == "N"){
					$("#seq").val("2");		
				}
			}
			else{
				$("#seq").val($("input[name^='seqRadio']:checked").val());				
			}
			$("#frm").submit();
		}
		
		function frmSubmitPop(val){
			$("#seq").val(val);
			$("#frm").submit();
		}
		function popOpen(){
			if('<c:out value="${REQUEST_DATA.courseno}"/>' == "1" || '<c:out value="${REQUEST_DATA.courseno}"/>' == "2"){
				$('#container .layer_popup, .layer_dim').show();
				popSize();
			}
			else{
				frmSubmit();
			}
		}
		function popClose(){
			$('#container .layer_popup, .layer_dim').hide();
		}
		function connectIndexOfAgentFunc() {
			var deviceChk = "";	
			const agent = navigator.userAgent.toLowerCase();
			const isIOS = (agent.indexOf("iphone")>-1||agent.indexOf("ipad")>-1||agent.indexOf("ipod")>-1);
			const isANDROID = (agent.match('android') != null);
			const isMSIE80 = (agent.indexOf("msie 6.0")>-1||agent.indexOf("msie 7.0")>-1||agent.indexOf("msie 8.0")>-1);
			if(isANDROID){
				deviceChk = "Android";
			}
			else if(isIOS){
				deviceChk = "IOS";
			} 
			else if(isMSIE80){
				deviceChk = "PC";
			} 
			else{
				deviceChk = "PC";
			}	
			return deviceChk;
		}
		
		$(document).ready(function(){
			var _device = connectIndexOfAgentFunc();
			if(_device != "PC"){
				$(".cont_vid").remove();
			}
			
			imgSize();
			
			/* 수강후기 스크롤  */
			$('.cont_reviews_list').slick({
				slidesToShow: 3,
				slidesToScroll: 1,
				arrows: false,
				autoplay: true,
				autoplaySpeed: 2000,
				mobileFirst: false, 
				responsive:[{ 
					breakpoint: 768,
					settings:{ 
						slidesToShow: 1, 
						slidesToScroll: 1 
					}
				}]
			});

			var player = new Object();
			if($("#videobcg").length > 0){
				player = videojs("videobcg", {
					loadingSpinner: false
				});
			}
		});

		/* 이벤트타이머  */
		function handleTickInit(tick){
			var _targetDate = '<c:out value="${bargainInfo.EVENT_EDATE}"/>';
			var _targetDateArr = _targetDate.split(".");
			var _result = _targetDateArr[0]+"-"+_targetDateArr[1]+"-"+_targetDateArr[2]+"T"+_targetDateArr[3]+":"+_targetDateArr[4]+":"+_targetDateArr[5];
	        var counter = Tick.count.down(_result);

	        counter.onupdate = function(value) {
	          tick.value = value;
	        };
	        counter.onended = function() {
				location.reload();			
			};
	    }
	</script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->
	
	<div id="container">
		<div class="con_center">
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title"><c:out value="${title}"/></h3>
				</div>			
			</div>			
			<div id="cont">
				<form name="frm" id="frm" method="post" action="/online/onlineDetailForm.do">
					<input type="hidden" name="courseno" id="courseno" value="<c:out value="${REQUEST_DATA.courseno}"/>"/>
					<input type="hidden" name="seq" id="seq" value=""/>			
				</form>
				
				<!-- 경영빅데이터분석사 영상 -->		
				<c:if test='${REQUEST_DATA.courseno == 1}'>
					<div class="cont_sub cont_vid" style="position:sticky;top:0;left:0;background:#000;opacity:0.5;z-index:-1;">
						<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" style="display:block;opacity:0.75;width:100%;height:auto;">
							<c:if test="${serverMode eq 'real'}">
						    	<source src="https://cdn.edubig.co.kr/_definst_/mp4:edubig/bigdata.mp4/playlist.m3u8" type="application/x-mpegURL">
						    </c:if>
							<c:if test="${serverMode eq 'dev'}">
						    	<source src="http://cslabs-cvod.myskcdn.net/_definst_/mp4:edubig/bigdata.mp4/playlist.m3u8" type="application/x-mpegURL">
						    </c:if>
						</video>
					</div>
				</c:if>
				<!-- 인터넷윤리 영상 -->	
				<c:if test='${REQUEST_DATA.courseno == 2}'>
					<div class="cont_sub cont_vid" style="position:sticky;top:0;left:0;background:#000;opacity:0.5;z-index:-1;">
						<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" style="display:block;opacity:0.75;width:100%;height:auto;">
							<c:if test="${serverMode eq 'real'}">
						    	<source src="https://cdn.edubig.co.kr/_definst_/mp4:edubig/ieq.mp4/playlist.m3u8" type="application/x-mpegURL">
						    </c:if>
							<c:if test="${serverMode eq 'dev'}">
						    	<source src="http://cslabs-cvod.myskcdn.net/_definst_/mp4:edubig/ieq.mp4/playlist.m3u8" type="application/x-mpegURL">
						    </c:if>
						</video>
					</div>
				</c:if>
				<!-- 3D프린팅 영상 -->	
				<c:if test='${REQUEST_DATA.courseno == 3 || REQUEST_DATA.courseno == 4}'>
					<div class="cont_sub cont_vid" style="position:sticky;top:0;left:0;background:#000;opacity:0.5;z-index:-1;">
						<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" style="display:block;opacity:0.75;width:100%;height:auto;">
							<c:if test="${serverMode eq 'real'}">
						    	<source src="https://cdn.edubig.co.kr/_definst_/mp4:edubig/3d.mp4/playlist.m3u8" type="application/x-mpegURL">
						    </c:if>
							<c:if test="${serverMode eq 'dev'}">
						    	<source src="http://cslabs-cvod.myskcdn.net/_definst_/mp4:edubig/3d.mp4/playlist.m3u8" type="application/x-mpegURL">
						    </c:if>
						</video>
					</div>
				</c:if>
				
				<!-- 이벤트 타이머 -->
				<c:if test="${isBargain eq 'Y'}">
					<div class="cont_sub" style="background:#000;">
						<div class="wrapper">
							<div class="evt_timer">
								<span class="evt_txt"><strong>마감</strong>까지 <br/>남은시간</span>
								<a onclick="popOpen();" class="timer_btn pntr"></a>
								<div class="tick" data-did-init="handleTickInit">
								    <div data-repeat="true" data-layout="horizontal fit" data-transform="preset(d, h, m, s) -> delay">
								        <div class="tick-group">
								            <div data-key="value" data-repeat="true" data-transform="pad(00) -> split -> delay">
								                <span data-view="flip"></span>
								            </div>
								            <span data-key="label" data-view="text" class="tick-label"></span>
								        </div>
								    </div>
								</div>
							</div>
						</div>
					</div>		
				</c:if>		
				
				<!-- 경영빅데이터분석사 -->		
				<c:if test='${REQUEST_DATA.courseno == 1}'>
					<div class="cont_sub" style="background:#FFF;">
						<div class="wrapper">
							<img src="/cmmn/images/cont1_img2.png" alt="학습안내1">
						</div>
					</div>
					<div class="cont_sub" style="background:#F5F5F5;">
						<div class="wrapper">
							<img src="/cmmn/images/cont1_img3.png" alt="학습안내2">
						</div>
					</div>
					<div class="cont_sub cont1_back">
						<div class="wrapper">
							<img src="/cmmn/images/cont1_img4.png" alt="취업분야">
						</div>
					</div>
					<div class="cont_sub" style="background:#161C70;">
						<div class="wrapper">
							<c:if test="${isBargain eq 'Y'}">
								<input type="radio" class="dot01" name="seqRadio" value="1" checked/>
								<input type="radio" class="dot02" name="seqRadio" value="2"/>
							</c:if>
							<c:if test="${isBargain eq 'N'}">
								<input type="radio" class="dot01" name="seqRadio" value="3" checked/>
								<input type="radio" class="dot02" name="seqRadio" value="4"/>
							</c:if>
							<img src="/cmmn/images/cont1_img1.png" alt="경영빅데이터분석사">
							<a onclick="frmSubmit();" class="cont_btn cont1_btn pntr">
								<span class="pointer"></span>
							</a>
						</div>
					</div>
					<div class="cont_sub" style="background:#E1FFFA;">
						<div class="wrapper">
							<img src="/cmmn/images/img_main_book1.png" alt="책">
						</div>
					</div>
					<c:if test="${not empty reviewList}">
						<div class="cont_sub" style="background:#FDFDE5;">
							<div class="wrapper">
								<img src="/cmmn/images/cont_review.png" alt="수강후기">
								<div class="cont_reviews_list">
									<c:forEach items="${reviewList}" var="result">
										<div class="cont_reviews_slide">
											<input type="hidden" id="rvScore" name="rvScore" value="<c:out value="${result.SCORE}"/>"/>
											<div class="cont_reviews_box">
												<h5><c:out value="${result.COURSETITLE}"/></h5>
												<span><c:out value="${result.CONTENT}"/></span>
												<h3><c:out value="${result.WRITER}"/></h3>
												<h3><c:out value="${result.WDATE}"/></h3>
												<p>
													<c:forEach var="j" begin="1" end="5">
														<span class="starR <c:if test="${j <= result.SCORE}">on</c:if>"></span>
													</c:forEach>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:if>
					<div class="cont_txt">
						<div class="wrapper">
							<div class="cont_body">
								<p class="title">이용안내 및 유의사항</p>
								<div class="c_section">							
									<h4 class="c_tit">상품소개</h4>
									<ul class="c_txtlist">
										<li>경영 빅데이터 분석사 온라인 강의는 총 19차시로 구성되어 있습니다.</li>
										<li>패키지 구매 시 공식수험서(수험서 내 응시료 할인권 내포)와 기출문제집이 포함되어 있습니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">수강기간</h4>
									<ul class="c_txtlist">
										<li>결제일로부터 30일 동안 수강이 가능합니다.</li>
										<li>서버점검 또는 시스템오류 발생 시 점검시간은 수강기간에서 제외됩니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">교재배송안내</h4>
									<ul class="c_txtlist">
										<li>오후 3시까지 주문건에 한해 당일발송 됩니다.</li>
										<li>택배사 사정(명절연휴 등)에 따라 배송이 지연될 수 있습니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">환불규정</h4>
									<ul class="c_txtlist">
										<li>교육훈련기관의 장은 다음 각 호의 어느 하나에 해당하는 경우에는 별도의 반환 기준에 따라 이미 납부한 학습비를 반환하여야 합니다.<br><br>
										  1. 과오납의 경우<br>
										  2. 학습자가 「병역법」에 따른 병역 의무를 이행하기 위하여 군에 입대하는 경우 등 법령에 의하여 학습을 계속할 수 없는 경우<br>
										  3. 학습자가 학습 포기의 의사를 표시한 경우<br>
										  4. 학습자가 본인의 질병·사망 또는 천재지변이나 그 밖의 부득이한 사유로 학습을 시작하지 아니하거나 학업을 계속하지 못하게 된 경우
										</li>
										<div class="table_style_row" style="margin: 18px 0;">
											<table>
												<colgroup>
													<col width="50%" class="col3_1"/>
													<col width="50%"/>
												</colgroup>
												<tr>
													<th>결제일 ~ 수업 시작일 전까지</th>
													<td>학습비 전액</td>
												</tr>
												<tr>
													<th>수업 시작일부터 총 수업시간의 1/6 경과 전</th>
													<td>학습비의 5/6에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/6 이상부터 1/3 미만까지의 기간 동안</th>
													<td>학습비의 2/3에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/3 이상부터 1/2 미만까지의 기간 동안</th>
													<td>학습비의 1/2에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/2 이상 경과</th>
													<td>반환하지 않음</td>
												</tr>
											</table>
										</div>
										<li>에듀빅 학습자의 부주의로 발생한 어떠한 손해에 관하여 책임을 지지 아니합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;* 수강료는 대금의 결제와 동일한 방법으로 환불됩니다.<br>
									    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 단, 동일한 방법으로 환급이 불가능할 때는 이용자가 원하는 방법으로 환급합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;* 환불일 : 환불신청일로부터 7일 이내
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<!-- IEQ인터넷윤리지도사 -->
				<c:if test='${REQUEST_DATA.courseno == 2}'>
					<div class="cont_sub cont2_back">
						<div class="wrapper">
							<img src="/cmmn/images/cont2_img4.png" alt="취업분야">
						</div>
					</div>
					<div class="cont_sub" style="background:#fff;">
						<div class="wrapper">
							<img src="/cmmn/images/cont2_img2.png" alt="학습안내1">
						</div>
					</div>
					<div class="cont_sub" style="background:#F5F5F5;">
						<div class="wrapper">
							<img src="/cmmn/images/cont2_img3.png" alt="학습안내2">
						</div>
					</div>
					<div class="cont_sub" style="background:#2D313A;">
						<div class="wrapper">
							<c:if test="${isBargain eq 'Y'}">
								<input type="radio" class="dot03" name="seqRadio" value="1" checked/>
								<input type="radio" class="dot04" name="seqRadio" value="2"/>
							</c:if>
							<c:if test="${isBargain eq 'N'}">
								<input type="radio" class="dot03" name="seqRadio" value="3" checked/>
								<input type="radio" class="dot04" name="seqRadio" value="4"/>
							</c:if>
							<img src="/cmmn/images/cont2_img1.png" alt="IEQ인터넷윤리지도사">
							<a onclick="frmSubmit();" class="cont_btn cont2_btn pntr">
								<span class="pointer"></span>
							</a>
						</div>
					</div>
					<div class="cont_sub" style="background:#E1F4FF;">
						<div class="wrapper">
							<img src="/cmmn/images/img_main_book2.png" alt="책">
						</div>
					</div>
					<c:if test="${not empty reviewList}">
						<div class="cont_sub" style="background:#FDFDE5;">
							<div class="wrapper">
								<img src="/cmmn/images/cont_review.png" alt="수강후기">
								<div class="cont_reviews_list">
									<c:forEach items="${reviewList}" var="result">
										<div class="cont_reviews_slide">
											<input type="hidden" id="rvScore" name="rvScore" value="<c:out value="${result.SCORE}"/>"/>
											<div class="cont_reviews_box">
												<h5><c:out value="${result.COURSETITLE}"/></h5>
												<span><c:out value="${result.CONTENT}"/></span>
												<h3><c:out value="${result.WRITER}"/></h3>
												<h3><c:out value="${result.WDATE}"/></h3>
												<p>
													<c:forEach var="j" begin="1" end="5">
														<span class="starR <c:if test="${j <= result.SCORE}">on</c:if>"></span>
													</c:forEach>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:if>
					<div class="cont_txt">
						<div class="wrapper">
							<div class="cont_body">
								<p class="title">이용안내 및 유의사항</p>
								<div class="c_section">
									<h4 class="c_tit">상품소개</h4>
									<ul class="c_txtlist">
										<li>IEQ인터넷윤리지도사 온라인 강의는 총 20차시로 구성되어 있습니다.</li>
										<li>패키지 구매 시 공식수험서가 포함되어 있습니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">수강기간</h4>
									<ul class="c_txtlist">
										<li>결제일로부터 30일 동안 수강이 가능합니다.</li>
										<li>서버점검 또는 시스템오류 발생 시 점검시간은 수강기간에서 제외됩니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">교재배송안내</h4>
									<ul class="c_txtlist">
										<li>오후 3시까지 주문건에 한해 당일발송 됩니다.</li>
										<li>택배사 사정(명절연휴 등)에 따라 배송이 지연될 수 있습니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">환불규정</h4>
									<ul class="c_txtlist">
										<li>교육훈련기관의 장은 다음 각 호의 어느 하나에 해당하는 경우에는 별도의 반환 기준에 따라 이미 납부한 학습비를 반환하여야 합니다.<br><br>
										  1. 과오납의 경우<br>
										  2. 학습자가 「병역법」에 따른 병역 의무를 이행하기 위하여 군에 입대하는 경우 등 법령에 의하여 학습을 계속할 수 없는 경우<br>
										  3. 학습자가 학습 포기의 의사를 표시한 경우<br>
										  4. 학습자가 본인의 질병·사망 또는 천재지변이나 그 밖의 부득이한 사유로 학습을 시작하지 아니하거나 학업을 계속하지 못하게 된 경우
										</li>
										<div class="table_style_row" style="margin:18px 0;">
											<table>
												<colgroup>
													<col width="50%" class="col3_1"/>
													<col width="50%"/>	
												</colgroup>
												<tr>
													<th>결제일 ~ 수업 시작일 전까지</th>
													<td>학습비 전액</td>
												</tr>
												<tr>
													<th>수업 시작일부터 총 수업시간의 1/6 경과 전</th>
													<td>학습비의 5/6에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/6 이상부터 1/3 미만까지의 기간 동안</th>
													<td>학습비의 2/3에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/3 이상부터 1/2 미만까지의 기간 동안</th>
													<td>학습비의 1/2에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/2 이상 경과</th>
													<td>반환하지 않음</td>
												</tr>
											</table>
										</div>
										<li>에듀빅 학습자의 부주의로 발생한 어떠한 손해에 관하여 책임을 지지 아니합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;* 수강료는 대금의 결제와 동일한 방법으로 환불됩니다.<br>
									    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 단, 동일한 방법으로 환급이 불가능할 때는 이용자가 원하는 방법으로 환급합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;* 환불일 : 환불신청일로부터 7일 이내
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<!-- 3D프린팅모델링자격 1급 -->
				<c:if test='${REQUEST_DATA.courseno == 3}'>
					<div class="cont_sub cont3_back">
						<div class="wrapper">
							<img src="/cmmn/images/cont3_img4.png" alt="취업분야">
						</div>
					</div>
					<div class="cont_sub" style="background:#fff;">
						<div class="wrapper">
							<img src="/cmmn/images/cont3_img2.png" alt="학습안내1">
						</div>
					</div>
					<div class="cont_sub" style="background:#F5F5F5;">
						<div class="wrapper">
							<img src="/cmmn/images/cont3_img3.png" alt="학습안내2">
						</div>
					</div>
					<div class="cont_sub" style="background:#150909;">
						<div class="wrapper">
							<img src="/cmmn/images/cont3_img1.png" alt="IEQ인터넷윤리지도사">
							<a onclick="frmSubmit();" class="cont_btn cont3_btn pntr">
								<span class="pointer"></span>
							</a>
						</div>
					</div>
					<c:if test="${not empty reviewList}">
						<div class="cont_sub" style="background:#FDFDE5;">
							<div class="wrapper">
								<img src="/cmmn/images/cont_review.png" alt="수강후기">
								<div class="cont_reviews_list">
									<c:forEach items="${reviewList}" var="result">
										<div class="cont_reviews_slide">
											<input type="hidden" id="rvScore" name="rvScore" value="<c:out value="${result.SCORE}"/>"/>
											<div class="cont_reviews_box">
												<h5><c:out value="${result.COURSETITLE}"/></h5>
												<span><c:out value="${result.CONTENT}"/></span>
												<h3><c:out value="${result.WRITER}"/></h3>
												<h3><c:out value="${result.WDATE}"/></h3>
												<p>
													<c:forEach var="j" begin="1" end="5">
														<span class="starR <c:if test="${j <= result.SCORE}">on</c:if>"></span>
													</c:forEach>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:if>
					<div class="cont_txt">
						<div class="wrapper">
							<div class="cont_body">
								<p class="title">이용안내 및 유의사항</p>
								<div class="c_section">
									<h4 class="c_tit">상품소개</h4>
									<ul class="c_txtlist">
										<li>3D프린팅모델링자격1급 온라인 강의는 총 30차시로 구성되어 있습니다.</li>
										<!-- <li>패키지 구매 시 공식수험서(수험서 내 응시료 할인권 내포)와 기출문제집이 포함되어 있습니다.</li> -->
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">수강기간</h4>
									<ul class="c_txtlist">
										<li>결제일로부터 30일 동안 수강이 가능합니다.</li>
										<li>서버점검 또는 시스템오류 발생 시 점검시간은 수강기간에서 제외됩니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">교재배송안내</h4>
									<ul class="c_txtlist">
										<li>오후 3시까지 주문건에 한해 당일발송 됩니다.</li>
										<li>택배사 사정(명절연휴 등)에 따라 배송이 지연될 수 있습니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">환불규정</h4>
									<ul class="c_txtlist">
										<li>교육훈련기관의 장은 다음 각 호의 어느 하나에 해당하는 경우에는 별도의 반환 기준에 따라 이미 납부한 학습비를 반환하여야 합니다.<br><br>
										  1. 과오납의 경우<br>
										  2. 학습자가 「병역법」에 따른 병역 의무를 이행하기 위하여 군에 입대하는 경우 등 법령에 의하여 학습을 계속할 수 없는 경우<br>
										  3. 학습자가 학습 포기의 의사를 표시한 경우<br>
										  4. 학습자가 본인의 질병·사망 또는 천재지변이나 그 밖의 부득이한 사유로 학습을 시작하지 아니하거나 학업을 계속하지 못하게 된 경우
										</li>
										<div class="table_style_row" style="margin: 18px 0;">
											<table>
												<colgroup>
													<col width="50%" class="col3_1"/>
													<col width="50%"/>
												</colgroup>
												<tr>
													<th>결제일 ~ 수업 시작일 전까지</th>
													<td>학습비 전액</td>
												</tr>
												<tr>
													<th>수업 시작일부터 총 수업시간의 1/6 경과 전</th>
													<td>학습비의 5/6에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/6 이상부터 1/3 미만까지의 기간 동안</th>
													<td>학습비의 2/3에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/3 이상부터 1/2 미만까지의 기간 동안</th>
													<td>학습비의 1/2에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/2 이상 경과</th>
													<td>반환하지 않음</td>
												</tr>
											</table>
										</div>
										<li>에듀빅 학습자의 부주의로 발생한 어떠한 손해에 관하여 책임을 지지 아니합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;* 수강료는 대금의 결제와 동일한 방법으로 환불됩니다.<br>
									    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 단, 동일한 방법으로 환급이 불가능할 때는 이용자가 원하는 방법으로 환급합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;* 환불일 : 환불신청일로부터 7일 이내
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<!-- 3D프린팅모델링자격 2급 -->
				<c:if test='${REQUEST_DATA.courseno == 4}'>
					<div class="cont_sub cont4_back">
						<div class="wrapper">
							<img src="/cmmn/images/cont4_img4.png" alt="취업분야">
						</div>
					</div>
					<div class="cont_sub" style="background:#fff;">
						<div class="wrapper">
							<img src="/cmmn/images/cont4_img2.png" alt="학습안내1">
						</div>
					</div>
					<div class="cont_sub" style="background:#F5F5F5;">
						<div class="wrapper">
							<img src="/cmmn/images/cont4_img3.png" alt="학습안내2">
						</div>
					</div>
					<div class="cont_sub" style="background:#1E2024;">
						<div class="wrapper">
							<img src="/cmmn/images/cont4_img1.png" alt="IEQ인터넷윤리지도사">
							<a onclick="frmSubmit();" class="cont_btn cont4_btn pntr">
								<span class="pointer"></span>
							</a>
						</div>
					</div>
					<c:if test="${not empty reviewList}">
						<div class="cont_sub" style="background:#FDFDE5;">
							<div class="wrapper">
								<img src="/cmmn/images/cont_review.png" alt="수강후기">
								<div class="cont_reviews_list">
									<c:forEach items="${reviewList}" var="result">
										<div class="cont_reviews_slide">
											<input type="hidden" id="rvScore" name="rvScore" value="<c:out value="${result.SCORE}"/>"/>
											<div class="cont_reviews_box">
												<h5><c:out value="${result.COURSETITLE}"/></h5>
												<span><c:out value="${result.CONTENT}"/></span>
												<h3><c:out value="${result.WRITER}"/></h3>
												<h3><c:out value="${result.WDATE}"/></h3>
												<p>
													<c:forEach var="j" begin="1" end="5">
														<span class="starR <c:if test="${j <= result.SCORE}">on</c:if>"></span>
													</c:forEach>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</c:if>
					<div class="cont_txt">
						<div class="wrapper">
							<div class="cont_body">
								<p class="title">이용안내 및 유의사항</p>
								<div class="c_section">
									<h4 class="c_tit">상품소개</h4>
									<ul class="c_txtlist">
										<li>3D프린팅모델링자격2급 온라인 강의는 총 24차시로 구성되어 있습니다.</li>
										<!-- <li>패키지 구매 시 공식수험서(수험서 내 응시료 할인권 내포)와 기출문제집이 포함되어 있습니다.</li> -->
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">수강기간</h4>
									<ul class="c_txtlist">
										<li>결제일로부터 30일 동안 수강이 가능합니다.</li>
										<li>서버점검 또는 시스템오류 발생 시 점검시간은 수강기간에서 제외됩니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">교재배송안내</h4>
									<ul class="c_txtlist">
										<li>오후 3시까지 주문건에 한해 당일발송 됩니다.</li>
										<li>택배사 사정(명절연휴 등)에 따라 배송이 지연될 수 있습니다.</li>
									</ul>
								</div>
								<div class="c_section">
									<h4 class="c_tit">환불규정</h4>
									<ul class="c_txtlist">
										<li>교육훈련기관의 장은 다음 각 호의 어느 하나에 해당하는 경우에는 별도의 반환 기준에 따라 이미 납부한 학습비를 반환하여야 합니다.<br><br>
										  1. 과오납의 경우<br>
										  2. 학습자가 「병역법」에 따른 병역 의무를 이행하기 위하여 군에 입대하는 경우 등 법령에 의하여 학습을 계속할 수 없는 경우<br>
										  3. 학습자가 학습 포기의 의사를 표시한 경우<br>
										  4. 학습자가 본인의 질병·사망 또는 천재지변이나 그 밖의 부득이한 사유로 학습을 시작하지 아니하거나 학업을 계속하지 못하게 된 경우
										</li>
										<div class="table_style_row" style="margin: 18px 0;">
											<table>
												<colgroup>
													<col width="50%" class="col3_1"/>
													<col width="50%"/>
												</colgroup>
												<tr>
													<th>결제일 ~ 수업 시작일 전까지</th>
													<td>학습비 전액</td>
												</tr>
												<tr>
													<th>수업 시작일부터 총 수업시간의 1/6 경과 전</th>
													<td>학습비의 5/6에 해당하는 금액</td>
												</tr>
												<tr>
													<th>총 수업시간의 1/6 이상부터 1/3 미만까지의 기간 동안</th>
													<td>학습비의 2/3에 해당하는 금액</td>				
												</tr>
												<tr>
													<th>총 수업시간의 1/3 이상부터 1/2 미만까지의 기간 동안</th>
													<td>학습비의 1/2에 해당하는 금액</td>					
												</tr>
												<tr>
													<th>총 수업시간의 1/2 이상 경과</th>
													<td>반환하지 않음</td>						
												</tr>
											</table>
										</div>
										<li>에듀빅 학습자의 부주의로 발생한 어떠한 손해에 관하여 책임을 지지 아니합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;* 수강료는 대금의 결제와 동일한 방법으로 환불됩니다.<br>
									    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 단, 동일한 방법으로 환급이 불가능할 때는 이용자가 원하는 방법으로 환급합니다.<br>
										&nbsp;&nbsp;&nbsp;&nbsp;* 환불일 : 환불신청일로부터 7일 이내
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<!--// container -->
		
		<!-- 하단고정배너 -->
		<div class="cont_apply bottom_btn0<c:out value="${REQUEST_DATA.courseno}"/>">
			<div class="wrapper">
				<c:if test="${REQUEST_DATA.courseno == 1 || REQUEST_DATA.courseno == 2}">
					<a onclick="popOpen();" class="pntr">
				</c:if>
				<c:if test="${REQUEST_DATA.courseno == 3 || REQUEST_DATA.courseno == 4}">
					<a onclick="frmSubmit();" class="pntr">
				</c:if>
					<img src="/cmmn/images/apply_btn0<c:out value="${REQUEST_DATA.courseno}"/>.png" alt="수강신청">
				</a>
			</div>
		</div>
		
		<!-- 팝업 -->
		<div id="layer_pop" class="layer_popup">
			<div class="layer_head">
				신청할 유형을 선택해주세요.
				<a onclick="popClose();" class="layer_close pntr">닫기</a>
			</div>
			<div class="layer_body">
				<c:if test="${isBargain eq 'Y'}">
				    <a onclick="frmSubmitPop(1);" class="popup_btn01 pntr"></a>
					<a onclick="frmSubmitPop(2);" class="popup_btn02 pntr"></a>
				</c:if>
				<c:if test="${isBargain eq 'N'}">
				    <a onclick="frmSubmitPop(3);" class="popup_btn01 pntr"></a>
					<a onclick="frmSubmitPop(4);" class="popup_btn02 pntr"></a>
				</c:if>
			</div>
		</div>
		<div class="layer_dim"></div>
	</div>
	
	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->	
</body>
</html>