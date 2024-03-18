<%
/****************************************************
	system	: 공지사항
*****************************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: 공지사항</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>
	<script type="text/javascript">	
		//이전버튼 클릭
		function prevClick(bbsNo){
			if(bbsNo.length != 0){
				$("#bbsNo").val(bbsNo);
			    $('#frm').attr('action', '/bbs/notice/view.do').submit();
			}
			else{
				fnModalMsg("처음페이지 입니다.");
				return;
			}
		}
		//다음버튼 클릭
		function nextClick(bbsNo){
			if(bbsNo.length != 0){
				$("#bbsNo").val(bbsNo);
			    $('#frm').attr('action', '/bbs/notice/view.do').submit();
			}
			else{
				fnModalMsg("마지막페이지 입니다.");
				return;
			}
		}
		//목록 버튼 클릭
		function mainList(){
		    $('#frm').attr('action', '/bbs/notice/main.do').submit();
		}
		//파일다운로드
		function filedown(fileId, bbsNo, fileSeq){
			var form = document.frm;
			form.fileId.value = fileId;
			form.bbsNo.value = bbsNo;
			form.fileSeq.value = fileSeq;
			
			$("#frm").attr("action", "/bbs/notice/filedown.do").submit();
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
					<h3 class="cont_title">공지사항</h3>
				</div>
			</div>
			<form name="frm" id="frm" action="" method="post">
				<input type="hidden" name="bcateno" id="bcateno" value="<c:out value='${REQUEST_DATA.bcateno}'/>"/>
				<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
				<input type="hidden" name="mtCateCode" id="mtCateCode"  value="<c:out value='${REQUEST_DATA.mtCateCode}'/>">
				<input type="hidden" name="fileId" id="fileId" value=""/>
				<input type="hidden" name="fileSeq" id="fileSeq" value=""/>
				<input type="hidden" name="SES_USERNO" id="SES_USERNO" value="${REQUEST_DATA.SES_USERNO}"/>				
			</form>
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<div class="c_section">							
							<div class="board_view">	
								<div class="b_info">
									<div class="line">
										<dl style="width:100%;">
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
									<%-- <div class="line">
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
															<a href="#" onclick="filedown('<c:out value="${result.FILE_ID}" />' , '<c:out value="${result.BBSNO}" />', '<c:out value="${result.FILE_SEQ}" />');return false" title="다운로드">
																<c:out value="${result.FILE_NAME}"/><br>
															</a>
														</c:forEach>
													</div>
												</c:when>
											</c:choose>
											</dd>
										</dl>
									</div> --%>
								</div>
	
								<div class="b_content" style="word-wrap:break-word;">
									<p>
										<c:out value="${rowData.CONTENT}" escapeXml="false"/>
									</p>
								</div>	
								<div class="c_btn_right02">
									<a href="#" onclick="mainList();return false" class="btn_blueline03">목록</a>
								</div>								
								<ul class="prev_next">
									<li>
										<span class="view_prev">이전글</span>
										<div class="view_title_box">
											<c:if test="${prevData.TITLE eq null || prevData.TITLE eq ''}">
												<p class="view_title">이전글이 없습니다.</p>
											</c:if>
											<c:if test="${prevData.TITLE ne null || prevData.TITLE ne ''}">
												<a href="#" onclick="prevClick('<c:out value="${prevData.BBSNO}"/>', '<c:out value="${REQUEST_DATA.bcateno}"/>');return false" class="view_title">
													<c:out value="${prevData.TITLE}"/>
												</a>
											</c:if>
										</div>
									</li>
									<li>
										<span class="view_next">다음글</span>
										<div class="view_title_box">
											<c:if test="${nextData.TITLE eq null || nextData.TITLE eq ''}">
												<p class="view_title">다음글이 없습니다.</p>
											</c:if>
											<c:if test="${nextData.TITLE ne null || nextData.TITLE ne ''}">
												<a href="#" onclick="nextClick('<c:out value="${nextData.BBSNO}"/>', '<c:out value="${REQUEST_DATA.bcateno}"/>');return false" class="view_title">
													<c:out value="${nextData.TITLE}"/>
												</a>
											</c:if>
										</div>
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