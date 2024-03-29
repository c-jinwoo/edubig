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
		function fnView(bcateno, bbsNo){
			$("#bbsNo").val(bbsNo);
			$("#bcateno").val(bcateno);	
			$("#frm").attr("action" , "/bbs/notice/view.do").submit();
		}
		function move_page(cPage){
			$('#cPage').val(cPage);
			$('form[name=frm]').attr("action", "/bbs/notice/main.do").submit();		
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
			<div id="content">
				<div class="wrapper">
					<div class="cont_body">
						<form name="frm" id="frm" action="" method="post">
							<input type="hidden" name="cPage" id="cPage" value="<c:out value="${REQUEST_DATA.cPage}"/>"/>
							<input type="hidden" name="bbsNo" id="bbsNo" value=""/>
							<input type="hidden" name="bcateno" id="bcateno" value="${REQUEST_DATA.bcateno}"/>
							<div class="c_section">	
								<div class="board_list">
									<table>
										<caption>공지사항 리스트 - 번호, 제목, 등록일, 조회수, 첨부파일 여부로 구성된 표</caption>
										<colgroup>
											<col width="15%"/>
											<col width=""/>
										</colgroup>
										<thead class="alt_text">
											<tr>
												<th scope="col">번호</th>
												<th scope="col">제목, 등록일, 조회수, 첨부파일여부</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listData}" var="result" varStatus="status">
												<tr>
													<c:if test="${result.TOPYN eq 'Y'}">
														<td><strong class="fnt16 po_C2">[공지]</strong></td>
													</c:if>
													<c:if test="${result.TOPYN ne 'Y'}">
														<td><strong class="fnt16 po_C7">${resultCount-(REQUEST_DATA.cPage-1)*10-status.count+1}</strong></td>
													</c:if>
													<td class="align_left">
														<div class="tit"><a href="#" onclick="fnView('<c:out value="${REQUEST_DATA.bcateno}"/>', '<c:out value="${result.BBSNO}"/>'); return false;" title="<c:out value='${result.TITLE}'/>">${result.TITLE}</a></div>														
														<span class="t_c">조회수<span class="dd"><c:out value="${result.RCNT}"/></span></span>
														<span class="t_c">등록일<span class="dd"><c:out value='${result.WDATE}'/></span></span>
														<c:if test="${result.FILECNT > 0}">
															<span class="t_c"><img src="/cmmn/images/sub/ico_board_file.png" alt="첨부파일있음" /></span><!-- 첨부파일 있을시 -->
														</c:if>
													</td>
												</tr>
											</c:forEach>
											<c:if test="${empty listData}">
											<tr><td colspan="2">등록된 글이 없습니다.</td></tr>
											</c:if>
										</tbody>
									</table>
								</div>
								
								<c:if test="${not empty listData}">
									<div class="paging">
										<paging:page cpage="${REQUEST_DATA.cPage}" total="${resultCount}" pageSize="${REQUEST_DATA.rowCount}" link="javascript:move_page" />
									</div>
								</c:if>
							</div>
						</form>
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