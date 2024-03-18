<%
/****************************************
    subject : 강사 > 메인
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 강사소개</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	<!-- 이미지맵 반응형 -->
	<script src="/cmmn/js/jquery.rwdImageMaps.min.js"></script>
	<script type="text/javascript">	
		$(document).ready(function(){
			$('img[usemap]').rwdImageMaps();		
		});
		function fnSubmit(type, courseno, val){				
			if(type == "course"){
				$("#frm").attr("action","/online/onlineEducationInfo.do");				
			}
			else if(type == "apply"){
				$("#frm").attr("action","/online/onlineDetailForm.do");				
			}
			$("#courseno").val(courseno);
			$("#frm").submit();
		}
	</script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->				
	<form name="frm" id="frm" method="post" action="">
		<input type="hidden" name="mtSubCode" id="mtSubCode" value=""/>
		<input type="hidden" name="mtScCode" id="mtScCode" value=""/>
		<input type="hidden" name="courseno" id="courseno" value=""/>
		<input type="hidden" name="seq" id="seq" value="1"/>														
	</form>		
	<!-- container -->
	<div id="container">
		<div class="con_center">	
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title">강사소개</h3>
				</div>			
			</div>
			
			<div id="content">
				<div class="wrapper">			
					<div class="cont_body">
						<div class="course_wrapper">
							<h3 class="cont_title">경영빅데이터분석사</h3>
							<div class="tutor_list_box">
								<ul class="tutor_list">
									<li class="img_box">
										<img src="/cmmn/images/bigdata_info01.png" alt="강사" usemap="#map1">
										<map id="map1" name="map1">
											<area class="tutor_btn_area" shape="rect" alt="" title="" coords="0,537,540,654" onclick="fnSubmit('course','1');" target=""><!-- 과정소개 -->
											<area class="tutor_btn_area" shape="rect" alt="" title="" coords="540,537,1080,654" onclick="fnSubmit('apply','1');" target=""><!-- 수강신청 -->
										</map>										
									</li>
								</ul>
							</div>
						</div>
						<div class="course_wrapper">
							<h3 class="cont_title">IEQ인터넷윤리지도사</h3>
							<div class="tutor_list_box">
								<ul class="tutor_list">
									<li class="img_box">
										<img src="/cmmn/images/bigdata_info02.png" alt="강사" usemap="#map2">
										<map id="map2" name="map2">
											<area class="tutor_btn_area" shape="rect" alt="" title="" coords="0,537,540,654" onclick="fnSubmit('course','2');" target=""><!-- 과정소개 -->
											<area class="tutor_btn_area" shape="rect" alt="" title="" coords="540,537,1080,654" onclick="fnSubmit('apply','2');" target=""><!-- 수강신청 -->
										</map>										
									</li>
								</ul>
							</div>
						</div>
						<div class="course_wrapper">
							<h3 class="cont_title">3D프린팅모델링1급</h3>
							<div class="tutor_list_box">
								<ul class="tutor_list">
									<li class="img_box">
										<img src="/cmmn/images/bigdata_info03.png" alt="강사" usemap="#map3">
										<map id="map3" name="map3">
											<area class="tutor_btn_area" shape="rect" alt="" title="" coords="0,537,540,654" onclick="fnSubmit('course','3');" target=""><!-- 과정소개 -->
											<area class="tutor_btn_area" shape="rect" alt="" title="" coords="540,537,1080,654" onclick="fnSubmit('apply','3');" target=""><!-- 수강신청 -->
										</map>										
									</li>
								</ul>
							</div>
						</div>
						<div class="course_wrapper">
							<h3 class="cont_title">3D프린팅모델링2급</h3>
							<div class="tutor_list_box">
								<ul class="tutor_list">
									<li class="img_box">
										<img src="/cmmn/images/bigdata_info04.png" alt="강사" usemap="#map4">
										<map id="map4" name="map4">
											<area class="tutor_btn_area" shape="rect" alt="" title="" coords="0,537,540,654" onclick="fnSubmit('course','4');" target=""><!-- 과정소개 -->
											<area class="tutor_btn_area" shape="rect" alt="" title="" coords="540,537,1080,654" onclick="fnSubmit('apply','4');" target=""><!-- 수강신청 -->
										</map>										
									</li>
								</ul>
							</div>
						</div>
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