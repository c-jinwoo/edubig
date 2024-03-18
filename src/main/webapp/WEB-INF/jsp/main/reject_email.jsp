<%
/****************************************
    subject : 전체메뉴
    summary : 전체메뉴 > 이용안내 > 이용약관
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
					<h3 class="cont_title">이메일무단수집거부</h3>
				</div>			
			</div>			
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<div class="c_section">						
							<div class="agreement height" tabindex="0">
								<p>
									웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, 이를 위반 시 정보통신망법에 의해 형사처벌 됨을 유념해주시기 바랍니다.
									<br/>
									</br/>
									게시일 2021.01.01
								</p>
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