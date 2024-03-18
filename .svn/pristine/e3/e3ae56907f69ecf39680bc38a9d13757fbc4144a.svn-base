<%
/****************************************************
	system	: 이벤트 상세보기
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 이벤트</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	<!-- 이미지맵 반응형 -->
	<script src="/cmmn/js/jquery.rwdImageMaps.min.js"></script>
	<script type="text/javascript">	
		$(document).ready(function(){
			$('img[usemap]').rwdImageMaps();
		});
	</script>
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
					<h3 class="cont_title">이벤트</h3>
				</div>
			</div>
			<form name="frm" id="frm" action="" method="post">
				<input type="hidden" name="bcateno" id="bcateno" value="<c:out value='${REQUEST_DATA.bcateno}'/>"/>
				<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
				<input type="hidden" name="SES_USERNO" id="SES_USERNO" value="${REQUEST_DATA.SES_USERNO}"/>				
			</form>
			<div id="content">
				<div class="wrapper">
					<!-- 본문내용 -->
					<div class="cont_body">
						<!-- start -->	
						<div class="c_section">							
							<div>	
								<c:out value="${rowData.CONTENT}"  escapeXml="false"/>
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