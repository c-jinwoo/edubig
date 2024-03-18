<%
/****************************************
    subject : 리뷰
    summary : 리뷰
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 수강후기</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
</style>
<script type="text/javascript">	
	$(document).ready(function(){		
		$(".reviews_box").each(function(){
			var appendHTML = "";
			var star = $(this).find("#rvScore").val();
			for(var i=0;i<5;i++){
				if(i < star){
					appendHTML += "<span class='starR on'></span>";
				}
				else{
					appendHTML += "<span class='starR'></span>";					
				}				
			}						
			$(this).find("p").append(appendHTML);
		});
		
		$(".reviews_wrapper:first-child").show();
	});
	
	$(window).scroll(function(){
		if($(window).scrollTop() >= ($(document).height() - $(window).height())){
			var currentIdx = 0;
			$(".reviews_wrapper").each(function(i){
				if($(this).css("display") == "block"){
					currentIdx = i+1;
				}
			});
			if($(".reviews_wrapper").length > currentIdx){
				$(".reviews_wrapper:nth-child("+(currentIdx+1)+")").show();
			}
		}
	});
	
	function frmSubmit(){
		$("#frm").submit();
	}
</script>
</head>
<body>	
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->
	
	<form name="frm" id="frm" method="post" action="/review/main.do">
		<!-- container -->
		<div id="container">
			<div class="con_center">	
				<div class="cont_title_wrapper">
					<div class="wrapper">
						<h3 class="cont_title">수강후기</h3>
					</div>			
				</div>			
				<div id="content">
					<div class="wrapper">		
						<div class="cont_body">
							<div class="c_search_section">
								<fieldset>
									<legend>게시판 검색영역</legend>
									<select class="reviews_menu" name="courseno">
										<option value="">전체</option>
										<c:forEach items="${courseList}" var="result" varStatus="stat">		
											<option value="<c:out value="${result.COURSENO}"/>" <c:if test="${result.COURSENO eq REQUEST_DATA.courseno}">selected</c:if>><c:out value="${result.COURSETITLE}"/></option>
										</c:forEach>							
									</select>
									<button type="submit" onclick="frmSubmit();return false;" class="btn_search">검색하기</button>
								</fieldset>
							</div>
							<div class="reviews_list">
								<c:if test="${not empty list_data}">
									<c:forEach items="${list_data}" var="result" varStatus="stat">
										<c:if test="${stat.index % 10 == 0}">
											<div class="reviews_wrapper">
										</c:if>
											<div class="reviews_box" >
												<input type="hidden" id="rvScore" name="rvScore" value="<c:out value="${result.SCORE}"/>"/>									
												<div class="reviews_box_cont">
													<div class="reviews_header">
														<h5><c:out value="${result.COURSETITLE}"/></h5>
														<span><c:out value="${result.WRITER}"/></span>
														<span><c:out value="${result.WDATE}"/></span>
														<p></p>
													</div>
													<div class="reviews_cont">
														<c:out value="${result.CONTENT}"/>
													</div>
												</div>
											</div>
										<c:if test="${stat.index % 10 == 9}">
											</div>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${empty list_data}">
									<div class="reviews_box" style="border:0;box-shadow:none;">					
										<div class="reviews_box_cont" style="color:#000;text-align:center;font-size: 15px;">
											등록된 후기가 없습니다.
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
		<!--// container -->
	</form>
	
	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->
</body>
</html>