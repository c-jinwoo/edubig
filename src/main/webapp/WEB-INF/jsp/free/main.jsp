<%
/****************************************
    subject : 무료강의 > 메인
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 무료강의</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
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
					<h3 class="cont_title">무료강의</h3>
				</div>			
			</div>
			
			<div id="content">
				<div class="wrapper">			
					<div class="cont_body">
						<div class="course_wrapper">
							<div class="vid_wrapper">
								<h3 class="cont_title">경영빅데이터분석사</h3>
								<div class="vid_list_box">
									<ul class="vid_list">
										<div class="vid_free_vid">
											<iframe width="100%" height="100%" src="https://www.youtube.com/embed/JvEmpzx86J8"  frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
									</ul>
								</div>
							</div>
						</div>
						<div class="course_wrapper">
							<div class="vid_wrapper">
								<h3 class="cont_title">IEQ인터넷윤리지도사</h3>
								<div class="vid_list_box">
									<ul class="vid_list">
										<div class="vid_free_vid">
											<iframe width="100%" height="100%" src="https://www.youtube.com/embed/4riNlBiKohE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
									</ul>
								</div>
							</div>
						</div>
						<div class="course_wrapper">
							<div class="vid_wrapper">
								<h3 class="cont_title">3D프린팅모델링</h3>
								<div class="vid_list_box">
									<ul class="vid_list">
										<div class="vid_free_vid">
											<iframe width="100%" height="100%" src="https://www.youtube.com/embed/9Ps_UHmS5wQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
									</ul>
								</div>
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