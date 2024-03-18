<%
/****************************************
    subject : 신용상담사
    summary : 신용상담사 : 시험안내
    author  : SANGS
    date    : 2018-06-15
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/ccrs/cmmn/inc/taglib_inc.jsp"%>
<%@ page import="com.sangs.support.DataMap"%>
<%@ page import="com.sangs.support.EduMap"%>
<%@ page import="com.sangs.support.SangsProperties" %>
<%@ page import="com.sangs.util.ParamUtil"%> 
<%@ page import="com.sangs.util.NumberFormatUtil"%>
<%@ page import="com.sangs.util.StringUtil"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title><c:if test="${REQUEST_DATA.bcateno eq '1010'}">공지사항</c:if>
					<c:if test="${REQUEST_DATA.bcateno ne '1010'}">자료실</c:if> > 강의실 > 나의학습실 > 신용회복위원회 신용교육원</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
</head>
<body>
<!-- skip nav -->
	<%@ include file="/WEB-INF/jsp/inc/nav_inc.jsp"%>
<!--// skip nav -->

<script type="text/javascript">
	
	// 페이징 이동 함수
	function fnList() {
		//$('#bbsForm').attr('target', '_self').attr('action', '/classdesk/bbs/list.do').submit();
		
		$('#bbsForm').attr('action', '/myclass/learningClassList.do').submit();
		
	}
	
	//파일다운로드
	function filedown(fileId, bbsNo, fileSeq){
		var frm = document.bbsForm;
		frm.fileId.value = fileId;
		frm.bbsNo.value = bbsNo;
		frm.fileSeq.value = fileSeq;
		$('#bbsForm').attr('action', '/academy/classdeskFiledown.do').submit(); 
	}
	
	//다음버튼 클릭
	function nextClick(bbsNo){
		if(bbsNo.length != 0){
			$("#bbsNo").val(bbsNo);
			$("#bbsForm").attr("action", "/myclass/view.do").submit();
		}else{
			alert("처음페이지 입니다.");
			return;
		}
	}

	//이전버튼 클릭
	function prevClick(bbsNo){
		if(bbsNo.length != 0){
			$("#bbsNo").val(bbsNo);
			$("#bbsForm").attr("action", "/myclass/view.do").submit();
		}else{
			alert("마지막페이지 입니다.");
			return;
		}
	}
</script>


<div id="wrap">

	<!-- header -->
	<%@ include file="/WEB-INF/jsp/inc/header_inc.jsp"%>
	<!--// header -->

	<!-- container -->
	<div id="container">

		<!-- location -->
		<jsp:include page="/WEB-INF/jsp/inc/location/loc_06_01.jsp"> 
		  	<jsp:param name="menuNm" value="강의실"/> 
		</jsp:include> 
		<!--// location -->

		<div class="con_center">

			<!-- lnb -->
			<div id="lnb">
				<jsp:include page="/WEB-INF/jsp/inc/lnb/lnb_06.jsp"> 
				  	<jsp:param name="dep2" value="02"/>
				</jsp:include> 
			</div>
			<!--// lnb -->
			<!-- content 본문 -->
			<div id="content">
				<form id="bbsForm" name="bbsForm"  method="post">
					<input type="hidden" name="cPage"  id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
					<input type="hidden" name="searchWord" id="searchWord" value="<c:out value="${REQUEST_DATA.searchWord}"/>"/>
					<input type="hidden" name="pbcateno" id="pbcateno" value="<c:out value="${REQUEST_DATA.pbcateno}"/>"/>
					<input type="hidden" name="bcateno"  id="bcateno" 	value="<c:out value="${REQUEST_DATA.bcateno}"/>"/> 
					<input type="hidden" name="bbsNo"  id="bbsNo" value="<c:out value="${rowData.BBSNO}" />"/>
					<input type="hidden" name="fileId"  id="fileId" value=""/>
					<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
					<input type="hidden" name="lnb_menu" id="lnb_menu" value="${lnb_menu}"/>
					<input type="hidden" name="CLASSDESK" id="CLASSDESK" value="${REQUEST_DATA.CLASSDESK}">
					<%-- <input type="hidden" name="select" id="select" value="<c:out value="${REQUEST_DATA.select}"/>"/> --%>
					<input type="hidden" name="seqTitle" id="seqTitle" value="<c:out value="${REQUEST_DATA.seqTitle}"/>"/>
					<input type="hidden" name="ctypeName" id="ctypeName" value="<c:out value="${REQUEST_DATA.ctypeName}"/>"/>
				 	<input type="hidden" id="courseSelect" name="courseSelect" value="<c:out value="${REQUEST_DATA.courseSelect}"/>"/>

				 	
				 	<input type="hidden" name="cuserno" id="cuserno" value="${REQUEST_DATA.SES_CUSERNO}">
				 	<input type="hidden" name="courseno" id="courseno" value="${REQUEST_DATA.SES_COURSENO}">
					<input type="hidden" name="searchCseqno" id="searchCseqno" value="${REQUEST_DATA.SES_CSEQNO}">
				</form>
				
				
				<!-- 기존 START 2018-08-30  -->
<!-- 				<h3 class="cont_titile"> -->
<%-- 					<c:if test="${REQUEST_DATA.bcateno eq '1010'}">공지사항</c:if> --%>
<%-- 					<c:if test="${REQUEST_DATA.bcateno ne '1010'}">자료실</c:if> --%>
<!-- 				</h3> -->
				<!-- 기존 END 2018-08-30  -->
				
				<!-- 2018-08-28 김동인 작업 S --> 
				<c:if test="${REQUEST_DATA.bcateno eq '1010'}"><h3 class="cont_titile type06">공지사항<span></span></h3></c:if>
				<c:if test="${REQUEST_DATA.bcateno ne '1010'}"><h3 class="cont_titile type06">자료실<span></span></h3></c:if>
				<!-- 2018-08-28 김동인 작업 E -->
				<!-- 본문내용 -->
				<div class="cont_body">
					<!-- start -->

					<div class="c_section">
						
						<div class="board_view">
							<div class="b_info">
								<div class="line">
									<dl>
										<dt>제목</dt>
										<dd><c:out value="${rowData.TITLE}"/></dd>
									</dl>
								</div>
								<div class="line">
									<dl>
										<dt>작성일</dt>
										<dd><c:out value="${rowData.WDATE}"/></dd>
									</dl>
									<dl>
										<dt>조회수</dt>
										<dd><c:out value="${rowData.RCNT}"/></dd>
									</dl>
								</div>
								<div class="line">
									<dl class="wid100">
										<dt>첨부파일</dt>
										<dd>
										<c:choose>
											<c:when test="${empty listData}">
												<div class="file_box">
													첨부파일이 없습니다.
												</div>
											</c:when>
											<c:when test="${not empty listData}">
												<div class="file_box">
													<c:forEach items="${listData}" var="result" varStatus="status">
														<a href="#" onclick="filedown('<c:out value="${result.FILE_ID}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.FILE_SEQ}" />');return false;" title="다운로드">
															<c:out value="${result.ORGFILE}"/><br>
														</a>
													</c:forEach>
												</div>
											</c:when>
										</c:choose>
										</dd>
									</dl>
								</div>
							</div>

							<div class="b_content">
								<p>
									<c:out value="${rowData.CONTENT}" escapeXml="false"/>
								</p>
							</div>

							<div class="c_btn_right02">
								<a href="#" class="btn_blueline03" onclick="fnList();return false;">목록</a>
							</div>
							
							<%-- <ul class="prev_next">
								<li>
									<span class="view_prev">이전글</span>
									<div class="view_title_box">
										<c:choose>
											<c:when test="${rowData.BBSNO_PREV_TITLE eq null or rowData.BBSNO_PREV_TITLE eq ''}">
												<p class="view_title">이전글이 없습니다.</p>
											</c:when>
											<c:when test="${rowData.BBSNO_PREV_TITLE ne null or rowData.BBSNO_PREV_TITLE ne ''}">
												<a href="#none" onclick="prevClick('<c:out value="${rowData.BBSNO_PREV}"/>');return false" class="view_title"><c:out value="${rowData.BBSNO_PREV_TITLE}"/></a>
											</c:when>
										</c:choose>
									</div>
								</li>
								<li>
									<span class="view_next">다음글</span>
									<div class="view_title_box">
										<c:choose>
											<c:when test="${rowData.BBSNO_NEXT_TITLE eq null or rowData.BBSNO_NEXT_TITLE eq ''}">
												<p class="view_title">다음글이 없습니다.</p>
											</c:when>
											<c:when test="${rowData.BBSNO_NEXT_TITLE ne null or nrowData.BBSNO_NEXT_TITLE ne ''}">
												<a href="#" onclick="nextClick('<c:out value="${rowData.BBSNO_NEXT}"/>');return false" class="view_title">
													<c:out value="${rowData.BBSNO_NEXT_TITLE}"/>
												</a>
											</c:when>
										</c:choose>
									</div>
								</li>
							</ul> --%>
						</div>

					</div>

					<!--// end -->
				</div>
				<!--// 본문내용 -->
				
			<!--  -->
			</div>
			<!--// content 본문 -->
			
		</div>
	</div>
	<!--// container -->

	<!-- foot -->
	<%@ include file="/WEB-INF/jsp/inc/footer_inc.jsp"%>
	<!--// foot end -->

</div>

</body>
</html>