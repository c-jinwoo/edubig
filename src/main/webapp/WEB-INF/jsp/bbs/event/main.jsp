<%
/****************************************************
	system	: 고객센터 > 이벤트
	title	: 게시판 목록
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 이벤트</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>	
	<script type="text/javascript">
	function fnView(bbsNo){
		$("#bbsNo").val(bbsNo);
		$("#frm").submit();
	}
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
			<div id="content">
				<div class="wrapper">	
					<div class="cont_body">
						<form name="frm" id="frm" action="/bbs/event/view.do" method="post">
							<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
							<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>	
						</form>
						<div class="course_wrapper">
							<ul class="event_list">
								<c:forEach items="${listData}" var="result">									
									<li>
										<div class="inbox" style="cursor:pointer;" onClick="fnView(<c:out value="${result.BBSNO}"/>);">
											<img src="/att_file/edbbs/<c:out value="${result.BBSNO}"/>/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
											<div class="info">
												<p class="event_title">
													<c:out value="${result.TITLE}"/>
													</br>
													<span style="color:#b9b9b9;font-weight: bold;font-size: 15px;">
														~ <c:out value="${result.EVENT_EDATE}"/>
													</span>
												</p>
											</div>
										</div>
									</li>		
								</c:forEach>
							</ul>
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