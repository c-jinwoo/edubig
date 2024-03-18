<%
/****************************************
    subject : 온라인서점
    summary : 온라인서점
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 온라인서점</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
</style>
<script type="text/javascript">	
	function bookView(bno){
		$("#bookNo").val(bno);	
		$("#frm").submit();
	}	
</script>
</head>
<body>	
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->
	
	<form name="frm" id="frm" method="post" action="/book/view.do">
		<input type="hidden" id="bookNo" name="bookNo" value=""/>
	</form>	
	<!-- container -->
	<div id="container">
		<div class="con_center">	
			<div class="cont_title_wrapper">
				<div class="wrapper">
					<h3 class="cont_title">온라인서점</h3>
				</div>			
			</div>			
			<div id="content">
				<div class="wrapper">		
					<div class="cont_body">
						<div class="course_wrapper">
							<h3 class="cont_title">경영빅데이터분석사</h3>
							<div class="book_list_box">
								<ul class="book_list">
									<c:forEach items="${listData}" var="result">
										<c:if test="${result.BOOKCATENO == 1}">										
											<li>
												<div class="inbox" style="cursor:pointer;" onClick="bookView('<c:out value="${result.BOOKNO}"/>');">
													<img style="width:100%;height:auto;" src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
													<div class="info">
														<p class="main_book_slide_title"><c:out value="${result.TITLE}"/></p>
														<c:if test="${not empty result.PRICE}">
															<p class="main_book_slide_vprice"><c:out value="${result.PRICE}"/>원</p>
														</c:if>
														<p class="main_book_slide_rprice"><c:out value="${result.PRICE_REAL}"/>원</p>
													</div>
												</div>
											</li>							
										</c:if>											
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="course_wrapper">
							<h3 class="cont_title">IEQ인터넷윤리지도사</h3>
							<div class="book_list_box">
								<ul class="book_list">
									<c:forEach items="${listData}" var="result">
										<c:if test="${result.BOOKCATENO == 2}">										
											<li>
												<div class="inbox" style="cursor:pointer;" onClick="bookView('<c:out value="${result.BOOKNO}"/>');">
													<img style="width:100%;height:auto;" src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
													<div class="info">
														<p class="main_book_slide_title"><c:out value="${result.TITLE}"/></p>
														<c:if test="${not empty result.PRICE}">
															<p class="main_book_slide_vprice"><c:out value="${result.PRICE}"/>원</p>
														</c:if>
														<p class="main_book_slide_rprice"><c:out value="${result.PRICE_REAL}"/>원</p>
													</div>
												</div>
											</li>							
										</c:if>											
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="course_wrapper">
							<h3 class="cont_title">기타</h3>
							<div class="book_list_box">
								<ul class="book_list">
									<c:forEach items="${listData}" var="result">
										<c:if test="${result.BOOKCATENO == 0}">										
											<li>
												<div class="inbox" style="cursor:pointer;" onClick="bookView('<c:out value="${result.BOOKNO}"/>');">
													<img style="width:100%;height:auto;" src="/att_file/book/<c:out value="${result.SAVFILE}"/>" alt="<c:out value="${result.TITLE}"/>"/>
													<div class="info">
														<p class="main_book_slide_title"><c:out value="${result.TITLE}"/></p>
														<c:if test="${not empty result.PRICE}">
															<p class="main_book_slide_vprice"><c:out value="${result.PRICE}"/>원</p>
														</c:if>
														<p class="main_book_slide_rprice"><c:out value="${result.PRICE_REAL}"/>원</p>
													</div>
												</div>
											</li>							
										</c:if>											
									</c:forEach>
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