<%
/****************************************
    subject : 게시판 QnA
****************************************/
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/inc/taglib_inc.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>에듀빅 :: QnA</title>
	<%@ include file="/WEB-INF/jsp/inc/head_inc.jsp"%>	
	<script type="text/javascript">	
		//상세보기
		function fnView(bcateno, bbsNo){
			$("#bbsNo").val(bbsNo);
			$("#bcateno").val(bcateno);
			$("#frm").attr("action", "/bbs/qna/view.do").submit();
		}		
		// 등록
		function fnMoveForm(type) {
			$("#type").val(type);
			$("#frm").attr("action", "/bbs/qna/form.do");
			$("#frm").submit();
		}	
		function move_page(cPage){
			$('#cPage').val(cPage);
			$('form[name=frm]').attr('action', '/bbs/qna/main.do').submit();			
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
					<h3 class="cont_title">QnA</h3>
				</div>			
			</div>
			
			<!-- content 본문 -->
			<div id="content">			
				<div class="wrapper">	
					<div class="cont_body">
						<div class="c_section">
							<form name="frm" id="frm" action="" method="post">
								<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
								<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
								<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
								<input type="hidden" name="type" id="type" value=""/>
							</form>
							<br/><br/>
							<div class="board_list">
								<table>
									<colgroup>
										<col width="15%"/>
										<col width=""/>
										<col width="20%" class="btn_col" />
									</colgroup>
									<thead class="alt_text">
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목, 등록일, 작성자, 조회수, 첨부파일여부</th>
											<th scope="col">답변여부</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty listData}">
											<c:forEach items="${listData}" var="result" varStatus="status">
												<tr>
													<td><strong class="fnt16 po_C7">${resultCount-(REQUEST_DATA.cPage-1)*10-status.count+1}</strong></td>
													<td class="align_left">
														<div class="tit">
															<c:choose>
																<c:when test="${REQUEST_DATA.bcateno eq '10'}"> 
																	<!-- 자유게시판 -->
																	<a href="page.html" onclick="fnView('<c:out value="${REQUEST_DATA.bcateno}"/>','<c:out value="${result.BBSNO}"/>'); return false;" class="ico_cmt"><c:out value="${result.TITLE}"/>
																		<div class="cmt_cnt">
																			<span class="alt_text">댓글수</span>
																			<span class="cnt">${result.CMTCOUNT}</span>
																		</div>
																	</a>
																</c:when>
																<c:otherwise>
																	<a href="#" onclick="fnView('<c:out value="${REQUEST_DATA.bcateno}"/>','<c:out value="${result.BBSNO}"/>'); return false;"><c:out value="${result.TITLE}"/></a>
																</c:otherwise>
															</c:choose>
														</div>
														<span class="t_c t_wr">작성자<span class="dd"><c:out value="${result.WRITER}" /></span></span>
														<span class="t_c">등록일<span class="dd"><c:out value="${result.WDATE}" /></span></span>
													</td>
													<td class="btn_col">
														<c:if test="${result.ANYN eq 'Y'}"><span class="btn_blueline">답변완료</span></c:if>
														<c:if test="${result.ANYN eq 'N'}"></c:if>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										
										<c:if test="${empty listData}">
											<tr>
												<td colspan="3">등록된 글이 없습니다.</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
							
							<c:if test="${not empty listData}">
								<div class="paging">
									<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page" />
								</div>
							</c:if>
							
							<br><br>
							<div class="c_btn_right03">
								<button onclick="fnMoveForm('insert'); return false;" class="btn_bluebg03">등록</button>
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