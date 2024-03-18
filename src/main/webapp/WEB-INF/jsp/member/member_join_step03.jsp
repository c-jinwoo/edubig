﻿<%
/****************************************
    subject : 회원가입
    summary : 회원가입 : 회원가입 완료
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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
					<h3 class="cont_title">회원가입</h3>
				</div>			
			</div>		
			<div id="content">
				<div class="wrapper">	
					<div class="cont_body">
						<div class="c_section">
							<div class="c_head_step">
								<ol>
									<li><span class="num_wrap"><span class="num">1. </span>인증</span></li>
									<li><span class="num_wrap"><span class="num">2. </span>정보등록</span></li>
									<li class="on"><span class="num_wrap"><span class="num">3. </span>가입완료</span></li>
								</ol>
							</div>
						</div>										
						<div class="c_msg_box column mgt_first">
							<div class="img_cpt_talk">
								<strong>회원가입이 완료되었습니다.</strong>
								<p>에듀빅에 가입되셨습니다.<br />로그인을 통해 다양한 혜택을 누릴 수 있습니다.</p>
							</div>
						</div>	
						<div class="c_btn_center">
							<button onclick="location.href='/user/login.do'" class="btn_bluebg03">로그인</button>
							<button onclick="location.href='/main/main.do'" class="btn_blueline03">홈으로</a>
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